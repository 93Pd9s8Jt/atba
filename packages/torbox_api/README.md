# torbox_api

Dart client for the [TorBox API](https://torbox.app): typed models, a
Dio-based HTTP layer, and domain services behind a single entry point.
Covers torrents, Usenet, web downloads, streaming, user, notifications,
RSS feeds, integrations, queued downloads, and general endpoints.

## Setup

```yaml
dependencies:
  torbox_api:
    path: packages/torbox_api
```

## Quick start

```dart
import 'package:torbox_api/torbox_api.dart';

final api = TorboxApi(token: 'your-api-token');

// GET with a typed payload.
final torrents = await api.torrents.getTorrentList(limit: 10);
if (torrents.success) {
  for (final t in torrents.data ?? const []) {
    print('${t.name} (${t.downloadState})');
  }
}

// POST with a request model
await api.torrents.createTorrent(magnet: 'magnet:?xt=urn:btih:…');

// File upload
await api.torrents.createTorrent(
  file: TorboxFileUpload(filename: 'file.torrent', bytes: bytes),
  name: 'My torrent',
);
```

Attachments are raw bytes plus the original filename, so uploads work
on every platform (`dart:io` `File` does not exist on web). Read the
bytes yourself: `File(path).readAsBytes()` on native, or
`PlatformFile.bytes` from file_picker on web.

Update credentials or endpoint at runtime:

```dart
api.setToken(newToken);
api.baseUrl = 'https://custom-host/v1';
```
## Responses

Every service method returns a `TorBoxResponse<T>` envelope:

| Field    | Meaning                                                      |
|----------|--------------------------------------------------------------|
| `success`| Whether the request succeeded                                |
| `error`  | Machine-readable code (`BAD_TOKEN`, …) or `null` on success  |
| `detail` | Human-readable message                                       |
| `data`   | Typed payload (`T?`) — models, lists, maps, `String`, `Uri`, or `Null`.

Endpoints whose payload is provably empty use `TorBoxResponse<Null>`;
endpoints with undocumented shapes use `TorBoxResponse<dynamic>`.
RSS/XML feeds return raw `String`.

## Error handling

Transport and HTTP failures throw `TorboxApiException` — raw Dio
errors never escape the client. It carries `message`, `statusCode`
(`-1` for non-HTTP errors), `isHttpError`, the failed request `uri`,
plus the envelope's `errorCode`/`detail` when the server sent a JSON
error body:

```dart
try {
  final res = await api.user.getUserData();
  if (!res.success) print(res.error); // 200 with success: false
} on TorboxApiException catch (e) {
  print('${e.uri} -> ${e.statusCode} [${e.errorCode}]: '
      '${e.detail ?? e.message}');
}
```

Failed requests are retried automatically (408 / 429 / 5xx and
timeouts, exponential backoff with jitter, honoring `Retry-After`).
Tune globally via `TorboxApi(maxAttempts: …, retryDelay: …, timeout: …)`.

## Services

| Accessor            | Endpoints                                              |
|---------------------|--------------------------------------------------------|
| `api.torrents`      | create/control/mylist/checkcached/export/info/edit…    |
| `api.usenet`        | create/control/mylist/checkcached/edit/provider…       |
| `api.webDownloads`  | create/control/mylist/checkcached/hosters/edit…        |
| `api.stream`        | `createstream`, `getstreamdata`                        |
| `api.user`          | me/stats/referral/subscriptions/transactions/devices…  |
| `api.notifications` | JSON + RSS feeds, clear, test                          |
| `api.rssFeeds`      | add/control/modify/getfeeds/getfeeditems               |
| `api.integrations`  | cloud queues, jobs, OAuth register/linked-roles        |
| `api.queued`        | getqueued/controlqueued                                |
| `api.general`       | stats, changelogs (JSON + RSS), speedtest              |


## Testing

Run tests: `flutter test test/torbox_api_test.dart`.

`test/torbox_live_test.dart` exercises the real API read-only
(no mutations, no metered links) and is skipped unless set:

```powershell
$env:TORBOX_API_KEY='<key>'; flutter test test/torbox_live_test.dart
```
