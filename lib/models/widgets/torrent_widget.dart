import 'dart:ui';

import 'package:atba/models/downloadable_item.dart';
import 'package:atba/models/torrent.dart';
import 'package:atba/models/widgets/torrent_detail_screen.dart';
import 'package:atba/services/library_page_state.dart';
import 'package:atba/services/torrent_name_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

  String _formatTimeDifference(Duration duration) {
    if (duration.inDays > 0) {
      return '${duration.inDays}d';
    } else if (duration.inHours > 0) {
      return '${duration.inHours}h';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes}m';
    } else {
      return '${duration.inSeconds}s';
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<DownloadsPageState>(context);
    PTN ptn = PTN();
    final isCensored = state.isTorrentNamesCensored;
    final isSelected = state.selectedItems.any((item) =>
        item is Torrent &&
        item.id ==
            torrent.id); // check if the selected items contain this torrent
    final torrentState = torrent.active
        ? torrent.downloadState
        : torrent.downloadState == "uploading"
            ? "cached"
            : torrent.downloadState;

    return Container(
      color: isSelected ? Theme.of(context).highlightColor : Colors.transparent,
      child: ListTile(
        leading: () {
          switch (torrent.itemStatus) {
            case DownloadableItemStatus.loading:
              return CircularProgressIndicator();
            case DownloadableItemStatus.success:
              return Icon(Icons.check, color: Colors.green);
            case DownloadableItemStatus.error:
              return Icon(Icons.error, color: Colors.red);
            default:
              return Icon(
                torrentStatuses[torrentState]?['icon'] ?? Icons.question_mark,
                color: torrentStatuses[torrentState]?['color'] ?? Colors.grey,
              );
          }
        }(),
        title: ImageFiltered(
          enabled: isCensored,
          imageFilter: ImageFilter.blur(
            sigmaX: 6,
            sigmaY: 6,
            tileMode: TileMode.decal,
          ),
          child: Text(
            Settings.getValue<bool>("key-use-torrent-name-parsing",
                    defaultValue: false)!
                ? ptn.parse(torrent.name)['title']
                : torrent.name,
          ),
        ),
        subtitle: () {
          switch (torrent.itemStatus) {
            case DownloadableItemStatus.loading:
              return Text('Loading...');
            case DownloadableItemStatus.success:
              return Text('Success');
            case DownloadableItemStatus.error:
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
                      torrent.ratio == 0
                          ? Container()
                          : Row(
                              children: [
                                SizedBox(width: 4.0),
                                Container(
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(torrent.ratio.toStringAsFixed(2)),
                                ),
                              ],
                            ),
                      torrent.active
                          ? Row(
                              children: [
                                SizedBox(width: 4.0),
                                Container(
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(_formatTimeDifference(
                                      DateTime.now()
                                          .difference(torrent.createdAt))),
                                ),
                              ],
                            )
                          : Container(),
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
        onTap: () {
          if (state.isSelecting) {
            state.toggleSelection(torrent);
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TorrentDetailScreen(torrent: torrent),
              ),
            );
          }
        },
        onLongPress: () {
          state.startSelection(torrent);
        },
      ),
    );
  }
}

class QueuedTorrentWidget extends StatelessWidget {
  final QueuedTorrent torrent;
  const QueuedTorrentWidget({super.key, required this.torrent});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<DownloadsPageState>(context);
    final isCensored = state.isTorrentNamesCensored;
    final isSelected = state.selectedItems.any((item) =>
        item is QueuedTorrent &&
        item.id ==
            torrent.id); // check if the selected items contain this torrent
    PTN ptn = PTN();

    return Container(
      color: isSelected ? Theme.of(context).highlightColor : Colors.transparent,
      child: ListTile(
        title: Text(
          Settings.getValue<bool>("key-use-torrent-name-parsing",
                  defaultValue: false)!
              ? ptn.parse(torrent.name)['title']
              : torrent.name,
        ).animate(target: isCensored ? 1 : 0).blur(),
        leading: () {
          switch (torrent.status) {
            case TorrentStatus.loading:
              return CircularProgressIndicator();
            case TorrentStatus.success:
              return Icon(Icons.check, color: Colors.green);
            case TorrentStatus.error:
              return Icon(Icons.error, color: Colors.red);
            default:
              return null;
          }
        }(),
        subtitle: () {
          switch (torrent.status) {
            case TorrentStatus.loading:
              return Text('Loading...');
            case TorrentStatus.success:
              return Text('Success');
            case TorrentStatus.error:
              return Text('Error: ${torrent.errorMessage}');
            default:
              return null;
          }
        }(),
        onLongPress: () {
          state.startSelection(torrent);
        },
        onTap: () {
          if (state.isSelecting) {
            state.toggleSelection(torrent);
          } // tapping should do nothing, there are no details to show
        },
      ),
    );
  }
}
