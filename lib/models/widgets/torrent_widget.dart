import 'package:atba/models/torrent.dart';
import 'package:atba/services/downloads_page_state.dart';
import 'package:atba/services/torrent_name_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:provider/provider.dart';

class TorrentWidget extends StatelessWidget {
  final Torrent torrent;
  const TorrentWidget({super.key, required this.torrent});

  /* Torrent states:
  TorBox:
  "downloading" -> The torrent is currently downloading.
  "uploading" -> The torrent is currently seeding.
  "stalled (no seeds)" -> The torrent is trying to download, but there are no seeds connected to download from.
  "paused" -> The torrent is paused.
  "completed" -> The torrent is completely downloaded. Do not use this for download completion status.
  "cached" -> The torrent is cached from the server.
  "metaDL" -> The torrent is downloading metadata from the hoard.
  "checkingResumeData" -> The torrent is checking resumable data.

  Qbittorrent:
  error 	Some error occurred, applies to paused torrents
  missingFiles 	Torrent data files is missing
  uploading 	Torrent is being seeded and data is being transferred
  pausedUP 	Torrent is paused and has finished downloading
  queuedUP 	Queuing is enabled and torrent is queued for upload
  stalledUP 	Torrent is being seeded, but no connection were made
  checkingUP 	Torrent has finished downloading and is being checked
  forcedUP 	Torrent is forced to uploading and ignore queue limit
  allocating 	Torrent is allocating disk space for download
  downloading 	Torrent is being downloaded and data is being transferred
  metaDL 	Torrent has just started downloading and is fetching metadata
  pausedDL 	Torrent is paused and has NOT finished downloading
  queuedDL 	Queuing is enabled and torrent is queued for download
  stalledDL 	Torrent is being downloaded, but no connection were made
  checkingDL 	Same as checkingUP, but torrent has NOT finished downloading
  forcedDL 	Torrent is forced to downloading to ignore queue limit
  checkingResumeData 	Checking resume data on qBt startup
  moving 	Torrent is moving to another location


*/

  static const Map<String, Map<String, dynamic>> torrentStatuses = {
    // TorBox
    "downloading": {"color": Colors.blue, "icon": Icons.cloud_download},
    "uploading": {"color": Colors.green, "icon": Icons.cloud_upload},
    "stalled (no seeds)": {"color": Colors.yellow, "icon": Icons.stop},
    "paused": {"color": Colors.grey, "icon": Icons.pause},
    "completed": {"color": Colors.green, "icon": Icons.check_circle},
    "cached": {"color": Colors.grey, "icon": Icons.cached},
    "metaDL": {"color": Colors.yellow, "icon": Icons.arrow_circle_down},
    "checkingResumeData": {"color": Colors.yellow, "icon": Icons.stop},
    // Qbittorrent
    "error": {"color": Colors.red, "icon": Icons.error},
    "missingFiles": {"color": Colors.red, "icon": Icons.error},
    "pausedUP": {"color": Colors.yellow, "icon": Icons.pause},
    "queuedUP": {"color": Colors.yellow, "icon": Icons.arrow_circle_down},
    "uploading (no peers)": {
      "color": Colors.yellow,
      "icon": Icons.cloud_upload
    },
    "stalledUP": {"color": Colors.yellow, "icon": Icons.stop},
    "checkingUP": {"color": Colors.yellow, "icon": Icons.stop},
    "forcedUP": {"color": Colors.yellow, "icon": Icons.stop},
    "allocating": {"color": Colors.yellow, "icon": Icons.stop},
    "pausedDL": {"color": Colors.yellow, "icon": Icons.pause},
    "queuedDL": {"color": Colors.yellow, "icon": Icons.arrow_circle_down},
    "stalledDL": {"color": Colors.yellow, "icon": Icons.stop},
    "checkingDL": {"color": Colors.yellow, "icon": Icons.stop},
    "forcedDL": {"color": Colors.yellow, "icon": Icons.stop},
    "moving": {"color": Colors.yellow, "icon": Icons.stop},
  };

  @override
  Widget build(BuildContext context) {
    return Consumer<DownloadsPageState>(builder: (context, state, child) {
      PTN ptn = PTN();
      final isCensored =
          Provider.of<DownloadsPageState>(context).isTorrentNamesCensored;
      final isSelected = Provider.of<DownloadsPageState>(context)
          .selectedTorrents
          .contains(torrent);
      final torrentState = torrent.active
          ? torrent.downloadState
          : torrent.downloadState == "uploading"
              ? "cached"
              : torrent.downloadState;

      return Container(
        color:
            isSelected ? Theme.of(context).highlightColor : Colors.transparent,
        child: ListTile(
          leading: () {
            switch (torrent.status) {
              case TorrentStatus.loading:
                return CircularProgressIndicator();
              case TorrentStatus.success:
                return Icon(Icons.check, color: Colors.green);
              case TorrentStatus.error:
                return Icon(Icons.error, color: Colors.red);
              default:
                return Icon(
                  torrentStatuses[torrentState]?['icon'] ?? Icons.question_mark,
                  color: torrentStatuses[torrentState]?['color'] ?? Colors.grey,
                );
            }
          }(),
          title: Text(
            Settings.getValue<bool>("key-use-torrent-name-parsing", defaultValue: false)! ? ptn.parse(torrent.name)['title'] : torrent.name,
            style: isCensored
                ? TextStyle(
                    backgroundColor:
                        Theme.of(context).textTheme.bodySmall?.color)
                : null,
          ),
          subtitle: () {
            switch (torrent.status) {
              case TorrentStatus.loading:
                return Text('Loading...');
              case TorrentStatus.success:
                return Text('Success');
              case TorrentStatus.error:
                return Text('Error: ${torrent.errorMessage}');
              default:
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(torrentState),
                        ),

                        SizedBox(width: 4.0), // this will be left floating if ratio is 0
                        torrent.ratio == 0
                            ? Container()
                            : Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(torrent.ratio.toStringAsFixed(2)),
                        ),
                      ],
                    ),
                    if (torrentState.toLowerCase() == 'downloading')
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: LinearProgressIndicator(value: torrent.progress),
                      ),
                  ],
                );
            }
          }(),
          trailing: Text(getReadableSize(torrent.size)),
          // TODO: fully implement
          onTap: () {
            if (Provider.of<DownloadsPageState>(context, listen: false)
                .isSelecting) {
              Provider.of<DownloadsPageState>(context, listen: false)
                  .toggleSelection(torrent);
            } //else {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => TorrentDetailScreen(torrent: torrent),
          //       ),
          //     );
          //   }
          },
          onLongPress: () {
            Provider.of<DownloadsPageState>(context, listen: false)
                .startSelection(torrent);
          },
        ),
      );
    });
  }
}

class QueuedTorrentWidget extends StatelessWidget {
  final QueuedTorrent torrent;
  const QueuedTorrentWidget({super.key, required this.torrent});

  @override
  Widget build(BuildContext context) {
    final isCensored =
        Provider.of<DownloadsPageState>(context).isTorrentNamesCensored;
    final isSelected = Provider.of<DownloadsPageState>(context)
        .selectedTorrents
        .contains(torrent);

    return Container(
      color: isSelected ? Theme.of(context).highlightColor : Colors.transparent,
      child: ListTile(
        title: Text(torrent.name,
            style: isCensored
                ? TextStyle(
                    backgroundColor:
                        Theme.of(context).textTheme.bodySmall?.color)
                : null),
      ),
    );
  }
}

class TorrentDetailScreen extends StatelessWidget {
  final Torrent torrent;
  const TorrentDetailScreen({super.key, required this.torrent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(torrent.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Status: ${torrent.downloadState}',
                style: TextStyle(fontSize: 18)),
            if (torrent.progress < 1)
              Column(
                children: [
                  SizedBox(height: 10),
                  LinearProgressIndicator(value: torrent.progress),
                ],
              ),
            SizedBox(height: 10),
            Text('Size: ${getReadableSize(torrent.size)}',
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}