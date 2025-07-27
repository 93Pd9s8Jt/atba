import 'package:atba/models/torbox_api_response.dart';
import 'package:atba/services/torbox_service.dart' as torbox;
import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Web Downloads'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter one or more URLs to download, separated by new lines.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: urlsController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'URLs',
                hintText:
                    'http://example.com/file1.zip\nhttp://example.com/file2.rar',
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
            const SizedBox(height: 24),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Add Downloads'),
                    onPressed: () async {
                      if (urlsController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter at least one URL.'),
                          ),
                        );
                        return;
                      }
                      setState(() {
                        _isLoading = true;
                      });

                      final urls = urlsController.text
                          .split('\n')
                          .where((s) => s.trim().isNotEmpty)
                          .toList();
                      final password = passwordController.text.isNotEmpty
                          ? passwordController.text
                          : null;

                      int successCount = 0;
                      for (var url in urls) {
                        var response = await widget.apiService.makeRequest(
                            'api/webdl/createwebdownload',
                            method: 'post',
                            body: {
                              "link": url.trim(),
                              "password": password,
                            });
                        if (response.success == true) {
                          successCount++;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Failed to add $url: ${response.detail}'),
                            ),
                          );
                        }
                      }

                      setState(() {
                        _isLoading = false;
                      });

                      if (successCount > 0 && successCount == urls.length) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                '$successCount download(s) added successfully.'),
                          ),
                        );
                        Navigator.pop(context);
                      } else if (successCount > 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                '$successCount out of ${urls.length} download(s) added successfully.'),
                          ),
                        );
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

class AddMagnetTab extends StatefulWidget {
  const AddMagnetTab({super.key});

  @override
  _AddMagnetTabState createState() => _AddMagnetTabState();
}

class _AddMagnetTabState extends State<AddMagnetTab> {
  final TextEditingController magnetLinkController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final apiService = Provider.of<torbox.TorboxAPI>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Magnet Links'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Paste one or more magnet links to start new torrent downloads.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: magnetLinkController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Magnet Links',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Add Torrents'),
                    onPressed: () async {
                      if (magnetLinkController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Please enter at least one magnet link.'),
                          ),
                        );
                        return;
                      }
                      setState(() {
                        _isLoading = true;
                      });

                      final magnetLinks = magnetLinkController.text
                          .split('\n')
                          .where((s) => s.trim().isNotEmpty)
                          .toList();

                      int successCount = 0;
                      for (var magnetLink in magnetLinks) {
                        var response = await apiService.createTorrent(
                          magnetLink: magnetLink.trim(),
                        );
                        if (response.success) {
                          successCount++;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Failed to add torrent: ${response.detailOrUnknown}'),
                            ),
                          );
                        }
                      }

                      setState(() {
                        _isLoading = false;
                      });

                      if (successCount > 0 &&
                          successCount == magnetLinks.length) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                '$successCount torrent${successCount != 1 ? "s" : ""} added successfully.'),
                          ),
                        );
                        Navigator.pop(context);
                      } else if (successCount > 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                '$successCount out of ${magnetLinks.length} torrent(s) added successfully.'),
                          ),
                        );
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

class AddTorrentFileTab extends StatefulWidget {
  const AddTorrentFileTab({super.key});

  @override
  _AddTorrentFileTabState createState() => _AddTorrentFileTabState();
}

class _AddTorrentFileTabState extends State<AddTorrentFileTab> {
  bool _isLoading = false;
  String? _fileName;

  @override
  Widget build(BuildContext context) {
    final apiService = Provider.of<torbox.TorboxAPI>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Torrent File'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select a .torrent file from your device to start a new download.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.upload_file),
              label: const Text('Select .torrent file'),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['torrent'],
                );

                if (result != null) {
                  PlatformFile file = result.files.first;
                  setState(() {
                    _fileName = file.name;
                  });

                  setState(() {
                    _isLoading = true;
                  });

                  var response = await apiService.createTorrent(
                    dotTorrentFile: file, // file is handled on api side
                    torrentName: file.name,
                  );

                  setState(() {
                    _isLoading = false;
                  });

                  if (response.success == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Torrent added successfully'),
                      ),
                    );
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Failed to add torrent: ${response.detailOrUnknown}'),
                      ),
                    );
                  }
                }
              },
            ),
            const SizedBox(height: 16),
            if (_fileName != null)
              Text('Selected file: $_fileName', textAlign: TextAlign.center),
            const SizedBox(height: 16),
            if (_isLoading) const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}

class AddSearchTorrentTab extends StatefulWidget {
  const AddSearchTorrentTab({super.key});

  @override
  _AddSearchTorrentTabState createState() => _AddSearchTorrentTabState();
}

class _AddSearchTorrentTabState extends State<AddSearchTorrentTab> {
  @override
  Widget build(BuildContext context) {
    return AddSearchTab(type: SearchTabType.torrent);
  }
}

class AddNzbLinkTab extends StatefulWidget {
  const AddNzbLinkTab({super.key});

  @override
  _AddNzbLinkTabState createState() => _AddNzbLinkTabState();
}

class _AddNzbLinkTabState extends State<AddNzbLinkTab> {
  final TextEditingController linkController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final apiService = Provider.of<torbox.TorboxAPI>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Usenet from URL'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter a URL to an NZB file to start a new Usenet download.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 24),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Add from URL'),
                    onPressed: () async {
                      if (linkController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter a URL.'),
                          ),
                        );
                        return;
                      }
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

                      setState(() {
                        _isLoading = false;
                      });

                      if (response.success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Usenet download added successfully'),
                          ),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Failed to add Usenet download: ${response.detailOrUnknown}'),
                          ),
                        );
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

class AddNzbFileTab extends StatefulWidget {
  const AddNzbFileTab({super.key});

  @override
  _AddNzbFileTabState createState() => _AddNzbFileTabState();
}

class _AddNzbFileTabState extends State<AddNzbFileTab> {
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  String? _fileName;

  @override
  Widget build(BuildContext context) {
    final apiService = Provider.of<torbox.TorboxAPI>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Usenet from File'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select an .nzb file from your device to start a new Usenet download.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password (optional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.upload_file),
              label: const Text('Select .nzb file'),
              onPressed: _isLoading
                  ? null
                  : () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type:
                            FileType.any, // Should be more specific if possible
                      );

                      if (result != null) {
                        PlatformFile file = result.files.first;
                        setState(() {
                          _fileName = file.name;
                        });

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

                        setState(() {
                          _isLoading = false;
                        });

                        if (response.success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Usenet download added successfully'),
                            ),
                          );
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Failed to add Usenet download: ${response.detailOrUnknown}'),
                            ),
                          );
                        }
                      }
                    },
            ),
            const SizedBox(height: 16),
            if (_fileName != null)
              Text('Selected file: $_fileName', textAlign: TextAlign.center),
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
      ),
    );
  }
}

class AddUsenetSearchTab extends StatefulWidget {
  const AddUsenetSearchTab({super.key});

  @override
  _AddUsenetSearchTabState createState() => _AddUsenetSearchTabState();
}

class _AddUsenetSearchTabState extends State<AddUsenetSearchTab> {
  @override
  Widget build(BuildContext context) {
    return AddSearchTab(type: SearchTabType.usenet);
  }
}

class AddSearchTab extends StatefulWidget {
  final SearchTabType type;
  const AddSearchTab({super.key, required this.type});

  @override
  _AddSearchTabState createState() => _AddSearchTabState();
}

class _AddSearchTabState extends State<AddSearchTab> {
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  bool _hasSearched = false;
  List<SearchResult> _results = [];
  List<SearchResult> _filteredResults = [];
  List<SearchResult> _sortedFilteredResults = [];
  late String _selectedSortingOption;
  Map<String, List<dynamic>> _selectedFilters = {};
  Set<String> _hasListItemFilters = {};

  @override
  void initState() {
    super.initState();
    _selectedSortingOption = Settings.getValue<String>(
      'search_${widget.type.name}_sorting',
      defaultValue: 'Default',
    )!;
  }

  static Map<String, int Function(SearchResult, SearchResult)> sortingOptions =
      {
    "Default": (a, b) => 0,
    "A to Z": (a, b) =>
        (a.rawTitle).toLowerCase().compareTo(b.rawTitle.toLowerCase()),
    "Z to A": (a, b) =>
        -(a.rawTitle).toLowerCase().compareTo(b.rawTitle.toLowerCase()),
    "Largest": (a, b) => -a.size.compareTo(b.size),
    "Smallest": (a, b) => a.size.compareTo(b.size),
    "Most Seeders": (a, b) => -a.lastKnownSeeders.compareTo(b.lastKnownSeeders),
    "Least Seeders": (a, b) => a.lastKnownSeeders.compareTo(b.lastKnownSeeders),
    "Most Peers": (a, b) => -a.lastKnownPeers.compareTo(b.lastKnownPeers),
    "Least Peers": (a, b) => a.lastKnownPeers.compareTo(b.lastKnownPeers),
    "Oldest": (a, b) => a.age.compareTo(b.age),
    "Newest": (a, b) => -a.age.compareTo(b.age),
  };
  void _applyFilters() {
    _filteredResults = _results.where((result) {
      for (var entry in _selectedFilters.entries) {
        final filterType = entry.key;
        final filterValues = entry.value;
        final resultValue = result.titleParsedData[filterType];

        if (_hasListItemFilters.contains(filterType)) {
          // If the filter is a list, check if all of the values match
          if (resultValue is List) {
            if (!resultValue
                .toSet()
                .containsAll(filterValues.toSet())
                ) {
              return false;
            }
          } else if (!(resultValue == filterValues.first &&
              filterValues.length == 1)) {
            return false;
          }
        } else if (resultValue is List) {
          if (resultValue.toSet().difference(filterValues.toSet()).isNotEmpty) {
            return false;
          }
        } else if (!filterValues.contains(resultValue)) {
          // if there are multiple values, AND will always return nothing, so we use OR
          // For non-list values, perform a direct check
          return false;
        }
      }
      return true;
    }).toList();
    _updateSortingOption(_selectedSortingOption, save: false);
  }

  void _updateSortingOption(String option, {bool save = true}) async {
    final sortingFunction = sortingOptions[option];

    setState(() {
      _selectedSortingOption = option;
      if (option != "Default") {
        _sortedFilteredResults = List.from(_filteredResults);
        _sortedFilteredResults.sort(sortingFunction);
      } else {
        _sortedFilteredResults = List.from(_filteredResults);
      }
    });

    if (save) {
      Future.microtask(() => {
            Settings.setValue<String>(
              'search_${widget.type.name}_sorting',
              option,
            )
          });
    }
  }

  Future<void> onSearch(torbox.TorboxAPI apiService) async {
    if (_searchController.text.isEmpty) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    final response = await (widget.type == SearchTabType.torrent
        ? apiService.searchTorrents(
            _searchController.text,
          )
        : apiService.searchUsenet(
            _searchController.text,
          ));
    setState(() {
      _hasSearched = true;
    });

    if (response.success) {
      setState(() {
        _results =
            (response.data[widget.type.searchResultType] as List<dynamic>)
                .where(
                  (item) => [
                    item["magnet"],
                    item["nzb"],
                    item["hash"],
                    item["torrent"]
                  ].any((link) => link != null),
                )
                .map((item) => SearchResult.fromJson(
                      item,
                    ))
                .toList();
        _applyFilters();
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to search: ${response.detailOrUnknown}'),
        ),
      );
    }
  }

  void _showFilterBottomSheet(
      BuildContext context,
      void Function(Map<String, List<dynamic>>, Set<String>)
          onFiltersChanged) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (context2) {
        return Theme(
          data: Theme.of(context).copyWith(),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _buildFilters(context, setState, onFiltersChanged),
                ),
              );
            },
          ),
        );
      },
    );
  }

  List<Widget> _buildFilters(
      BuildContext context,
      StateSetter setState,
      void Function(
              Map<String, List<dynamic>> filters, Set<String> listItemFilters)
          onFiltersChanged) {
    // we build the filters dynamically based on the parsed names
    if (_results.isEmpty) {
      return [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('No results to filter'),
        ),
      ];
    }
    final List<String> filterBlacklist = ["title", "excess", "size"];
    final filterTypes = _results
        .map((e) => e.titleParsedData.keys)
        .expand((x) => x)
        .toSet()
        .where((x) => !filterBlacklist.contains(x))
        .toList();
    final Map<String, List<dynamic>> filterValues = {};
    filterTypes.forEach((type) {
      filterValues[type] = _results
          .map((e) => e.titleParsedData[type])
          .where((value) => value != null)
          .toSet()
          .toList();
    });
    return filterValues.entries.map((entry) {
      final String type = entry.key;
      final List<dynamic> values = entry.value;
      final Set<Type> valuesTypes = values.map((e) => e.runtimeType).toSet();
      if (const SetEquality().equals(valuesTypes, const {bool})) {
        return CheckboxListTile(
          title: Text(type.fromCamelCase(),
              style: TextStyle(
                  color: (_selectedFilters[type]?.isNotEmpty ?? false)
                      ? Theme.of(context).colorScheme.primary
                      : null)),
          value: _selectedFilters[type]?.isNotEmpty ?? false,
          onChanged: (bool? selected) {
            setState(() {
              if (selected == true) {
                _selectedFilters[type] = [true];
              } else {
                _selectedFilters.remove(type);
              }
              onFiltersChanged(_selectedFilters, _hasListItemFilters);
            });
          },
        );
      } else {
        bool hasListItems = false;
        if (const SetEquality()
            .equals(valuesTypes, const {List<dynamic>, String})) {
          hasListItems = true;
          _hasListItemFilters.add(type);
        }
        return ExpansionTile(
          title: Text(type.fromCamelCase(),
              style: TextStyle(
                  color: (_selectedFilters[type]?.isNotEmpty ?? false)
                      ? Theme.of(context).colorScheme.primary
                      : null)),
          children: [
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: (hasListItems
                      ? values
                          .map((x) => x is Iterable ? x : [x])
                          .expand((x) => x)
                          .toSet()
                      : values)
                  .map((value) {
                return FilterChip(
                  label: Text(value.toString()),
                  selected: _selectedFilters[type]?.contains(value) ?? false,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        if (_selectedFilters[type] == null) {
                          _selectedFilters[type] = [];
                        }
                        _selectedFilters[type]!.add(value);
                      } else {
                        _selectedFilters[type]?.remove(value);
                        if (_selectedFilters[type]?.isEmpty ?? true) {
                          _selectedFilters.remove(type);
                        }
                      }
                    });
                    onFiltersChanged(_selectedFilters, _hasListItemFilters);
                  },
                );
              }).toList(),
            ),
          ],
        );
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final apiService = Provider.of<torbox.TorboxAPI>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Search ${widget.type.pluralName}${_results.isNotEmpty ? ' (${_filteredResults.length != _results.length ? "${_filteredResults.length}/" : ""}${_results.length} results)' : ''}'),
        actions: [
          MenuAnchor(
            builder: (BuildContext context, MenuController controlller,
                Widget? child) {
              return IconButton(
                icon: const Icon(Icons.sort),
                onPressed: () {
                  if (controlller.isOpen) {
                    controlller.close();
                  } else {
                    controlller.open();
                  }
                },
                tooltip: "Sort search results",
              );
            },
            menuChildren: List<MenuItemButton>.generate(
              sortingOptions.length,
              (int index) => MenuItemButton(
                onPressed: () {
                  _updateSortingOption(sortingOptions.keys.elementAt(index));
                  // Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Text(sortingOptions.keys.elementAt(index)),
                    if (_selectedSortingOption ==
                        sortingOptions.keys.elementAt(index))
                      Row(
                        children: [
                          SizedBox(width: 4),
                          Icon(Icons.check,
                              color: Theme.of(context).colorScheme.primary),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFilterBottomSheet(context, (filters, listItemFilters) {
                setState(() {
                  _selectedFilters = filters;
                  _hasListItemFilters = listItemFilters;
                  _applyFilters();
                });
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onSubmitted: (value) => onSearch(apiService),
              decoration: InputDecoration(
                labelText: 'Search for ${widget.type.pluralName.toLowerCase()}',
                suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => onSearch(apiService)),
              ),
            ),
            if (_isLoading)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Center(child: CircularProgressIndicator()),
              )
            else
              (_hasSearched && _results.isNotEmpty)
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: _sortedFilteredResults.length,
                        itemBuilder: (context, index) {
                          final result = _sortedFilteredResults[index];
                          return ListTile(
                            title: Text(result.rawTitle),
                            subtitle: Text(result.searchResultType ==
                                    SearchTabType.torrent
                                ? 'Size: ${result.readableSize} | Seeders: ${result.lastKnownSeeders}'
                                : "${result.readableSize}"),
                            onTap: () async {
                              final response = await (result.searchResultType ==
                                      SearchTabType.torrent
                                  ? apiService.createTorrent(
                                      magnetLink: result.magnetLink ??
                                          "magnet:?xt=urn:btih:${result.hash}&dn=${result.rawTitle}",
                                      torrentName: result.title,
                                    )
                                  : apiService.createUsenetDownload(
                                      link: result.nzbLink,
                                      name: result.title,
                                    ));
                              if (response.success) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        '${result.searchResultType.name} added successfully'),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Failed to add ${result.searchResultType.name.toLowerCase()}: ${response.detailOrUnknown}'),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    )
                  : Center(
                      child: Text(
                        _hasSearched
                            ? 'No results found for "${_searchController.text}"'
                            : '',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}

extension StringExtension on String {
  static const Map<String, String> corrections = {
    "Directors cut": "Director's cut",
    "Fps": "FPS",
    "Hdr": "HDR",
  };
  String capitalise() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }

  String fromCamelCase() {
    final result = this
        .replaceAllMapped(
          RegExp(r'([a-z])([A-Z])'),
          (Match m) => "${m[1]} ${m[2]!.toLowerCase()}",
        )
        .capitalise();
    return corrections[result] ?? result;
  }
}
