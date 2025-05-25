import 'package:atba/models/permission_model.dart';
import 'package:atba/models/widgets/torrentlist.dart';
import 'package:atba/services/downloads_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:permission_handler/permission_handler.dart';

RefreshIndicator buildTorrentsTab(
    DownloadsPageState state, BuildContext context) {
  return RefreshIndicator(
    onRefresh: () async {
      await state.refreshTorrents(bypassCache: true);
    },
    child: Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: state.torrentsFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data as Map<String, dynamic>;
                if (data.containsKey("success") && data["success"] != true) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Column(
                        children: [
                          Text('Failed to fetch data: ${data["detail"]}',
                              style: const TextStyle(color: Colors.red)),
                          data["stackTrace"] != null
                              ? ElevatedButton(
                                  child: const Text('Copy stack trace'),
                                  onPressed: () {
                                    Clipboard.setData(ClipboardData(
                                        text: data["stackTrace"].toString()));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Stack trace copied to clipboard'),
                                      ),
                                    );
                                  },
                                )
                              : SizedBox(),
                        ],
                      )));
                }

                return state.activeTorrents.isNotEmpty || state.inactiveTorrents.isNotEmpty || state.queuedTorrents.isNotEmpty ?  TorrentsList() : const Center(
                    child: Text('No torrents available'),
                  );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        if (state.isSelecting)
          BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (state.selectedTorrents
                    .any((torrent) => torrent.isLeft)) ...[
                  IconButton(
                    icon: Icon(Icons.play_arrow),
                    onPressed: () {
                      state.resumeSelectedTorrents();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      state.deleteSelectedTorrents();
                    },
                  ),
                ] else ...[
                  IconButton(
                    icon: Icon(Icons.pause),
                    onPressed: () {
                      state.pauseSelectedTorrents();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.play_arrow),
                    onPressed: () {
                      state.resumeSelectedTorrents();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      state.reannounceSelectedTorrents();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      state.deleteSelectedTorrents();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.download),
                    onPressed: () async {
                      if (Settings.getValue<String>("folder_path") == null) {
                        bool granted = await _showPermissionDialog(context);
                        if (granted) {
                          // Proceed with download
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Permission not granted. Cannot proceed with download.'),
                            ),
                          );
                        }
                      } else {
                        // Proceed with download
                        state.downloadSelectedTorrents();
                      }
                    },
                  ),
                ],
              ],
            ),
          ),
      ],
    ),
  );
}

Future<bool> _showPermissionDialog(BuildContext context) async {
  return await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Permission Required'),
            content: const Text(
                'Storage access is required to download files. Do you want to grant permission?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () async {
                  PermissionModel permissionModel = PermissionModel();
                  bool granted = await permissionModel.grantPermission(
                      Permission.storage, context);
                  Navigator.of(context).pop(granted);
                },
                child: const Text('Yes'),
              ),
            ],
          );
        },
      ) ??
      false;
}
