import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter/material.dart';
import 'package:atba/services/torbox_service.dart' as torbox;
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:atba/models/torrent.dart';
import 'package:atba/models/widgets/torrentlist.dart';
import 'package:atba/services/downloads_page_state.dart';
import 'package:atba/models/permission_model.dart';

class DownloadsPage extends StatelessWidget {
  const DownloadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DownloadsPageState(context),
      child: Consumer<DownloadsPageState>(
        builder: (context, state, child) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                if (state.isSelecting)
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.select_all),
                        onPressed: () {
                          state.selectAllTorrents();
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.flip),
                        onPressed: () {
                          state.invertSelection();
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          state.clearSelection();
                        },
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      PopupMenuButton<String>(
                        icon: const Icon(Icons.sort),
                        onSelected: (String value) {
                          state.updateSortingOption(value);
                        },
                        itemBuilder: (BuildContext context) {
                          return DownloadsPageState.sortingOptions.keys
                              .map<PopupMenuItem<String>>((String value) {
                            return PopupMenuItem<String>(
                              value: value,
                              child: Row(
                              children: [
                                Text(value),
                                if (state.selectedSortingOption == value)
                                Icon(Icons.check, color: Colors.blue),
                              ],
                              ),
                            );
                          }).toList();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.filter_list),
                        onPressed: () => _showFilterBottomSheet(context),
                      ),
                      IconButton(
                        icon: state.isTorrentNamesCensored
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onPressed: () {
                          state.toggleTorrentNamesCensoring();
                        },
                      ),
                      // IconButton(
                      //   icon: Icon(Icons.search),
                      //   onPressed: () {
                      //     // Implement search functionality here.
                      //   },
                      // )
                    ],
                  ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: FutureBuilder(
                    future: state.torrentsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data as Map<String, dynamic>;
                        if (data.containsKey("success") &&
                            data["success"] != true) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Column(
                                children: [
                                  Text(
                                      'Failed to fetch data: ${data["detail"]}',
                                      style:
                                          const TextStyle(color: Colors.red)),
                                  data["stackTrace"] != null
                                      ? ElevatedButton(
                                          child: const Text('Copy stack trace'),
                                          onPressed: () {
                                            Clipboard.setData(ClipboardData(
                                                text: data["stackTrace"]
                                                    .toString()));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
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
                        
                        return TorrentsList();
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
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            state.deleteSelectedTorrents();
                          },
                        ),
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
                          icon: Icon(Icons.download),
                          onPressed: () async {
                            if (Settings.getValue<String>("folder_path") ==
                                null) {
                              bool granted =
                                  await _showPermissionDialog(context);
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
                    ),
                  ),
              ],
            ),
            floatingActionButton: state.isSelecting
                ? SizedBox.shrink()
                : FloatingActionButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const FullscreenMenu();
                        },
                      );
                    },
                    child: const Icon(Icons.add),
                  ),
          );
        },
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

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (context2) {
        return ChangeNotifierProvider<DownloadsPageState>.value(
            value: context.watch<DownloadsPageState>(),
            builder: (context, _) {
              return Theme(
                data: Theme.of(context).copyWith(),
                child: StatefulBuilder(
                  builder: (BuildContext _, StateSetter setState) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const ListTile(
                            title: Text('Main'),
                          ),
                          _buildMainFilters(context,  setState),
                          // const ListTile(title: Text("Qualities")),
                          // _buildQualityFilters(context, setState),
                        ],
                      ),
                    );
                  },
                ),
              );
            });
      },
    );
  }

  Widget _buildMainFilters(
      BuildContext context, StateSetter setState) {
    return Consumer<DownloadsPageState>(
      builder: (context, state, child) {
        return Wrap(
          spacing: 8.0,
          children: DownloadsPageState.filters.keys.map((filter) {
            return FilterChip(
              label: Text(filter, style: const TextStyle(fontSize: 12)),
              selected: state.selectedMainFilters.contains(filter),
              onSelected: (selected) {
                setState(() {
                  state.updateFilter(filter, selected);
                });
              },
              showCheckmark: false,
            );
          }).toList(),
        );
      },
    );
  }

  // Widget _buildQualityFilters(BuildContext context, StateSetter setState) {
  //   return Consumer<DownloadsPageState>(
  //     builder: (context, state, child) {
  //       return Wrap(
  //         spacing: 8.0,
  //         children: DownloadsPageState.qualityFilters.keys.map((filter) {
  //           return FilterChip(
  //             label: Text(filter, style: const TextStyle(fontSize: 12)),
  //             selected: state.selectedQualityFilters.contains(filter),
  //             onSelected: (selected) {
  //               setState(() {
  //                 state.updateQualityFilter(filter, selected);
  //               });
  //             },
  //             showCheckmark: false,
  //           );
  //         }).toList(),
  //       );
  //     },
  //   );
  // }
}

class FullscreenMenu extends StatelessWidget {
  const FullscreenMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = Provider.of<torbox.TorboxAPI>(context, listen: false);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Web Downloads'),
              Tab(text: 'Torrents'),
              Tab(text: 'Usenet'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            WebDownloadsTab(apiService: apiService),
            TorrentsTab(),
            UsenetTab(),
          ],
        ),
      ),
    );
  }
}

class WebDownloadsTab extends StatefulWidget {
  final torbox.TorboxAPI apiService;

  const WebDownloadsTab({super.key, required this.apiService});

  @override
  _WebDownloadsTabState createState() => _WebDownloadsTabState();
}

class _WebDownloadsTabState extends State<WebDownloadsTab> {
  final TextEditingController urlsController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: urlsController,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'URLs to Download',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'Password (optional)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          _isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });

                    final urls = urlsController.text.split('\n');
                    final password = passwordController.text.isNotEmpty
                        ? passwordController.text
                        : null;

                    for (var url in urls) {
                      var response = await widget.apiService.makeRequest(
                          'api/webdl/createwebdownload',
                          method: 'post',
                          body: {
                            "link": url.trim(),
                            "password": password,
                          });
                      if (response.success != true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Failed to add $url: ${response.detail}'),
                          ),
                        );
                      }
                    }

                    setState(() {
                      _isLoading = false;
                    });
                  },
                  child: const Text('Add'),
                ),
        ],
      ),
    );
  }
}

class TorrentsTab extends StatefulWidget {
  const TorrentsTab({super.key});

  @override
  _TorrentsTabState createState() => _TorrentsTabState();
}

class _TorrentsTabState extends State<TorrentsTab> {
  final TextEditingController magnetLinkController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final apiService = Provider.of<torbox.TorboxAPI>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: magnetLinkController,
            decoration: const InputDecoration(
              labelText: 'Magnet Link',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['torrent'],
              );

              if (result != null) {
                PlatformFile file = result.files.first;

                setState(() {
                  _isLoading = true;
                });

                var response = await apiService.makeRequest(
                  'api/torrents/createtorrent',
                  method: 'post',
                  body: {
                    "file": file, // file is handled on api side
                    "magnet": null,
                    "seed": null,
                    "allow_zip": null,
                    "name": file.name,
                    "as_queued": null,
                  },
                );

                if (response.success == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Torrent added successfully'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Failed to add torrent: ${response.detailOrUnknown}'),
                    ),
                  );
                }

                setState(() {
                  _isLoading = false;
                });
              }
            },
            child: const Text('Upload .torrent file'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle search via Torbox API
            },
            child: const Text('Search via Torbox API'),
          ),
          const SizedBox(height: 16),
          _isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });

                    final magnetLink = magnetLinkController.text.trim();

                    var response = await apiService.makeRequest(
                      'api/torrents/createtorrent',
                      method: 'post',
                      body: {
                        "magnet": magnetLink,
                        "seed": null,
                        "allow_zip": null,
                        "name": null,
                        "as_queued": null,
                      },
                    );

                    if (response.success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Torrent added successfully'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Failed to add torrent: ${response.detailOrUnknown}'),
                        ),
                      );
                    }

                    setState(() {
                      _isLoading = false;
                    });
                  },
                  child: const Text('Add'),
                ),
        ],
      ),
    );
  }
}

class UsenetTab extends StatefulWidget {
  const UsenetTab({super.key});

  @override
  _UsenetTabState createState() => _UsenetTabState();
}

class _UsenetTabState extends State<UsenetTab> {
  final TextEditingController linkController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final apiService = Provider.of<torbox.TorboxAPI>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: linkController,
            decoration: const InputDecoration(
              labelText: 'NZB File URL',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'Password (optional)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.any,
              );

              if (result != null) {
                PlatformFile file = result.files.first;

                setState(() {
                  _isLoading = true;
                });

                var response = await apiService.makeRequest(
                  'api/usenet/createusenetdownload',
                  method: 'post',
                  body: {
                    "file": file, // file is handled on api side
                    "link": null,
                    "name": file.name,
                    "password": passwordController.text.isNotEmpty
                        ? passwordController.text
                        : null,
                    "post_processing": null,
                  },
                );

                if (response.success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Usenet download added successfully'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Failed to add Usenet download: ${response.detailOrUnknown}'),
                    ),
                  );
                }

                setState(() {
                  _isLoading = false;
                });
              }
            },
            child: const Text('Upload .nzb file'),
          ),
          const SizedBox(height: 16),
          _isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });

                    final link = linkController.text.trim();
                    final password = passwordController.text.isNotEmpty
                        ? passwordController.text
                        : null;

                    var response = await apiService.makeRequest(
                      'api/usenet/createusenetdownload',
                      method: 'post',
                      body: {
                        "file": null,
                        "link": link,
                        "name": null,
                        "password": password,
                        "post_processing": null,
                      },
                    );

                    if (response.success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Usenet download added successfully'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Failed to add Usenet download: ${response.detailOrUnknown}'),
                        ),
                      );
                    }

                    setState(() {
                      _isLoading = false;
                    });
                  },
                  child: const Text('Add'),
                ),
        ],
      ),
    );
  }
}
