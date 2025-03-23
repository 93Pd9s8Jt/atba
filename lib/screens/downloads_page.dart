import 'package:flutter/material.dart';
import 'package:atba/services/api_service.dart';
import 'package:provider/provider.dart';
import 'package:atba/parse_torrent_name.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:file_picker/file_picker.dart';

class DownloadsPage extends StatefulWidget {
  const DownloadsPage({super.key});

  @override
  BrowsePageState createState() => BrowsePageState();
}

class BrowsePageState extends State<DownloadsPage> {
  bool _isTorrentNamesCensored = false;

  static const Map<String, Map<String, dynamic>> torrentStatuses = {
    "cached": {"color": Colors.grey, "icon": Icons.cached},
    "downloading": {"color": Colors.blue, "icon": Icons.cloud_download},
    "paused": {"color": Colors.grey, "icon": Icons.pause},
    "uploading": {"color": Colors.green, "icon": Icons.cloud_upload},
    "uploading (no peers)": {"color": Colors.green, "icon": Icons.cloud_upload},
    "completed": {"color": Colors.green, "icon": Icons.check_circle},
    "stalled (no seeds)": {"color": Colors.yellow, "icon": Icons.stop},
    "failed (processing)": {"color": Colors.orange, "icon": Icons.error},
    "processing": {"color": Colors.yellow, "icon": Icons.arrow_circle_right},
    "stoppedUP": {"color": Colors.red, "icon": Icons.stop}, // completed
  };

  static final Map<String, Function> _filters = {
    "Usenet": (json) => false,
    "Download Ready": (json) => json["download_finished"] as bool,
    "Web downloads": (json) => false,
    "Uploading": (json) => json["upload_speed"] as num > 0,
    "Downloading": (json) => json["download_speed"] as num > 0,
    "Torrents": (json) => true,
    "Inactive": (json) => !json["active"],
    "Cached": (json) => json["cached"] as bool,
    "Active": (json) => json["active"] as bool,
    "I": (json) => (json["name"] as String).startsWith("I"),
  };
  static int _compareDates(String a, String b) {
    final aDate = DateTime.parse(a);
    final bDate = DateTime.parse(b);
    return aDate.compareTo(bDate);
  }

  static Map<String, int? Function(dynamic, dynamic)> sortingOptions = {
    "Default": (a, b) => null,
    "A to Z": (a, b) => (a["name"] as String)
        .toLowerCase()
        .compareTo((b["name"] as String).toLowerCase()),
    "Z to A": (a, b) => -(a["name"] as String)
        .toLowerCase()
        .compareTo((b["name"] as String).toLowerCase()),
    "Largest": (a, b) => a["size"].compareTo(b["size"]),
    "Smallest": (a, b) => -a["size"].compareTo(b["size"]),
    "Oldest": (a, b) => _compareDates(a["created_at"], b["created_at"]),
    "Newest": (a, b) => -_compareDates(a["created_at"], b["created_at"]),
    "Recently updated": (a, b) =>
        _compareDates(a["updated_at"], b["updated_at"])
  };

  String _selectedSortingOption = "Default";
  final bool _useTNP =
      Settings.getValue<bool>("key-use-torrent-name-parsing") ?? true;

  final List<String> _selectedMainFilters =
      List.from(_filters.keys); // everything selected initially

  @override
  void initState() {
    super.initState();
    setState(() {
      _isTorrentNamesCensored = false;
    });
  }

  void _updateFilter(String filter, bool selected) {
    setState(() {
      if (selected) {
        _selectedMainFilters.add(filter);
      } else {
        _selectedMainFilters.remove(filter);
      }
    });
  }

  String toTitleCase(String input) {
    if (input.isEmpty) return '';

    // List of small words to keep lowercase unless they're the first or last word
    const smallWords = {
      'a',
      'an',
      'the',
      'and',
      'but',
      'or',
      'as',
      'at',
      'by',
      'for',
      'in',
      'of',
      'on',
      'to',
      'up',
      'with',
      'is',
      'it'
    };

    const punctuation = {'.', ',', '!', '?', ';', ':'};

    List<String> words =
        input.toLowerCase().replaceAll(RegExp(r" +"), ' ').split(' ');
    for (int i = 0; i < words.length; i++) {
      if (i == words.length - 1 ||
          !smallWords.contains(words[i]) ||
          i != 0 && punctuation.any((punc) => words[i - 1].endsWith(punc))) {
        words[i] = words[i][0].toUpperCase() + words[i].substring(1);
      }
    }

    return words.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    final apiService = Provider.of<TorboxAPI>(context, listen: false);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // allow the user to add torrents / web downlaods / usenet
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const FullscreenMenu();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Downloads'),
        actions: [
                Checkbox(
                    value: _isTorrentNamesCensored,
                    onChanged: (value) {
                      setState(() => _isTorrentNamesCensored = value ?? false);
                    }),
                const Text('Censor names'),
                _buildSortMenu(),
                IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: _showFilterBottomSheet),
              ],
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(top: 16.0),
          //   child: Row(
          //     children: [
          //       Checkbox(
          //           value: _isTorrentNamesCensored,
          //           onChanged: (value) {
          //             setState(() => _isTorrentNamesCensored = value ?? false);
          //           }),
          //       const Text('Censor names'),
          //       _buildSortMenu(),
          //       IconButton(
          //           icon: const Icon(Icons.filter_list),
          //           onPressed: _showFilterBottomSheet),
          //     ],
          //   ),
          // ),
          Expanded(
            child: FutureBuilder(
              future: apiService.makeRequest('api/torrents/mylist'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data as Map<String, dynamic>;
                  if (data["success"] != true) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Failed to fetch data: ${data["detail"]}', style: const TextStyle(color: Colors.red)))
                    );
                  }
                  List<dynamic> filteredData = _filterData(data["data"]);
                  if (_selectedSortingOption != "Default") {
                    filteredData.sort((a, b) =>
                        sortingOptions[_selectedSortingOption]!(a, b)!);
                  }
                  return ListView.builder(
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      final download = filteredData[index];
                      final status = download['download_state'];
                      final statusColor =
                          torrentStatuses[status]?['color'] ?? Colors.grey;

                      final statusIcon = torrentStatuses[status]?['icon'] ??
                          Icons.question_mark;
                      PTN ptn = PTN();
                      final parsedTitle = ptn.parse(download['name'] ?? "");
                      return ListTile(
                        leading: Icon(statusIcon, color: statusColor),
                        title: Text(_isTorrentNamesCensored
                            ? 'Torrent ${index + 1}'
                            : _useTNP
                                ? parsedTitle["title"]
                                : download['name']),
                        subtitle: Text(
                            '${(download['size'] / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB - $status'),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ],
      ),
    );
  }

  List<dynamic> _filterData(List<dynamic> data) {
    Map<String, Function> filtersCopy = Map.from(_filters);
    filtersCopy
        .removeWhere((key, value) => !_selectedMainFilters.contains(key));
    print(filtersCopy.entries);
    List<dynamic> newData = data
        .where((value) => filtersCopy.values.any((element) => element(value)))
        .toList();
    return newData;
  }

  Widget _buildMainFilters(StateSetter setState) {
    return Wrap(
      spacing: 8.0,
      children: _filters.keys.map((filter) {
        return FilterChip(
          label: Text(filter, style: const TextStyle(fontSize: 12)),
          selected: _selectedMainFilters.contains(filter),
          onSelected: (selected) {
            setState(() {
              _updateFilter(filter, selected);
            });
          },
          showCheckmark: false,
        );
      }).toList(),
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true, // Ensure it inherits the app's theme
      builder: (context) {
        return Theme(
          data: Theme.of(context).copyWith(),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ListTile(
                      title: Text(
                        'Main',
                      ),
                    ),
                    _buildMainFilters(setState),
                    const ListTile(
                      title: Text('Metadata'),
                    ),
                    // _buildParsedFilters(setState),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildSortMenu() {
    return DropdownButton<String>(
        underline: Container(),
        icon: const Icon(Icons.sort),
        items:
            sortingOptions.keys.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            _selectedSortingOption = value ?? "Default";
          });
        });
  }
}

class FullscreenMenu extends StatelessWidget {
  const FullscreenMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = Provider.of<TorboxAPI>(context, listen: false);

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
  final TorboxAPI apiService;

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
                          requestType: 'post',
                          body: {
                            "link": url.trim(),
                            "password": password,
                          });
                      if (response == null) continue;
                      if (response["success"] != true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Failed to add $url: ${response["detail"]}'),
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
    final apiService = Provider.of<TorboxAPI>(context, listen: false);

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
                  requestType: 'post',
                  body: {
                    "file": file, // file is handled on api side
                    "magnet": null,
                    "seed": null,
                    "allow_zip": null,
                    "name": file.name,
                    "as_queued": null,
                  },
                );

                if (response != null && response["success"] == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Torrent added successfully'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Failed to add torrent: ${response?["detail"] ?? "Unknown error"}'),
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
                      requestType: 'post',
                      body: {
                        "magnet": magnetLink,
                        "seed": null,
                        "allow_zip": null,
                        "name": null,
                        "as_queued": null,
                      },
                    );

                    if (response != null && response["success"] == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Torrent added successfully'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Failed to add torrent: ${response?["detail"] ?? "Unknown error"}'),
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
    final apiService = Provider.of<TorboxAPI>(context, listen: false);

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
                  requestType: 'post',
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

                if (response != null && response["success"] == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Usenet download added successfully'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Failed to add Usenet download: ${response?["detail"] ?? "Unknown error"}'),
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
                      requestType: 'post',
                      body: {
                        "file": null,
                        "link": link,
                        "name": null,
                        "password": password,
                        "post_processing": null,
                      },
                    );

                    if (response != null && response["success"] == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Usenet download added successfully'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Failed to add Usenet download: ${response?["detail"] ?? "Unknown error"}'),
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
