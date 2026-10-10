import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:torbox_api/src/net/interceptors/retry_interceptor.dart';
import 'package:torbox_api/src/net/torbox_client.dart';
import 'package:torbox_api/torbox_api.dart';

TorBoxResponse<T> _decode<T>(String body, T Function(Object? json) fromJsonT) =>
    TorBoxResponse<T>.fromJson(
      jsonDecode(body) as Map<String, dynamic>,
      fromJsonT,
    );

List<T> Function(Object?) _listOf<T>(
  T Function(Map<String, dynamic>) fromJson,
) =>
    (json) => (json as List<dynamic>)
        .map((e) => fromJson(e as Map<String, dynamic>))
        .toList();

/// A minimal successful envelope, for tests that only care about the request.
ResponseBody _okEnvelope([String data = 'null']) => ResponseBody.fromString(
  '{"success":true,"error":null,"detail":"","data":$data}',
  200,
  headers: {
    Headers.contentTypeHeader: [Headers.jsonContentType],
  },
);

/// A client that records the outgoing request instead of sending it.
TorboxClient _capturingClient(
  void Function(RequestOptions options) onFetch, {
  ResponseBody Function()? respond,
}) {
  final client = TorboxClient(baseUrl: 'https://example.com');
  client.dio.httpClientAdapter = _ScriptedAdapter(
    () => respond?.call() ?? _okEnvelope(),
    onFetch: onFetch,
  );
  return client;
}

/// The JSON keys of a request that carries a JSON body.
Set<String> _bodyKeys(RequestOptions options) =>
    (options.data as Map<String, dynamic>).keys.toSet();

/// The form field names of a multipart request.
Set<String> _formKeys(RequestOptions options) {
  final form = options.data as FormData;
  return form.fields.map((field) => field.key).toSet();
}

/// The form fields of a multipart request, as a name to value map.
Map<String, String> _formValues(RequestOptions options) =>
    Map<String, String>.fromEntries(
      (options.data as FormData).fields,
    );

void main() {
  group('TorBoxResponse envelope', () {
    test('parses a null-data response', () {
      final res = _decode<Object?>(
        '{"success": true, "error": null, "detail": "ok", "data": null}',
        (j) => j,
      );
      expect(res.success, isTrue);
      expect(res.error, isNull);
      expect(res.detail, 'ok');
      expect(res.data, isNull);
    });

    test('normalizes non-string error values', () {
      // The API sometimes returns `"error": false` or `"error": "null"`.
      final res1 = _decode<Object?>(
        '{"success": true, "error": false, "data": null}',
        (j) => j,
      );
      expect(res1.error, isNull);

      final res2 = _decode<Object?>(
        '{"success": true, "error": "null", "data": null}',
        (j) => j,
      );
      expect(res2.error, isNull);

      final res3 = _decode<Object?>(
        '{"success": false, "error": "ITEM_NOT_FOUND", "data": null}',
        (j) => j,
      );
      expect(res3.error, 'ITEM_NOT_FOUND');
    });
  });

  group('Torrents', () {
    test('parses created torrent data', () {
      const body = '''
{
  "success": true,
  "error": null,
  "detail": "Torrent Added Successfully",
  "data": {"hash": "abc", "torrent_id": 42, "auth_id": "auth1"}
}''';
      final res = _decode<CreatedTorrentData>(
        body,
        (j) => CreatedTorrentData.fromJson(j! as Map<String, dynamic>),
      );
      expect(res.data!.hash, 'abc');
      expect(res.data!.torrentId, 42);
      expect(res.data!.authId, 'auth1');
    });

    test('parses torrent list', () {
      const body = '''
{
  "success": true,
  "error": null,
  "detail": "Torrent list retrieved successfully.",
  "data": [
    {
      "id": 0,
      "auth_id": "string",
      "server": 0,
      "hash": "string",
      "name": "string",
      "magnet": "string",
      "size": 0,
      "active": false,
      "created_at": "2026-03-08T21:21:28Z",
      "updated_at": "2026-03-08T21:21:41Z",
      "download_state": "string",
      "seeds": 0,
      "peers": 0,
      "ratio": 0,
      "progress": 0,
      "download_speed": 0,
      "upload_speed": 0,
      "eta": 0,
      "torrent_file": true,
      "expires_at": "2026-04-07T21:21:41Z",
      "download_present": true,
      "files": [
        {
          "id": 0,
          "md5": "string",
          "hash": "string",
          "name": "file.mkv",
          "size": 0,
          "zipped": false,
          "s3_path": "string",
          "infected": false,
          "mimetype": "string",
          "short_name": "string",
          "absolute_path": "string",
          "opensubtitles_hash": "string"
        }
      ],
      "download_path": "string",
      "availability": 0,
      "download_finished": true,
      "tracker": "string",
      "total_uploaded": 0,
      "total_downloaded": 0,
      "cached": true,
      "owner": "string",
      "seed_torrent": false,
      "allow_zipped": true,
      "long_term_seeding": false,
      "tracker_message": "string",
      "cached_at": "2026-04-07T21:21:41Z",
      "private": false,
      "alternative_hashes": ["a", "b"],
      "tags": ["tag"],
      "airlocked": false
    }
  ]
}''';
      final res = _decode<List<TorrentData>>(
        body,
        _listOf(TorrentData.fromJson),
      );
      final t = res.data!.single;
      expect(t.id, 0);
      expect(t.downloadState, 'string');
      expect(t.files!.single.name, 'file.mkv');
      expect(t.alternativeHashes, ['a', 'b']);
      expect(t.tags, ['tag']);

      // Round trip.
      final back = TorrentData.fromJson(t.toJson());
      expect(back, t);
    });

    test('parses cached availability object and list formats', () {
      const objectBody = '''
{
  "success": true,
  "error": null,
  "detail": "Torrent cache status retrieved successfully.",
  "data": {
    "deadbeef": {
      "name": "string",
      "size": 123,
      "hash": "deadbeef",
      "files": [
        {"id": 0, "name": "f.mkv", "size": 123,
         "opensubtitles_hash": "os", "short_name": "f", "mimetype": "video/x-matroska"}
      ]
    }
  }
}''';
      final objRes = _decode<Map<String, CachedAvailabilityData>>(
        objectBody,
        (json) => (json! as Map<String, dynamic>).map(
          (k, v) => MapEntry(k, CachedAvailabilityData.fromJson(v)),
        ),
      );
      final entry = objRes.data!['deadbeef']!;
      expect(entry.size, 123);
      expect(entry.files!.single.opensubtitlesHash, 'os');

      const listBody = '''
{
  "success": true,
  "error": null,
  "detail": "Torrent cache status retrieved successfully.",
  "data": [{"name": "string", "size": 5, "hash": "cafe"}]
}''';
      final listRes = _decode<List<CachedAvailabilityData>>(
        listBody,
        _listOf(CachedAvailabilityData.fromJson),
      );
      expect(listRes.data!.single.hash, 'cafe');
      expect(listRes.data!.single.files, isNull);
    });

    test('parses torrent info including partial metadata', () {
      const body = '''
{
  "success": true,
  "error": null,
  "detail": "Successfully retrieved torrent metadata for the hash.",
  "data": {
    "name": "string",
    "hash": "string",
    "size": 0,
    "trackers": ["udp://tracker"],
    "seeds": 0,
    "peers": 0,
    "files": [{"name": "a.mkv", "size": 10}]
  }
}''';
      final res = _decode<TorrentInfoData>(
        body,
        (j) => TorrentInfoData.fromJson(j! as Map<String, dynamic>),
      );
      expect(res.data!.trackers, ['udp://tracker']);
      expect(res.data!.files!.single.name, 'a.mkv');

      const partial = '''
{
  "success": false,
  "error": "UNKNOWN_ERROR",
  "detail": "Could not download full metadata.",
  "data": {"name": null, "hash": "string", "size": 0,
           "trackers": [], "seeds": 0, "peers": 0, "files": null}
}''';
      final pRes = _decode<TorrentInfoData>(
        partial,
        (j) => TorrentInfoData.fromJson(j! as Map<String, dynamic>),
      );
      expect(pRes.success, isFalse);
      expect(pRes.data!.name, isNull);
      expect(pRes.data!.files, isNull);
    });

    test('create torrent sends only the set fields as form fields', () async {
      RequestOptions? sent;
      final client = _capturingClient(
        (options) => sent = options,
        respond: () => _okEnvelope(
          '{"hash":"h","torrent_id":1,"auth_id":"a"}',
        ),
      );

      await TorrentsService(client).createTorrent(
        magnet: 'magnet:?xt=urn:btih:x',
        seed: 3,
        allowZip: false,
        name: 'n',
        asQueued: true,
        addOnlyIfCached: false,
      );

      // A null field is omitted from a multipart form.
      expect(_formValues(sent!), {
        'magnet': 'magnet:?xt=urn:btih:x',
        'seed': '3',
        'allow_zip': 'false',
        'name': 'n',
        'as_queued': 'true',
        'add_only_if_cached': 'false',
      });
      // The file is a separate parameter, so it is never a JSON field.
      expect((sent!.data as FormData).files, isEmpty);
    });
  });

  group('Usenet', () {
    test('parses created usenet download', () {
      const body = '''
{"success": true, "error": null, "detail": "Download started successfully.",
 "data": {"hash": "h", "usenetdownload_id": 7, "auth_id": "a"}}''';
      final res = _decode<CreatedUsenetDownloadData>(
        body,
        (j) => CreatedUsenetDownloadData.fromJson(j! as Map<String, dynamic>),
      );
      expect(res.data!.usenetDownloadId, 7);
    });

    test('parses usenet provider connection info', () {
      const body = '''
{"success": true, "error": null,
 "detail": "Usenet provider connection info retrieved successfully.",
 "data": {"host": "nntp.torbox.app", "port": 563, "ssl": true,
          "username": "u", "password": "p", "connections": 10,
          "retention": 5000, "limitations": "No more than 10."}}''';
      final res = _decode<UsenetProviderConnectionData>(
        body,
        (j) =>
            UsenetProviderConnectionData.fromJson(j! as Map<String, dynamic>),
      );
      expect(res.data!.host, 'nntp.torbox.app');
      expect(res.data!.port, 563);
      expect(res.data!.retention, 5000);
    });

    test('parses usenet list', () {
      const body = '''
{"success": true, "error": null,
 "detail": "Usenet downloads list retrieved successfully.",
 "data": [{
   "id": 1, "created_at": "2026-02-13T21:53:15Z",
   "updated_at": "2026-02-13T21:53:34Z", "auth_id": "a", "name": "n",
   "hash": "h", "download_state": "downloading", "download_speed": 100,
   "original_url": "https://x", "eta": 60, "progress": 50.0, "size": 1000,
   "download_id": "d", "files": [], "active": true, "cached": false,
   "download_present": false, "download_finished": false,
   "expires_at": "2026-03-15T21:53:34Z", "server": 2,
   "cached_at": "2026-02-13T21:53:34Z", "alternative_hashes": [],
   "tags": [], "airlocked": false}]}''';
      final res = _decode<List<UsenetDownloadData>>(
        body,
        _listOf(UsenetDownloadData.fromJson),
      );
      final u = res.data!.single;
      expect(u.progress, 50.0);
      expect(u.server, 2);
      expect(u.files, isEmpty);
    });
  });

  group('Web downloads', () {
    test('parses created web download', () {
      const body = '''
{"success": true, "error": null, "detail": "XXX download started.",
 "data": {"hash": "h", "webdownload_id": 3, "auth_id": "a",
          "jdownloader_id": null, "link_list": ["https://1", "https://2"]}}''';
      final res = _decode<CreatedWebDownloadData>(
        body,
        (j) => CreatedWebDownloadData.fromJson(j! as Map<String, dynamic>),
      );
      expect(res.data!.webdownloadId, 3);
      expect(res.data!.jdownloaderId, isNull);
      expect(res.data!.linkList, hasLength(2));
    });

    test('parses hoster list', () {
      const body = '''
{"success": true, "error": null,
 "detail": "Hosters list and information retrieved successfully.",
 "data": [
   {"id": 1, "name": "Rapidgator", "domains": ["rapidgator.net", "rg.to"],
    "url": "https://rapidgator.net",
    "icon": "https://torbox.app/images/hoster-icons/rapidgator.png",
    "status": false, "type": "hoster", "note": null, "nsfw": false,
    "daily_link_limit": 5, "daily_link_used": 2,
    "daily_bandwidth_limit": 536870912000, "daily_bandwidth_used": 1024,
    "per_link_size_limit": 107374182400,
    "regex": "^https?://.*rapidgator"}
 ]}''';
      final res = _decode<List<HosterData>>(body, _listOf(HosterData.fromJson));
      final h = res.data!.single;
      expect(h.name, 'Rapidgator');
      expect(h.status, isFalse);
      expect(h.dailyLinkUsed, 2);
      expect(h.domains, contains('rg.to'));
    });

    test('parses web download list item with error field', () {
      const body = '''
{"success": true, "error": null,
 "detail": "web downloads list retrieved successfully.",
 "data": [{
   "id": 9, "created_at": "2026-03-08T03:45:15Z",
   "updated_at": "2026-03-08T03:45:15Z", "auth_id": "a", "name": "n",
   "hash": "h", "download_state": "failed", "download_speed": 0,
   "original_url": "https://x", "eta": 0, "progress": 12.5, "size": 99,
   "download_id": "d", "files": [], "active": false, "cached": true,
   "download_present": true, "download_finished": false,
   "expires_at": "2026-03-05T02:28:26Z", "error": "HOSTER_DOWN",
   "cached_at": "2026-03-05T02:28:26Z", "server": 1,
   "alternative_hashes": [], "tags": [], "airlocked": true}]}''';
      final res = _decode<List<WebDownloadData>>(
        body,
        _listOf(WebDownloadData.fromJson),
      );
      final w = res.data!.single;
      expect(w.error, 'HOSTER_DOWN');
      expect(w.airlocked, isTrue);
      expect(w.progress, 12.5);
    });
  });

  group('Queued', () {
    test('parses queued downloads', () {
      const body = '''
{"success": true, "error": null,
 "detail": "Queued downloads list retrieved successfully.",
 "data": [{
   "id": 0, "created_at": "2026-03-10T00:10:13Z", "magnet": "magnet:?x",
   "torrent_file": "string", "hash": "h", "name": "n", "type": "torrent",
   "name_override": "no", "seed_torrent_override": 3}]}''';
      final res = _decode<List<QueuedDownloadData>>(
        body,
        _listOf(QueuedDownloadData.fromJson),
      );
      final q = res.data!.single;
      expect(q.type, 'torrent');
      expect(q.seedTorrentOverride, 3);
    });
  });

  group('General', () {
    test('parses service stats', () {
      const body = '''
{"success": true, "error": false, "detail": "Stats retrieved successfully.",
 "data": {"total_users": 10, "total_servers": 4}}''';
      final res = _decode<ServiceStatsData>(
        body,
        (j) => ServiceStatsData.fromJson(j! as Map<String, dynamic>),
      );
      expect(res.data!.totalUsers, 10);
      expect(res.data!.totalServers, 4);
    });

    test('parses changelog entries', () {
      const body = '''
{"success": true, "error": null, "detail": "Successfully retrieved changelogs.",
 "data": [
   {"name": "v7.1.3", "html": "<h2>API</h2>", "markdown": "## API",
    "link": "https://feedback.torbox.app/changelog/v713",
    "created_at": "2025-03-28T02:13:40Z",
    "id": "67e605d411f463f2a0afe977"}
 ]}''';
      final res = _decode<List<ChangelogEntry>>(
        body,
        _listOf(ChangelogEntry.fromJson),
      );
      final c = res.data!.single;
      expect(c.name, 'v7.1.3');
      expect(c.html, '<h2>API</h2>');
    });

    test('parses speedtest files', () {
      const body = '''
{"success": true, "error": null,
 "detail": "Successfully retrieved test files for speed test.",
 "data": [
   {"region": "wnam", "name": "Amsterdam", "domain": "https://speed.x",
    "path": "/file.bin", "url": "https://speed.x/file.bin", "closest": true,
    "coordinates": {"lat": 52.374, "lng": 4.8897}}
 ]}''';
      final res = _decode<List<SpeedtestFileData>>(
        body,
        _listOf(SpeedtestFileData.fromJson),
      );
      final s = res.data!.single;
      expect(s.coordinates.lat, closeTo(52.374, 0.0001));
      expect(s.closest, isTrue);
    });
  });

  group('Notifications', () {
    test('parses notification feed', () {
      const body = '''
{"success": true, "error": null,
 "detail": "Successfully retrieved your notifications.",
 "data": [
   {"id": 0, "created_at": "2023-12-22T22:39:22.387095+00:00",
    "title": "Test", "message": "This is a test.",
    "auth_id": "XXXXXXXXXXXXXXXXXXXXXXXX"}
 ]}''';
      final res = _decode<List<NotificationData>>(
        body,
        _listOf(NotificationData.fromJson),
      );
      expect(res.data!.single.title, 'Test');
    });
  });

  group('User', () {
    test('parses user data without settings', () {
      const body = '''
{"success": true, "error": null,
 "detail": "Successfully retrieved your user information.",
 "data": {
   "id": 0, "auth_id": "string", "created_at": "2023-08-30T20:23:00Z",
   "updated_at": "2026-03-09T00:22:40Z", "plan": 0, "total_downloaded": 0,
   "customer": "string", "is_subscribed": true,
   "premium_expires_at": "2051-02-18T04:08:43Z",
   "cooldown_until": "2026-03-10T00:22:40Z", "email": "e@x.com",
   "user_referral": "string", "base_email": "e@x.com",
   "total_bytes_downloaded": 0, "total_bytes_uploaded": 0,
   "torrents_downloaded": 0, "web_downloads_downloaded": 0,
   "usenet_downloads_downloaded": 0, "additional_concurrent_slots": 0,
   "long_term_seeding": false, "long_term_storage": false,
   "is_vendor": false, "vendor_id": 0, "purchases_referred": 0}}''';
      final res = _decode<UserData>(
        body,
        (j) => UserData.fromJson(j! as Map<String, dynamic>),
      );
      final u = res.data!;
      expect(u.plan, 0);
      expect(u.isSubscribed, isTrue);
      expect(u.settings, isNull);
    });

    test('parses user settings and dashboard filter', () {
      const body = '''
{"success": true, "error": null,
 "detail": "Successfully retrieved your user information.",
 "data": {
   "id": 0, "auth_id": "string", "plan": 0,
   "settings": {
     "email_notifications": false, "web_notifications": true,
     "stremio_quality": [0, 1, 2], "stremio_resolution": [0],
     "stremio_language": [0], "stremio_cache": [1],
     "stremio_size_lower": 0, "seed_torrents": 1, "allow_zipped": true,
     "dashboard_filter": {"active": true, "web_downloads": false,
                          "usenet_downloads": true},
     "web_player_always_transcode": true,
     "append_filename_to_links": true
   }}}''';
      final res = _decode<UserData>(
        body,
        (j) => UserData.fromJson(j! as Map<String, dynamic>),
      );
      final s = res.data!.settings!;
      expect(s.webNotifications, isTrue);
      expect(s.stremioQuality, [0, 1, 2]);
      expect(s.dashboardFilter!.active, isTrue);
      expect(s.dashboardFilter!.webDownloads, isFalse);
      expect(s.dashboardFilter!.usenetDownloads, isTrue);
    });

    test('parses user stats', () {
      const body = '''
{"success": true, "error": null,
 "detail": "Successfully retrieved your statistics.",
 "data": {
   "general": {"total_downloaded": 52387288994,
               "total_uploaded": 7186249682, "ratio": 0.13717544503635323,
               "total_items_downloaded": 36},
   "bandwidth": [
     {"date": "2026-04-27T00:00:00Z", "bytes_downloaded": 0},
     {"date": "2026-05-04T00:00:00Z", "bytes_downloaded": 4324742435}
   ]}}''';
      final res = _decode<UserStatsData>(
        body,
        (j) => UserStatsData.fromJson(j! as Map<String, dynamic>),
      );
      expect(res.data!.general!.ratio, closeTo(0.13717544503635323, 1e-9));
      expect(res.data!.bandwidth![1].bytesDownloaded, 4324742435);
    });

    test('parses device code flow payloads', () {
      const start = '''
{"success": true, "error": null,
 "detail": "Successfully created your device code authorization.",
 "data": {"device_code": "dc", "interval": 5,
          "expires_at": "2025-08-24T15:18:28Z",
          "verification_url": "https://torbox.app/oauth/device?app=X",
          "friendly_verification_url": "https://tor.box/link",
          "code": "ABCD"}}''';
      final s = _decode<DeviceCodeStartData>(
        start,
        (j) => DeviceCodeStartData.fromJson(j! as Map<String, dynamic>),
      );
      expect(s.data!.interval, 5);
      expect(s.data!.code, 'ABCD');

      const token = '''
{"success": true, "error": null, "detail": "Token redeemed.",
 "data": {"access_token": "tok", "token_type": "Bearer"}}''';
      final t = _decode<DeviceTokenData>(
        token,
        (j) => DeviceTokenData.fromJson(j! as Map<String, dynamic>),
      );
      expect(t.data!.accessToken, 'tok');
    });

    test('parses subscriptions and transactions', () {
      const subs = '''
{"success": true, "error": null, "detail": "Successfully retrieved subscriptions.",
 "data": [{"created_at": "2025-03-14T08:08:42Z",
           "updated_at": "2025-08-04T18:37:44Z",
           "subscription_code": "sc", "email_token": "et", "auth_id": "a",
           "plan_code": "pro", "status": "active", "gateway": "stripe",
           "plan_name": "Pro"}]}''';
      final subsRes = _decode<List<UserSubscription>>(
        subs,
        _listOf(UserSubscription.fromJson),
      );
      expect(subsRes.data!.single.planName, 'Pro');

      const txs = '''
{"success": true, "error": null, "detail": "Successfully retrieved transactions.",
 "data": [{"at": "2023-09-01T02:05:28Z", "type": "purchase", "amount": 300,
           "transaction_id": "t1"}]}''';
      final txRes = _decode<List<UserTransaction>>(
        txs,
        _listOf(UserTransaction.fromJson),
      );
      expect(txRes.data!.single.amount, 300);
    });
  });

  group('RSS', () {
    test('parses feeds and feed items', () {
      const feeds = '''
{"success": true, "error": null, "detail": "Successfully retrieved RSS feeds.",
 "data": [{"id": 0, "created_at": "2025-08-20T09:01:02.714060Z",
           "last_checked": "2026-03-09T20:40:22.457984Z", "auth_id": "a",
           "name": "n", "url": "https://xxxx", "source": "https://xxxx",
           "source_name": "sn", "do_regex": "r", "dont_regex": "dr",
           "status": "ok", "scan_interval": 30, "dont_older_than": 5,
           "status_message": "sm", "type": "torrent",
           "torrent_seeding": 3, "state": "running"}]}''';
      final feedsRes = _decode<List<RssFeedData>>(
        feeds,
        _listOf(RssFeedData.fromJson),
      );
      final f = feedsRes.data!.single;
      expect(f.scanInterval, 30);
      expect(f.state, 'running');

      const items = '''
{"success": true, "error": null, "detail": "Successfully retrieved RSS feed items.",
 "data": [{"id": 0, "created_at": "2026-03-10T02:30:13.149869Z",
           "rss_name": "rn", "rss_url": "https://xxxx", "ignored": false,
           "downloaded": true, "link": "https://xxxx", "name": "item",
           "status": "downloaded", "status_message": "sm",
           "seed_torrents": 0, "type": "torrent"}]}''';
      final itemsRes = _decode<List<RssFeedItemData>>(
        items,
        _listOf(RssFeedItemData.fromJson),
      );
      expect(itemsRes.data!.single.downloaded, isTrue);
    });

    test('rss requests send the documented field names', () async {
      RequestOptions? added;
      RequestOptions? modified;
      final client = _capturingClient((options) {
        if (options.path.contains('addrss')) {
          added = options;
        } else {
          modified = options;
        }
      });
      final service = RssFeedsService(client);

      await service.addRssFeed(
        url: 'https://feed',
        name: 'My Feed',
        doRegex: '1080p',
        scanInterval: 20,
        rssType: 'usenet',
      );
      await service.modifyRssFeed(rssFeedId: 5, dontOlderThan: 3);

      expect(_bodyKeys(added!), {
        'url',
        'name',
        'do_regex',
        'dont_regex',
        'dont_older_than',
        'pass_check',
        'scan_interval',
        'rss_type',
        'torrent_seeding',
      });
      expect((added!.data as Map<String, dynamic>)['do_regex'], '1080p');
      expect((added!.data as Map<String, dynamic>)['scan_interval'], 20);
      expect((added!.data as Map<String, dynamic>)['rss_type'], 'usenet');

      expect((modified!.data as Map<String, dynamic>)['rss_feed_id'], 5);
      expect((modified!.data as Map<String, dynamic>)['dont_older_than'], 3);
    });
  });

  group('Integrations', () {
    test('parses job list (task_id) and single job (job_id)', () {
      const listBody = '''
{"success": true, "error": null, "detail": "Jobs retrieved successfully.",
 "data": [{"id": 0, "created_at": "2024-06-13T07:51:12.40135+00:00",
           "updated_at": "2024-06-13T07:51:22.21287+00:00", "auth_id": "a",
           "hash": "h", "type": "torrent", "integration": "gdrive",
           "file_id": 0, "zip": false, "progress": 1, "detail": "d",
           "download_url": "https://xxxx", "status": "completed",
           "file_name": "f.bin", "task_id": "task"}]}''';
      final listRes = _decode<List<IntegrationJobData>>(
        listBody,
        _listOf(IntegrationJobData.fromJson),
      );
      expect(listRes.data!.single.taskId, 'task');
      expect(listRes.data!.single.jobId, isNull);

      const singleBody = '''
{"success": true, "error": null, "detail": "Job status retrieved successfully.",
 "data": {"id": 0, "created_at": "2024-06-13T07:51:12.40135+00:00",
          "updated_at": "2024-06-13T07:51:22.21287+00:00", "auth_id": "a",
          "hash": "h", "type": "torrent", "integration": "gdrive",
          "file_id": 0, "zip": false, "progress": 1, "detail": "d",
          "download_url": "https://xxxx", "status": "completed",
          "file_name": "f.bin", "job_id": "job"}}''';
      final singleRes = _decode<IntegrationJobData>(
        singleBody,
        (j) => IntegrationJobData.fromJson(j! as Map<String, dynamic>),
      );
      expect(singleRes.data!.jobId, 'job');
      expect(singleRes.data!.taskId, isNull);
    });
  });

  group('Stream', () {
    test('parses full stream data', () {
      const body = '''
{"success": true, "error": null, "detail": "Stream initialized successfully.",
 "data": {
   "id": 0, "file_id": 0, "auth_id": "a", "name": "movie.mkv",
   "short_name": "movie", "s3_path": "/p", "size": 100, "mimetype": "video/x-matroska",
   "hash": "h", "open_subtitles_hash": "osh", "type": "torrent", "region": "wnam",
   "domain": "https://xxxx", "user_token": "ut", "webdav_url": "https://xxxx",
   "intro_information": {"start_time": 0, "end_time": 90, "title": "Intro"},
   "scrobbling_enabled": true, "hls_url": "https://xxxx/index.m3u8",
   "presigned_token": "pt", "subtitle_index": 0, "audio_index": 1,
   "resolution_index": 0, "is_transcoding": false, "needs_transcoding": true,
   "metadata": {
     "video": {"index": 0, "codec_type": "video", "codec": "hevc",
               "width": 1920, "height": 1080, "frame_rate": "23.976",
               "pixel_format": "yuv420p", "bitrate": "5000000",
               "duration": "5400", "total_chunks": 100, "file_name": "movie.mkv",
               "opensubtitles_hash": "osh", "size": 100, "title": "t",
               "title_data": {}},
     "audios": [{"index": 1, "codec_type": "audio", "codec": "aac",
                 "default": true, "sample_rate": "48000", "channels": 2,
                 "channel_layout": "stereo", "language": "eng",
                 "language_full": "English", "title": "English"}],
     "subtitles": [],
     "thumbnail": "thumbnail.png", "chapters": "chapters.vtt"},
   "search_metadata": {
     "title": "Movie", "titles": ["Movie"], "keywords": ["k"],
     "genres": ["Action"], "actors": ["A"], "releaseYears": "2020-2020",
     "mediaType": "movie", "characters": ["C"], "globalID": "g",
     "id": "1", "link": "https://xxxx", "description": "d", "rating": 8.1,
     "languages": ["en"], "contentRating": "PG-13", "trailer": {},
     "image": "https://xxxx", "isAdult": false, "type": "movie",
     "releasedDate": "2000-01-27T00:00:00.000Z", "episodesNumber": 0,
     "runtime": "120 min",
     "titles_full": [{"language": "en", "title": "Movie"}],
     "backdrop": "https://xxxx"}}}''';
      final res = _decode<StreamData>(
        body,
        (j) => StreamData.fromJson(j! as Map<String, dynamic>),
      );
      final s = res.data!;
      expect(s.openSubtitlesHash, 'osh');
      expect(s.introInformation!.endTime, 90);
      expect(s.metadata!.video!.width, 1920);
      expect(s.metadata!.audios!.single.isDefault, isTrue);
      expect(s.metadata!.audios!.single.languageFull, 'English');
      final sm = s.searchMetadata!;
      expect(sm.releaseYears, '2020-2020');
      expect(sm.globalId, 'g');
      expect(sm.contentRating, 'PG-13');
      expect(sm.episodesNumber, 0);
      expect(sm.rating, 8.1);
      expect(sm.titlesFull!.single.language, 'en');
    });

    test('parses stream info data', () {
      const body = '''
{"success": true, "error": null, "detail": "Stream initialized successfully.",
 "data": {"hls_url": "https://xxxx/i.m3u8", "domain": "https://xxxx",
          "presigned_token": "pt", "subtitle_index": 0, "audio_index": 0,
          "resolution_index": 0, "file_token": "ft", "token": "tk",
          "is_transcoding": false, "needs_transcoding": true,
          "metadata": {}, "search_metadata": {}}}''';
      final res = _decode<StreamInfoData>(
        body,
        (j) => StreamInfoData.fromJson(j! as Map<String, dynamic>),
      );
      expect(res.data!.hlsUrl, 'https://xxxx/i.m3u8');
      expect(res.data!.fileToken, 'ft');
      expect(res.data!.metadata, isNotNull);
    });
  });

  group('Validation errors', () {
    test('parses HTTP 422 payload', () {
      const body = '''
{"detail": [
  {"loc": ["body", "hashes"], "msg": "field required", "type": "missing",
   "input": null}
]}''';
      final err = HttpValidationError.fromJson(
        jsonDecode(body) as Map<String, dynamic>,
      );
      expect(err.detail.single.msg, 'field required');
      expect(err.detail.single.loc, ['body', 'hashes']);
    });
  });

  group('TorboxClient', () {
    test('base URL is normalized with a trailing slash', () {
      // Dio concatenates baseUrl + path verbatim; without this,
      // 'https://api.torbox.app/v1' + 'api/stats' becomes
      // 'https://api.torbox.app/v1api/stats' (404).
      final withoutSlash = TorboxClient(baseUrl: 'https://api.torbox.app/v1');
      expect(withoutSlash.baseUrl, 'https://api.torbox.app/v1/');

      final withSlash = TorboxClient(baseUrl: 'https://api.torbox.app/v1/');
      expect(withSlash.baseUrl, 'https://api.torbox.app/v1/');

      withSlash.baseUrl = 'https://example.com/api';
      expect(withSlash.baseUrl, 'https://example.com/api/');
    });
  });

  group('RetryInterceptor', () {
    ResponseBody jsonOk() => ResponseBody.fromString(
      '{"success":true}',
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );

    ResponseBody serverError() => ResponseBody.fromString(
      '{"success":false}',
      500,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );

    test('retries 500s until success', () async {
      var calls = 0;
      final dio = Dio();
      dio.httpClientAdapter = _ScriptedAdapter(() {
        calls++;
        return calls < 3 ? serverError() : jsonOk();
      });
      dio.interceptors.add(
        RetryInterceptor(dio: dio, maxAttempts: 3, baseDelayMs: 1),
      );

      final res = await dio.get('https://example.com/x');
      expect(res.statusCode, 200);
      expect(calls, 3);
    });

    test('gives up after maxAttempts and preserves the error', () async {
      var calls = 0;
      final dio = Dio();
      dio.httpClientAdapter = _ScriptedAdapter(() {
        calls++;
        return serverError();
      });
      dio.interceptors.add(
        RetryInterceptor(dio: dio, maxAttempts: 2, baseDelayMs: 1),
      );

      try {
        await dio.get('https://example.com/x');
        fail('expected a DioException');
      } on DioException catch (e) {
        // 1 original + 2 retries, original status surfaced (not masked).
        expect(calls, 3);
        expect(e.response?.statusCode, 500);
      }
    });

    test('does not retry 400s', () async {
      var calls = 0;
      final dio = Dio();
      dio.httpClientAdapter = _ScriptedAdapter(() {
        calls++;
        return ResponseBody.fromString('{"success":false}', 400);
      });
      dio.interceptors.add(
        RetryInterceptor(dio: dio, maxAttempts: 3, baseDelayMs: 1),
      );

      try {
        await dio.get('https://example.com/x');
        fail('expected a DioException');
      } on DioException catch (e) {
        expect(calls, 1);
        expect(e.response?.statusCode, 400);
      }
    });
  });

  group('request validation', () {
    final torrentFile = TorboxFileUpload(
      filename: 'f.torrent',
      bytes: Uint8List.fromList([1, 2, 3]),
    );
    final nzbFile = TorboxFileUpload(
      filename: 'f.nzb',
      bytes: Uint8List.fromList([4, 5, 6]),
    );

    test('create torrent requires exactly one of file or magnet', () async {
      final service = TorrentsService(_capturingClient((_) {}));
      expect(
        () => service.createTorrent(),
        throwsA(isA<TorboxRequestValidationException>()),
      );
      expect(
        () => service.createTorrent(magnet: 'm', file: torrentFile),
        throwsA(isA<TorboxRequestValidationException>()),
      );
      // No exception when exactly one is provided.
      await service.createTorrent(magnet: 'm');
      await service.createTorrent(file: torrentFile);
    });

    test('create usenet download requires exactly one of link or file', () async {
      final service = UsenetService(_capturingClient((_) {}));
      expect(
        () => service.createUsenetDownload(),
        throwsA(isA<TorboxRequestValidationException>()),
      );
      expect(
        () => service.createUsenetDownload(link: 'l', file: nzbFile),
        throwsA(isA<TorboxRequestValidationException>()),
      );
      await service.createUsenetDownload(link: 'l');
    });

    test('control requests require a target', () async {
      final torrents = TorrentsService(_capturingClient((_) {}));
      expect(
        () => torrents.controlTorrent(operation: 'resume'),
        throwsA(isA<TorboxRequestValidationException>()),
      );
      await torrents.controlTorrent(operation: 'resume', torrentId: 1);
      await torrents.controlTorrent(operation: 'resume', all: true);

      final queued = QueuedService(_capturingClient((_) {}));
      expect(
        () => queued.controlQueuedDownload(operation: 'delete'),
        throwsA(isA<TorboxRequestValidationException>()),
      );

      final web = WebDownloadsService(_capturingClient((_) {}));
      expect(
        () => web.controlWebDownload(operation: 'delete'),
        throwsA(isA<TorboxRequestValidationException>()),
      );

      final usenet = UsenetService(_capturingClient((_) {}));
      expect(
        () => usenet.controlUsenetDownload(operation: 'delete'),
        throwsA(isA<TorboxRequestValidationException>()),
      );
    });

    test('torrent info request requires a source', () async {
      final service = TorrentsService(_capturingClient((_) {}));
      expect(
        () => service.getTorrentInfoPost(),
        throwsA(isA<TorboxRequestValidationException>()),
      );
      await service.getTorrentInfoPost(hash: 'h');
    });

    test('the exception names the failing argument', () {
      final error = TorboxRequestValidationException(
        'Either file or magnet must be provided.',
        argument: 'file',
      );
      expect(error.toString(), contains('file'));
      expect(error.argument, 'file');
    });
  });

  group('live error envelopes (captured from the real API)', () {
    test('download server error envelope parses', () {
      final res = _decode<dynamic>(
        '{"success": false, "error": "DOWNLOAD_SERVER_ERROR", '
        '"detail": "Could not download full metadata for the torrent '
        'within the alloted timeout.", "data": null}',
        (j) => j,
      );
      expect(res.success, isFalse);
      expect(res.error, 'DOWNLOAD_SERVER_ERROR');
      expect(res.data, isNull);
    });

    test('postgrest error detail passes data through', () {
      final res = _decode<dynamic>(
        '{"success": false, "error": "UNKNOWN_ERROR", '
        '"detail": "There was an error creating the stream. '
        'Please try again later.", '
        '"data": {"message": "JSON object requested, multiple (or no) '
        'rows returned", "code": "PGRST116"}}',
        (j) => j,
      );
      expect(res.success, isFalse);
      expect(res.error, 'UNKNOWN_ERROR');
      expect((res.data as Map<String, dynamic>)['code'], 'PGRST116');
    });
  });

  group('TorboxClient errors', () {
    TorboxClient scriptedClient(ResponseBody Function() respond) {
      final client = TorboxClient(baseUrl: 'https://example.com');
      client.dio.httpClientAdapter = _ScriptedAdapter(respond);
      return client;
    }

    ResponseBody jsonBody(String body, int status) => ResponseBody.fromString(
      body,
      status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );

    test('HTTP error envelope becomes TorboxApiException', () async {
      final client = scriptedClient(
        () => jsonBody(
          '{"success": false, "error": "BAD_TOKEN", '
          '"detail": "Invalid token.", "data": null}',
          401,
        ),
      );
      try {
        await client.get('api/user/me');
        fail('expected a TorboxApiException');
      } on TorboxApiException catch (e) {
        expect(e.statusCode, 401);
        expect(e.isHttpError, isTrue);
        expect(e.errorCode, 'BAD_TOKEN');
        expect(e.detail, 'Invalid token.');
        expect(e.uri.toString(), 'https://example.com/api/user/me');
      }
    });

    test('non-JSON HTTP error has no code or detail', () async {
      final client = scriptedClient(
        () => ResponseBody.fromString('Server Error', 500),
      );
      try {
        await client.get('api/stats');
        fail('expected a TorboxApiException');
      } on TorboxApiException catch (e) {
        expect(e.statusCode, 500);
        expect(e.isHttpError, isTrue);
        expect(e.errorCode, isNull);
        expect(e.detail, isNull);
      }
    });

    test('literal "null" error code normalizes to null', () async {
      final client = scriptedClient(
        () => jsonBody(
          '{"success": false, "error": "null", "detail": "", "data": null}',
          403,
        ),
      );
      try {
        await client.get('api/user/me');
        fail('expected a TorboxApiException');
      } on TorboxApiException catch (e) {
        expect(e.statusCode, 403);
        expect(e.errorCode, isNull);
      }
    });
  });

  group('multipart uploads', () {
    test('file upload sends bytes, filename and fields as multipart', () async {
      FormData? captured;
      final client = TorboxClient(baseUrl: 'https://example.com');
      client.dio.httpClientAdapter = _ScriptedAdapter(
        () => ResponseBody.fromString(
          '{"success": true, "error": null, "detail": "", '
          '"data": {"hash": "h", "torrent_id": 1, "auth_id": "a"}}',
          200,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        ),
        onFetch: (options) => captured = options.data as FormData?,
      );

      final service = TorrentsService(client);
      final res = await service.createTorrent(
        file: TorboxFileUpload(
          filename: 'up.torrent',
          bytes: Uint8List.fromList([7, 8]),
        ),
        name: 'n',
      );
      expect(res.success, isTrue);
      expect(res.data!.torrentId, 1);

      final form = captured!;
      // The file is a separate parameter, so only the named fields become
      // form fields.
      final fieldMap = Map<String, String>.fromEntries(form.fields);
      expect(fieldMap, hasLength(1));
      expect(fieldMap['name'], 'n');
      expect(form.files, hasLength(1));
      expect(form.files.single.key, 'file');
      expect(form.files.single.value.filename, 'up.torrent');
      expect(form.files.single.value.length, 2);
    });
  });

  group('interceptor registration', () {
    TorboxApi offlineApi() => TorboxApi(
      token: 'test-token',
      baseUrl: 'https://example.com',
      // Keep the removal test from waiting on a real connection.
      timeout: const Duration(milliseconds: 1),
      maxAttempts: 1,
    );

    Response<Map<String, dynamic>> canned(
      RequestOptions options, {
      String detail = 'from interceptor',
    }) => Response<Map<String, dynamic>>(
      data: {'success': true, 'error': null, 'detail': detail, 'data': null},
      requestOptions: options,
      statusCode: 200,
    );

    test('runs after the built-in auth interceptor and can resolve', () async {
      final api = offlineApi();
      String? seenAuth;
      api.addInterceptor(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            seenAuth = options.headers['Authorization'] as String?;
            handler.resolve(canned(options));
          },
        ),
      );

      final res = await api.torrents.controlTorrent(
          operation: 'delete',
          torrentId: 1,
        );

      expect(res.success, isTrue);
      expect(res.detail, 'from interceptor');
      // Registration order matters: the header must already be set.
      expect(seenAuth, 'Bearer test-token');
    });

    test('removeInterceptor stops the interceptor from running', () async {
      final api = offlineApi();
      var calls = 0;
      final interceptor = InterceptorsWrapper(
        onRequest: (options, handler) {
          calls++;
          handler.resolve(canned(options));
        },
      );
      api.addInterceptor(interceptor);

      await api.torrents.controlTorrent(
          operation: 'delete',
          torrentId: 1,
        );
      expect(calls, 1);

      api.removeInterceptor(interceptor);
      try {
        // No longer short-circuited, so this now attempts a real request
        // and fails instead of resolving locally.
        await api.torrents.controlTorrent(
          operation: 'delete',
          torrentId: 1,
        );
      } on TorboxApiException {
        // Expected.
      }
      expect(calls, 1);
    });
  });

  group('usenet and web downloads', () {
    // Captured verbatim from `GET /v1/api/usenet/mylist`. Note there is no
    // `upload_speed`, `torrent_file` or `availability` on the wire — those
    // are torrent-only fields, which is why the models do not declare them.
    const usenetBody = '''
{
  "success": true,
  "error": null,
  "detail": "Usenet downloads list retrieved successfully.",
  "data": [
    {
      "id": 0,
      "created_at": "2026-02-13T21:53:15Z",
      "updated_at": "2026-02-13T21:53:34Z",
      "auth_id": "string",
      "name": "string",
      "hash": "string",
      "download_state": "string",
      "download_speed": 0,
      "original_url": "string",
      "eta": 0,
      "progress": 0,
      "size": 0,
      "download_id": "string",
      "files": [
        {
          "id": 0,
          "md5": "string",
          "hash": "string",
          "name": "string",
          "size": 0,
          "zipped": false,
          "s3_path": "string",
          "infected": false,
          "mimetype": "string",
          "short_name": "string",
          "absolute_path": "string",
          "opensubtitles_hash": "string"
        }
      ],
      "active": false,
      "cached": true,
      "download_present": true,
      "download_finished": true,
      "expires_at": "2026-03-15T21:53:34Z",
      "server": 0,
      "cached_at": "2026-02-13T21:53:34Z",
      "alternative_hashes": ["string", "string"],
      "tags": ["string", "string"],
      "airlocked": false
    }
  ]
}''';

    // Captured verbatim from `GET /v1/api/webdl/mylist`.
    const webdlBody = '''
{
  "success": true,
  "error": null,
  "detail": "web downloads list retrieved successfully.",
  "data": [
    {
      "id": 0,
      "created_at": "2026-03-08T03:45:15Z",
      "updated_at": "2026-03-08T03:45:15Z",
      "auth_id": "string",
      "name": "string",
      "hash": "string",
      "download_state": "string",
      "download_speed": 0,
      "original_url": "string",
      "eta": 0,
      "progress": 0,
      "size": 0,
      "download_id": "string",
      "files": [
        {
          "id": 0,
          "md5": "string",
          "hash": "string",
          "name": "string",
          "size": 0,
          "zipped": false,
          "s3_path": "string",
          "infected": false,
          "mimetype": "string",
          "short_name": "string",
          "absolute_path": "string",
          "opensubtitles_hash": "string"
        }
      ],
      "active": false,
      "cached": true,
      "download_present": true,
      "download_finished": true,
      "expires_at": "2026-03-05T02:28:26Z",
      "error": "string",
      "cached_at": "2026-03-05T02:28:26Z",
      "server": 0,
      "alternative_hashes": ["string", "string"],
      "tags": ["string", "string"],
      "airlocked": false
    }
  ]
}''';

    test('parses every usenet field on the wire', () {
      final res = _decode(usenetBody, _listOf(UsenetDownloadData.fromJson));
      final download = res.data!.single;
      expect(download.id, 0);
      expect(download.authId, 'string');
      expect(download.name, 'string');
      expect(download.hash, 'string');
      expect(download.downloadState, 'string');
      expect(download.downloadSpeed, 0);
      expect(download.originalUrl, 'string');
      expect(download.eta, 0);
      expect(download.progress, 0);
      expect(download.size, 0);
      expect(download.downloadId, 'string');
      expect(download.active, isFalse);
      expect(download.cached, isTrue);
      expect(download.downloadPresent, isTrue);
      expect(download.downloadFinished, isTrue);
      expect(download.expiresAt, '2026-03-15T21:53:34Z');
      expect(download.server, 0);
      expect(download.cachedAt, '2026-02-13T21:53:34Z');
      expect(download.alternativeHashes, hasLength(2));
      expect(download.tags, hasLength(2));
      expect(download.airlocked, isFalse);
      expect(download.files!.single.s3Path, 'string');
      expect(download.files!.single.md5, 'string');
    });

    test('parses every web download field on the wire', () {
      final res = _decode(webdlBody, _listOf(WebDownloadData.fromJson));
      final download = res.data!.single;
      expect(download.id, 0);
      expect(download.authId, 'string');
      expect(download.downloadState, 'string');
      expect(download.originalUrl, 'string');
      expect(download.downloadId, 'string');
      expect(download.cached, isTrue);
      expect(download.downloadFinished, isTrue);
      expect(download.expiresAt, '2026-03-05T02:28:26Z');
      expect(download.error, 'string');
      expect(download.cachedAt, '2026-03-05T02:28:26Z');
      expect(download.server, 0);
      expect(download.alternativeHashes, hasLength(2));
      expect(download.tags, hasLength(2));
      expect(download.airlocked, isFalse);
      expect(download.files!.single.s3Path, 'string');
    });

    test('torrent-only fields are not modelled on usenet/web downloads', () {
      // Guards against re-adding fields the API does not return: the torrent
      // sample has upload_speed/torrent_file/availability, these two do not.
      final usenet = _decode(usenetBody, _listOf(UsenetDownloadData.fromJson))
          .data!
          .single
          .toJson();
      final webdl = _decode(webdlBody, _listOf(WebDownloadData.fromJson))
          .data!
          .single
          .toJson();
      for (final json in [usenet, webdl]) {
        expect(json.containsKey('upload_speed'), isFalse);
        expect(json.containsKey('torrent_file'), isFalse);
        expect(json.containsKey('availability'), isFalse);
        expect(json.containsKey('inactive_check'), isFalse);
      }
    });

    test('parses checkcached with format=list', () {
      const body = '''
{
  "success": true,
  "error": null,
  "detail": "ok",
  "data": [
    {"name": "example", "size": 10, "hash": "abc"},
    {"name": "other", "size": 20, "hash": "def", "files": [
      {"id": 1, "name": "f1", "size": 5}
    ]}
  ]
}''';
      final res = _decode<List<CachedAvailabilityData>>(
        body,
        _listOf(CachedAvailabilityData.fromJson),
      );
      expect(res.data, hasLength(2));
      expect(res.data!.first.hash, 'abc');
      expect(res.data!.last.files!.single.name, 'f1');
    });
  });

  group('request wire format', () {
    // These tests inspect the request that the client actually sends, so they
    // cover the field names in the service signature, the client, and the
    // transport together. Each expected name is the name in the API
    // documentation.
    group('JSON bodies', () {
      test('control requests', () async {
        RequestOptions? sent;
        final client = _capturingClient((options) => sent = options);

        await TorrentsService(client).controlTorrent(
          operation: 'delete',
          torrentId: 1,
        );
        expect(_bodyKeys(sent!), {'operation', 'torrent_id', 'all'});
        expect((sent!.data as Map<String, dynamic>)['torrent_id'], 1);

        await UsenetService(client).controlUsenetDownload(
          operation: 'pause',
          all: true,
        );
        expect(_bodyKeys(sent!), {'operation', 'usenet_id', 'all'});
        expect((sent!.data as Map<String, dynamic>)['all'], isTrue);

        await WebDownloadsService(client).controlWebDownload(
          operation: 'delete',
          webdlId: 2,
        );
        expect(_bodyKeys(sent!), {'operation', 'webdl_id', 'all'});
        expect((sent!.data as Map<String, dynamic>)['webdl_id'], 2);

        await QueuedService(client).controlQueuedDownload(
          operation: 'start',
          queuedId: 3,
        );
        expect(_bodyKeys(sent!), {'operation', 'queued_id', 'all'});
        expect((sent!.data as Map<String, dynamic>)['queued_id'], 3);
      });

      test('edit requests', () async {
        RequestOptions? sent;
        final client = _capturingClient((options) => sent = options);

        await UsenetService(client).editUsenetDownload(
          usenetDownloadId: 4,
          airlocked: true,
        );
        expect(_bodyKeys(sent!), {
          'usenet_download_id',
          'name',
          'tags',
          'alternative_hashes',
          'airlocked',
        });
        expect((sent!.data as Map<String, dynamic>)['usenet_download_id'], 4);

        await WebDownloadsService(client).editWebDownload(webdlId: 5);
        expect(_bodyKeys(sent!), {
          'webdl_id',
          'name',
          'tags',
          'alternative_hashes',
          'airlocked',
        });

        await TorrentsService(client).editTorrent(torrentId: 6, name: 'n');
        expect(_bodyKeys(sent!), {
          'torrent_id',
          'name',
          'tags',
          'alternative_hashes',
          'airlocked',
        });
        expect((sent!.data as Map<String, dynamic>)['torrent_id'], 6);
      });

      test('rss and cloud requests', () async {
        RequestOptions? sent;
        final client = _capturingClient((options) => sent = options);

        await RssFeedsService(client).controlRssFeed(
          operation: 'pause',
          rssFeedId: 4,
        );
        expect(_bodyKeys(sent!), {'operation', 'rss_feed_id'});

        await IntegrationsService(client).addToGoogleDrive(
          id: 12,
          fileId: 3,
          zip: true,
          type: 'torrent',
          googleToken: 'tok',
        );
        expect(_bodyKeys(sent!), {
          'id',
          'file_id',
          'zip',
          'type',
          'google_token',
        });
        expect((sent!.data as Map<String, dynamic>)['file_id'], 3);
        expect((sent!.data as Map<String, dynamic>)['google_token'], 'tok');

        // Each cloud endpoint sends only its own token field.
        await IntegrationsService(client).addToPixeldrain(
          id: 1,
          pixeldrainToken: 'pd',
        );
        expect(_bodyKeys(sent!), {
          'id',
          'file_id',
          'zip',
          'type',
          'pixeldrain_token',
        });
      });

      test('user requests', () async {
        RequestOptions? sent;
        final client = _capturingClient((options) => sent = options);
        final service = UserService(client);

        await service.refreshToken(sessionToken: 's');
        expect(_bodyKeys(sent!), {'session_token'});

        await service.deviceToken(deviceCode: 'd');
        expect(_bodyKeys(sent!), {'device_code'});

        await service.deleteAccount(sessionToken: 's', confirmationCode: 1);
        expect(_bodyKeys(sent!), {'session_token', 'confirmation_code'});
      });

      test('settings request covers every documented field', () async {
        RequestOptions? sent;
        final client = _capturingClient((options) => sent = options);

        await UserService(client).editSettings(
          showTrackerInTorrents: true,
          downloadSpeedInTab: true,
          jdownloaderNotifications: true,
          stremioLimitPerResolutionTorrent: 5,
          appendFilenameToLinks: true,
          subscribedEmailSegments: ['a'],
          dashboardFilter: DashboardFilter(active: true),
        );

        final body = sent!.data as Map<String, dynamic>;
        // The field count guards against a silently added or removed setting.
        expect(body, hasLength(62));
        expect(body['show_tracker_in_torrents'], isTrue);
        expect(body['download_speed_in_tab'], isTrue);
        expect(body['jdownloader_notifications'], isTrue);
        expect(body['stremio_limit_per_resolution_torrent'], 5);
        expect(body['append_filename_to_links'], isTrue);
        expect(body['subscribed_email_segments'], ['a']);
        expect(body['dashboard_filter'], isNotNull);
      });
    });

    group('multipart forms', () {
      test('create requests omit null fields and keep the rest', () async {
        RequestOptions? sent;
        final client = _capturingClient((options) => sent = options);

        // Every field set: the form carries the complete field list.
        await UsenetService(client).createUsenetDownload(
          link: 'l',
          name: 'n',
          password: 'p',
          postProcessing: 2,
          asQueued: true,
          addOnlyIfCached: false,
        );
        expect(_formValues(sent!), {
          'link': 'l',
          'name': 'n',
          'password': 'p',
          'post_processing': '2',
          'as_queued': 'true',
          'add_only_if_cached': 'false',
        });

        // A null field is omitted from the form.
        await UsenetService(client).createUsenetDownload(link: 'l');
        expect(_formValues(sent!), {'link': 'l'});

        await WebDownloadsService(client).asyncCreateWebDownload(
          link: 'l',
          name: 'n',
          password: 'p',
          asQueued: true,
          addOnlyIfCached: false,
        );
        expect(_formValues(sent!), {
          'link': 'l',
          'name': 'n',
          'password': 'p',
          'as_queued': 'true',
          'add_only_if_cached': 'false',
        });
      });

      test('a file is sent as multipart content, not as a field', () async {
        RequestOptions? sent;
        final client = _capturingClient((options) => sent = options);
        final upload = TorboxFileUpload(
          filename: 'up.torrent',
          bytes: Uint8List.fromList([7, 8]),
        );

        await TorrentsService(client).createTorrent(file: upload, name: 'n');

        final form = sent!.data as FormData;
        // The file is never a form field.
        expect(_formKeys(sent!), isNot(contains('file')));
        expect(Map<String, String>.fromEntries(form.fields), {'name': 'n'});
        expect(form.files, hasLength(1));
        expect(form.files.single.key, 'file');
        expect(form.files.single.value.filename, 'up.torrent');
        expect(form.files.single.value.length, 2);
      });

      test('torrent info post', () async {
        RequestOptions? sent;
        final client = _capturingClient((options) => sent = options);

        await TorrentsService(client).getTorrentInfoPost(
          timeout: 30,
          hash: 'h',
          magnet: 'm',
          useCacheLookup: true,
          peersOnly: false,
        );
        expect(_formValues(sent!), {
          'timeout': '30',
          'hash': 'h',
          'magnet': 'm',
          'use_cache_lookup': 'true',
          'peers_only': 'false',
        });
      });
    });

    test('check cached availability sends the hash list', () async {
      RequestOptions? sent;
      final client = _capturingClient((options) => sent = options);

      await TorrentsService(client).checkCachedAvailabilityPost(
        hashes: ['a', 'b'],
        format: 'list',
      );
      expect(sent!.data, {'hashes': ['a', 'b']});
      expect(sent!.queryParameters, {'format': 'list'});
    });
  });

  group('real mylist response', () {
    // Captured verbatim from `GET /v1/api/torrents/mylist`. Note there is no
    // `inactive_check` field on the wire, which is why none of the item
    // models declare one.
    const body = '''
{
  "success": true,
  "error": null,
  "detail": "Torrent list retrieved successfully.",
  "data": [
    {
      "id": 0,
      "auth_id": "string",
      "server": 0,
      "hash": "string",
      "name": "string",
      "magnet": "string",
      "size": 0,
      "active": false,
      "created_at": "2026-03-08T21:21:28Z",
      "updated_at": "2026-03-08T21:21:41Z",
      "download_state": "string",
      "seeds": 0,
      "peers": 0,
      "ratio": 0,
      "progress": 0,
      "download_speed": 0,
      "upload_speed": 0,
      "eta": 0,
      "torrent_file": true,
      "expires_at": "2026-04-07T21:21:41Z",
      "download_present": true,
      "files": [
        {
          "id": 0,
          "md5": "string",
          "hash": "string",
          "name": "string",
          "size": 0,
          "zipped": false,
          "s3_path": "string",
          "infected": false,
          "mimetype": "string",
          "short_name": "string",
          "absolute_path": "string",
          "opensubtitles_hash": "string"
        }
      ],
      "download_path": "string",
      "availability": 0,
      "download_finished": true,
      "tracker": "string",
      "total_uploaded": 0,
      "total_downloaded": 0,
      "cached": true,
      "owner": "string",
      "seed_torrent": false,
      "allow_zipped": true,
      "long_term_seeding": false,
      "tracker_message": "string",
      "cached_at": "2026-04-07T21:21:41Z",
      "private": false,
      "alternative_hashes": ["string", "string"],
      "tags": ["string", "string"],
      "airlocked": false
    }
  ]
}''';

    test('every field on the wire is modelled', () {
      final res = _decode(body, _listOf(TorrentData.fromJson));
      final torrent = res.data!.single;
      expect(torrent.id, 0);
      expect(torrent.authId, 'string');
      expect(torrent.server, 0);
      expect(torrent.uploadSpeed, 0);
      expect(torrent.torrentFile, isTrue);
      expect(torrent.expiresAt, '2026-04-07T21:21:41Z');
      expect(torrent.downloadPresent, isTrue);
      expect(torrent.availability, 0);
      expect(torrent.downloadFinished, isTrue);
      expect(torrent.tracker, 'string');
      expect(torrent.cached, isTrue);
      expect(torrent.owner, 'string');
      expect(torrent.seedTorrent, isFalse);
      expect(torrent.allowZipped, isTrue);
      expect(torrent.longTermSeeding, isFalse);
      expect(torrent.trackerMessage, 'string');
      expect(torrent.private, isFalse);
      expect(torrent.alternativeHashes, hasLength(2));
      expect(torrent.tags, hasLength(2));
      expect(torrent.airlocked, isFalse);
    });

    test('file entries keep md5 and s3_path', () {
      final res = _decode(body, _listOf(TorrentData.fromJson));
      final file = res.data!.single.files!.single;
      expect(file.id, 0);
      expect(file.md5, 'string');
      expect(file.hash, 'string');
      expect(file.name, 'string');
      expect(file.size, 0);
      expect(file.zipped, isFalse);
      expect(file.s3Path, 'string');
      expect(file.infected, isFalse);
      expect(file.mimetype, 'string');
      expect(file.shortName, 'string');
      expect(file.absolutePath, 'string');
      expect(file.opensubtitlesHash, 'string');
    });

    test('round-trips through toJson without losing wire fields', () {
      final res = _decode(body, _listOf(TorrentData.fromJson));
      final json = res.data!.single.toJson();
      for (final key in const [
        'auth_id',
        'server',
        'upload_speed',
        'torrent_file',
        'availability',
        'alternative_hashes',
        'tags',
        'airlocked',
      ]) {
        expect(json.containsKey(key), isTrue, reason: 'missing $key');
      }
      expect(
        (json['files'] as List<dynamic>).single.containsKey('s3_path'),
        isTrue,
      );
      expect(
        (json['files'] as List<dynamic>).single.containsKey('md5'),
        isTrue,
      );
    });
  });

  group('file and xml responses', () {
    test('exportTorrentDataAsTorrentFile streams the body to disk', () async {
      final client = TorboxClient(baseUrl: 'https://example.com');
      client.dio.httpClientAdapter = _ScriptedAdapter(
        () => ResponseBody.fromBytes(
          Uint8List.fromList('d8:announce'.codeUnits),
          200,
        ),
      );
      final dir = await Directory.systemTemp.createTemp('torbox_test');
      addTearDown(() => dir.delete(recursive: true));

      final path = await TorrentsService(client).exportTorrentDataAsTorrentFile(
        torrentId: 42,
        savePath: '${dir.path}/out.torrent',
      );

      expect(path, '${dir.path}/out.torrent');
      expect(File(path).readAsStringSync(), 'd8:announce');
    });

    test('XmlDocument carries the payload and compares by value', () {
      const a = XmlDocument('<rss></rss>');
      const b = XmlDocument('<rss></rss>');
      expect(a, b);
      expect(a.hashCode, b.hashCode);
      expect(a, isNot(const XmlDocument('<rss/>')));
      expect(a.toString(), '<rss></rss>');
      expect(a.xml, '<rss></rss>');
    });
  });
}

/// [HttpClientAdapter] that serves canned responses in order.
class _ScriptedAdapter implements HttpClientAdapter {
  final ResponseBody Function() _next;
  final void Function(RequestOptions)? onFetch;

  _ScriptedAdapter(this._next, {this.onFetch});

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    onFetch?.call(options);
    return _next();
  }

  @override
  void close({bool force = false}) {}
}
