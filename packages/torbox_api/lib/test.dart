import "package:torbox_api/torbox_api.dart";

void main() async {
  final api = TorboxApi(token: 'XX');

  // GET with a typed payload.
  try {
    final torrents = await api.torrents.getTorrentList(limit: 10);
    if (torrents.success) {
      for (final t in torrents.data ?? const []) {
        print('${t.name} (${t.downloadState})');
      }
    }
  } on TorboxApiException {
    print("Bad token!");
  }
}
