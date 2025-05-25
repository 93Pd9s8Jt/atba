import 'package:atba/services/torbox_service.dart' as torbox;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            AddWebDownloadsTab(apiService: apiService),
            AddTorrentsTab(),
            AddUsenetTab(),
          ],
        ),
      ),
    );
  }
}

class AddWebDownloadsTab extends StatefulWidget {
  final torbox.TorboxAPI apiService;

  const AddWebDownloadsTab({super.key, required this.apiService});

  @override
  _AddWebDownloadsTabState createState() => _AddWebDownloadsTabState();
}

class _AddWebDownloadsTabState extends State<AddWebDownloadsTab> {
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

class AddTorrentsTab extends StatefulWidget {
  const AddTorrentsTab({super.key});

  @override
  _AddTorrentsTabState createState() => _AddTorrentsTabState();
}

class _AddTorrentsTabState extends State<AddTorrentsTab> {
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

class AddUsenetTab extends StatefulWidget {
  const AddUsenetTab({super.key});

  @override
  _AddUsenetTabState createState() => _AddUsenetTabState();
}

class _AddUsenetTabState extends State<AddUsenetTab> {
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
