@Timeout(Duration(minutes: 6))
library;

// Live integration tests against the real TorBox API.
//
// Run with:
//   TORBOX_API_KEY=<key> flutter test test/torbox_live_test.dart
// PowerShell:
//   $env:TORBOX_API_KEY='<key>'; flutter test test/torbox_live_test.dart
//
// READ-ONLY BY DESIGN: every call below is a GET that cannot mutate the
// account. Do NOT add POST/PUT/DELETE calls, requestdl links (metered),
// confirmation emails, token refreshes, or anything that creates state.
// The whole file is skipped when TORBOX_API_KEY is unset, so a plain
// `flutter test` run stays hermetic and offline.
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:torbox_api/torbox_api.dart';

String? get _apiKey {
  final key = Platform.environment['TORBOX_API_KEY'];
  return (key == null || key.isEmpty) ? null : key;
}

/// Runs a live call, rethrowing failures with the endpoint label, URL,
/// status, and detail so failures are attributable.
Future<T> _live<T>(String label, Future<T> future) async {
  try {
    return await future;
  } on TorboxApiException catch (e) {
    _failWithAttribution(label, e);
  }
}

/// Like [_live], but a server response whose envelope `error` code is in
/// [benignErrors] yields `null` instead of failing.
///
/// Use for documented server-side failures unrelated to client
/// correctness (e.g. DHT metadata timeouts, non-streamable items).
/// Anything else — including model deserialization errors, which surface
/// as non-[TorboxApiException] throws — still fails the test.
Future<T?> _liveOrNull<T>(
  String label,
  Future<T> future, {
  Set<String> benignErrors = const {},
}) async {
  try {
    return await future;
  } on TorboxApiException catch (e) {
    if (e.errorCode != null && benignErrors.contains(e.errorCode)) {
      return null;
    }
    _failWithAttribution(label, e);
  }
}

Never _failWithAttribution(String label, TorboxApiException e) {
  fail(
    '$label: ${e.uri} -> '
    'HTTP ${e.statusCode} [${e.errorCode}] ${e.detail ?? e.message}',
  );
}

void main() {
  group(
    'live API (read-only)',
    skip: _apiKey == null ? 'Set TORBOX_API_KEY to run live API tests' : null,
    () {
      late TorboxApi api;

      /// Torrent list shared by the tests below. Fetched once because
      /// mylist is the heaviest call on large accounts; tests run in
      /// declaration order so this is populated before use.
      late List<TorrentData> sharedTorrents;

      setUpAll(() async {
        api = TorboxApi(
          baseUrl: 'https://api.torbox.app/v1',
          // Non-null: the group is skipped entirely when the key is unset.
          token: _apiKey!,
          // Large accounts can take a minute or two on heavy endpoints
          // such as mylist; retries add further headroom on top.
          timeout: const Duration(minutes: 3),
          // Tolerant enough for ephemeral blips, lean enough that
          // deterministically-failing inputs (handled via benignErrors
          // below) don't burn minutes: 4 attempts, ~7s total backoff.
          maxAttempts: 3,
          retryDelay: const Duration(seconds: 1),
        );
        final mylist = await _live(
          'torrents/mylist',
          api.torrents.getTorrentList(limit: 10),
        );
        expect(mylist.success, isTrue, reason: mylist.detail);
        sharedTorrents = mylist.data ?? const <TorrentData>[];
      });

      test('torrent list parses', () async {
        expect(sharedTorrents, isA<List<TorrentData>>());
      });

      test('torrent detail endpoints parse', () async {
        final items = sharedTorrents;
        if (items.isEmpty) return; // nothing on the account to drill into

        final first = items.first;

        final hash = first.hash;
        if (hash != null && hash.isNotEmpty) {
          final cached = await _live(
            'torrents/checkcached',
            api.torrents.checkCachedAvailability(hashes: [hash]),
          );
          expect(cached.success, isTrue, reason: cached.detail);
        }

        // Metadata fetch depends on the BitTorrent DHT and routinely 500s
        // per hash (DOWNLOAD_SERVER_ERROR); try a couple of items before
        // treating it as environmental and moving on. `timeout` bounds the
        // server-side DHT wait per attempt so hopeless hashes fail fast.
        TorBoxResponse<TorrentInfoData>? info;
        for (final item in items.take(2)) {
          final h = item.hash;
          if (h == null || h.isEmpty) continue;
          info = await _liveOrNull(
            'torrents/torrentinfo',
            api.torrents.getTorrentInfo(hash: h, timeout: 15),
            benignErrors: {'DOWNLOAD_SERVER_ERROR'},
          );
          if (info != null) break;
        }
        if (info != null) {
          expect(info.success, isTrue, reason: info.detail);
          expect(info.data, isA<TorrentInfoData>());
        }

        final export = await _live(
          'torrents/exportdata',
          api.torrents.exportTorrentDataAsMagnet(torrentId: first.id),
        );
        expect(export.success, isTrue, reason: export.detail);
        expect(export.data, isA<String>());
        // This test fans out across retries and DHT lookups; it needs
        // more than the file-level default.
      }, timeout: const Timeout(Duration(minutes: 10)));

      test('usenet list parses', () async {
        final res = await _live(
          'usenet/mylist',
          api.usenet.getUsenetList(limit: 5),
        );
        expect(res.success, isTrue, reason: res.detail);
        expect(res.data, isA<List<UsenetDownloadData>>());

        final hashes = res.data!
            .map((e) => e.hash)
            .whereType<String>()
            .where((h) => h.isNotEmpty)
            .take(5)
            .toList();
        if (hashes.isEmpty) return;
        final cached = await _live(
          'usenet/checkcached',
          api.usenet.checkCachedAvailability(hashes: hashes),
        );
        expect(cached.success, isTrue, reason: cached.detail);
      });

      test('webdl list, hosters parse', () async {
        final list = await _live(
          'webdl/mylist',
          api.webDownloads.getWebDownloadList(limit: 5),
        );
        expect(list.success, isTrue, reason: list.detail);
        expect(list.data, isA<List<WebDownloadData>>());

        final hosters = await _live(
          'webdl/hosters',
          api.webDownloads.getHosters(),
        );
        expect(hosters.success, isTrue, reason: hosters.detail);
        expect(hosters.data, isNotEmpty);
      });

      test('general endpoints parse', () async {
        final stats = await _live('stats', api.general.getStats());
        expect(stats.success, isTrue, reason: stats.detail);
        expect(stats.data, isA<ServiceStatsData>());

        final changelogs = await _live(
          'changelogs/json',
          api.general.getChangelogsJson(),
        );
        expect(changelogs.success, isTrue, reason: changelogs.detail);

        final speedtest = await _live(
          'speedtest',
          api.general.getSpeedtestFiles(),
        );
        expect(speedtest.success, isTrue, reason: speedtest.detail);
      });

      test('notifications feed parses', () async {
        final res = await _live(
          'notifications/mynotifications',
          api.notifications.getNotificationFeed(),
        );
        expect(res.success, isTrue, reason: res.detail);
        expect(res.data, isA<List<NotificationData>>());
      });

      test('user endpoints parse', () async {
        final me = await _live('user/me', api.user.getUserData());
        expect(me.success, isTrue, reason: me.detail);
        expect(me.data, isA<UserData>());

        final stats = await _liveOrNull(
          'user/stats',
          api.user.getStats(
            general: true,
            bandwidth: true,
            bandwidthGrouping: 'day',
          ),
          // The backend intermittently 500s here (including a NoneType
          // crash observed live); explicit params above are an attempt to
          // avoid it, tolerance covers the rest.
          benignErrors: {'UNKNOWN_ERROR'},
        );
        if (stats != null) {
          expect(stats.success, isTrue, reason: stats.detail);
          expect(stats.data, isA<UserStatsData>());
        }

        final referral = await _live(
          'user/referraldata',
          api.user.getReferralData(),
        );
        expect(referral.success, isTrue, reason: referral.detail);

        final subs = await _live(
          'user/subscriptions',
          api.user.getSubscriptions(),
        );
        expect(subs.success, isTrue, reason: subs.detail);

        final txs = await _live(
          'user/transactions',
          api.user.getTransactions(),
        );
        expect(txs.success, isTrue, reason: txs.detail);
      });

      test('queued list parses', () async {
        final res = await _live(
          'queued/getqueued',
          api.queued.getQueuedDownloads(limit: 5),
        );
        expect(res.success, isTrue, reason: res.detail);
        expect(res.data, isA<List<QueuedDownloadData>>());
      });

      test('rss feeds parse', () async {
        final feeds = await _live('rss/getfeeds', api.rssFeeds.getRssFeeds());
        expect(feeds.success, isTrue, reason: feeds.detail);
        expect(feeds.data, isA<List<RssFeedData>>());

        if (feeds.data!.isEmpty) return;
        final items = await _live(
          'rss/getfeeditems',
          api.rssFeeds.getRssFeedItems(rssFeedId: feeds.data!.first.id),
        );
        expect(items.success, isTrue, reason: items.detail);
      });

      test('integration jobs parse', () async {
        final jobs = await _live(
          'integration/jobs',
          api.integrations.getAllJobs(),
        );
        expect(jobs.success, isTrue, reason: jobs.detail);
        expect(jobs.data, isA<List<IntegrationJobData>>());

        if (jobs.data!.isEmpty) return;
        final first = jobs.data!.first;
        final byId = await _live(
          'integration/job/{id}',
          api.integrations.getJobById(first.id),
        );
        expect(byId.success, isTrue, reason: byId.detail);

        final byHash = await _live(
          'integration/jobs/{hash}',
          api.integrations.getJobsByHash(first.hash),
        );
        expect(byHash.success, isTrue, reason: byHash.detail);
      });

      test('stream creation parses', () async {
        final items = sharedTorrents;
        if (items.isEmpty) return;

        // Only streamable video items produce a stream; the server 500s
        // for others (UNKNOWN_ERROR/PGRST116 zero-rows, or BOZO_FILE for
        // non-video files), so try a few before treating it as
        // environmental and moving on.
        TorBoxResponse<StreamData>? res;
        for (final item in items.take(3)) {
          res = await _liveOrNull(
            'stream/createstream',
            api.stream.createStream(id: item.id),
            benignErrors: {'UNKNOWN_ERROR', 'BOZO_FILE'},
          );
          if (res != null) break;
        }
        if (res != null) {
          expect(res.success, isTrue, reason: res.detail);
          expect(res.data, isA<StreamData>());
        }
      });
    },
  );
}
