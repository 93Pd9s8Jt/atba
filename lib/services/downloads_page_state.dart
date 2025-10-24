import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:collection/collection.dart';

import 'package:atba/models/downloadable_item.dart';
import 'package:atba/models/torbox_api_response.dart';
import 'package:atba/services/torrent_name_parser.dart';
import 'package:flutter/material.dart';
import 'package:atba/models/torrent.dart';
import 'package:atba/models/webdownload.dart';
import 'package:atba/models/usenet.dart';
import 'package:atba/services/torbox_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class DownloadsPageState extends ChangeNotifier {
  bool _isTorrentNamesCensored = false;
  String _selectedSortingOption = Settings.getValue<String>(
      "key-selected-sorting-option",
      defaultValue: "Default")!;
  final List<String> _selectedMainFilters = List<String>.from(jsonDecode(
      Settings.getValue<String>("key-selected-main-filters",
          defaultValue: "[]")!)); // probably code be improved

  final List<DownloadableItem> _downloads = [];

  late Future<Map<String, dynamic>> _torrentsFuture;
  late Future<Map<String, dynamic>> _webDownloadsFuture;
  late Future<Map<String, dynamic>> _usenetFuture;

  bool isSelecting = false;
  bool isSearching = false;
  String _searchQuery = "";
  final TextEditingController searchController = TextEditingController();
  List<DownloadableItem> selectedItems = [];
  final BuildContext context;
  final GlobalKey<RefreshIndicatorState> torrentRefreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final GlobalKey<RefreshIndicatorState> webRefreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final GlobalKey<RefreshIndicatorState> usenetRefreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  late final apiService;

  // init
  DownloadsPageState(this.context) {
    apiService = Provider.of<TorboxAPI>(context, listen: false);
    apiService.setDownloadsPageState(this);
    _torrentsFuture = _fetchTorrents(context);
    _webDownloadsFuture = _fetchWebDownloads(context);
    _usenetFuture = _fetchUsenet(context);
    searchController.addListener(() {
      setSearchQuery(searchController.text);
    });
  }

  // Optionally, add this if you ever dispose DownloadsPageState manually:
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  bool get isTorrentNamesCensored => _isTorrentNamesCensored;
  String get selectedSortingOption => _selectedSortingOption;
  List<String> get selectedMainFilters => _selectedMainFilters;
  Future<Map<String, dynamic>> get torrentsFuture => _torrentsFuture;
  Future<Map<String, dynamic>> get webDownloadsFuture => _webDownloadsFuture;
  Future<Map<String, dynamic>> get usenetFuture => _usenetFuture;

  List<T> _getDownloads<T extends DownloadableItem>() =>
      _downloads.whereType<T>().toList();

  List<Torrent> get activeTorrents =>
      _getDownloads<Torrent>().where((torrent) => torrent.active).toList();
  List<Torrent> get inactiveTorrents =>
      _getDownloads<Torrent>().where((torrent) => !torrent.active).toList();
  List<QueuedTorrent> get queuedTorrents => _getDownloads<QueuedTorrent>();
  List<WebDownload> get webDownloads => _getDownloads<WebDownload>();
  List<Usenet> get usenetDownloads => _getDownloads<Usenet>();

  static bool _areQueuedTorrents(dynamic a, dynamic b) {
    return a is QueuedTorrent && b is QueuedTorrent;
  }

  static Map<String, int? Function(DownloadableItem, DownloadableItem)>
      sortingOptions = {
    "Default": (a, b) => null,
    "A to Z": (a, b) => (handleTorrentName(a.name))
        .toLowerCase()
        .compareTo(handleTorrentName(b.name).toLowerCase()),
    "Z to A": (a, b) => -(handleTorrentName(a.name))
        .toLowerCase()
        .compareTo(handleTorrentName(b.name).toLowerCase()),
    "Largest": (a, b) =>
        _areQueuedTorrents(a, b) ? null : -a.size.compareTo(b.size),
    "Smallest": (a, b) =>
        _areQueuedTorrents(a, b) ? null : a.size.compareTo(b.size),
    "Oldest": (a, b) => a.createdAt.compareTo(b.createdAt),
    "Newest": (a, b) => -a.createdAt.compareTo(b.createdAt),
    "Recently updated": (a, b) =>
        _areQueuedTorrents(a, b) ? null : a.updatedAt.compareTo(b.updatedAt)
  };

  static final Map<String, bool? Function(DownloadableItem)> filters = {
    "Download Ready": (torrent) => torrent.downloadFinished,
    "Uploading": (torrent) => (torrent.uploadSpeed ?? 0) > 0 && torrent.active,
    "Downloading": (torrent) =>
        (torrent.downloadSpeed ?? 0) > 0 && torrent.active,
    "Cached": (torrent) => torrent is Torrent ? torrent.cached : null,
  };

  List<T> _sortAndFilter<T extends DownloadableItem>(List<T> items) {
    if (items.isEmpty) {
      return [];
    }
    var sortedList = List<T>.from(items);
    final sortingFunction = sortingOptions[_selectedSortingOption];
    if (sortingFunction != null) {
      sortedList.sort((a, b) => sortingFunction(a, b) ?? 0);
    }
    if (_selectedMainFilters.isEmpty && _searchQuery.isEmpty) {
      return sortedList;
    }

    return sortedList.where((item) {
      return _selectedMainFilters.every((filterName) {
            final filter = filters[filterName];
            return filter != null ? filter(item) ?? true : true;
          }) &&
          (_searchQuery.isEmpty ||
              handleTorrentName(item.name)
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()));
    }).toList();
  }

  List<Torrent> get filteredSortedActiveTorrents =>
      _sortAndFilter(activeTorrents);
  List<Torrent> get filteredSortedInactiveTorrents =>
      _sortAndFilter(inactiveTorrents);
  List<QueuedTorrent> get filteredSortedQueuedTorrents =>
      _sortAndFilter(queuedTorrents);
  List<WebDownload> get filteredSortedWebDownloads =>
      _sortAndFilter(webDownloads);
  List<Usenet> get filteredSortedUsenetDownloads =>
      _sortAndFilter(usenetDownloads);

  Future<void> refreshTorrents({bool bypassCache = false}) async {
    _torrentsFuture = _fetchTorrents(context, bypassCache: bypassCache);
    await _torrentsFuture;
    notifyListeners();
  }

  Future<void> refreshWebDownloads({bool bypassCache = false}) async {
    _webDownloadsFuture = _fetchWebDownloads(context, bypassCache: bypassCache);
    await _webDownloadsFuture;
    notifyListeners();
  }

  Future<void> refreshUsenet({bool bypassCache = false}) async {
    _usenetFuture = _fetchUsenet(context, bypassCache: bypassCache);
    await _usenetFuture;
    notifyListeners();
  }

  void toggleTorrentNamesCensoring() {
    _isTorrentNamesCensored = !_isTorrentNamesCensored;
    notifyListeners();
  }

  void updateSortingOption(String option) {
    _selectedSortingOption = option;
    notifyListeners();
    Future.microtask(() async {
      await Settings.setValue<String>(
          "key-selected-sorting-option", _selectedSortingOption);
    });
  }

  void updateFilter(String filter, bool selected) {
    if (selected) {
      _selectedMainFilters.add(filter);
    } else {
      _selectedMainFilters.remove(filter);
    }
    notifyListeners();
    Future.microtask(() async {
      await Settings.setValue<String>(
          "key-selected-main-filters", jsonEncode(_selectedMainFilters));
    });
  }

  void startPeriodicUpdate(int id, DownloadableItemType type) {
    return; //dsiable periodic updates for now
    void updateTimer() async {
      print(id.toString());
      bool runTimerAgain = true;
      late final Duration age;
      late final response;
      switch (type) {
        case DownloadableItemType.torrent:
          response = await apiService.getTorrentsList(
              torrentId: id, bypassCache: true);
          if (!response.success || response.data == null) {
            return;
          }
          final updatedTorrent = Torrent.fromJson(response.data);
          age = DateTime.now().difference(updatedTorrent.updatedAt);
          final index = _downloads.indexWhere((item) => item is Torrent && item.id == id);
          if (index != -1) {
            _downloads[index] = updatedTorrent;
            print("Updated torrent info for: ${updatedTorrent.name}");
          } else {
            _downloads.add(updatedTorrent);
          }
          if (updatedTorrent.progress >= 1 || !updatedTorrent.active) {
            runTimerAgain = false;
          }
          break;
        case DownloadableItemType.webdl:
          response = await apiService.getWebDownloadsList(
              downloadId: id, bypassCache: true);
          if (!response.success || response.data == null) {
            return;
          }
          final updatedWebDownload = WebDownload.fromJson(response.data);
          age = DateTime.now().difference(updatedWebDownload.updatedAt);
          final index = _downloads.indexWhere((item) => item is WebDownload && item.id == id);
          if (index != -1) {
            _downloads[index] = updatedWebDownload;
            
          } else {
            _downloads.add(updatedWebDownload);
          }
          if (updatedWebDownload.progress >= 1 || !updatedWebDownload.active) {
            runTimerAgain = false;
          }
          break;
        case DownloadableItemType.usenet:
          response = await apiService.getUsenetDownloadsList(
              downloadId: id, bypassCache: true);
          if (!response.success || response.data == null) {
            return;
          }
          final updatedUsenet = Usenet.fromJson(response.data);
          age = DateTime.now().difference(updatedUsenet.updatedAt);
          final index = _downloads.indexWhere((item) => item is Usenet && item.id == id);
          if (index != -1) {
            _downloads[index] = updatedUsenet;
          } else {
            _downloads.add(updatedUsenet);
          }
          if (updatedUsenet.progress >= 1 || !updatedUsenet.active) {
            runTimerAgain = false;
          }
          break;
      }
      if (runTimerAgain) {
        
        final int seconds = max(1, (log(max(5, age.inSeconds)) / log(1.2)).floor());
        Timer(Duration(seconds: seconds), updateTimer);
      }
    }
    Timer(const Duration(seconds: 10), updateTimer);
  }



  void toggleSearch() {
    isSearching = !isSearching;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  Future<Map<String, dynamic>> _fetchTorrents(BuildContext context,
      {bool bypassCache = false}) async {
    try {
      final apiService = Provider.of<TorboxAPI>(context, listen: false);
      final responses = await Future.wait([
        apiService.getTorrentsList(bypassCache: bypassCache),
        apiService.getQueuedItemsList(bypassCache: bypassCache)
      ]);

      if (!responses[0].success || !responses[1].success) {
        return {
          "success": false,
          "detail":
              responses.firstWhere((response) => !response.success).detail,
        };
      }

      final List<Torrent> postQueuedTorrents = (responses[0].data as List)
          .map((json) => Torrent.fromJson(json))
          .toList();
      postQueuedTorrents.where((torrent) => torrent.progress < 1 && torrent.active).forEach((torrent) {
        startPeriodicUpdate(torrent.id, DownloadableItemType.torrent);
      });

      final List<QueuedTorrent> queuedTorrents = (responses[1].data as List)
          .map((json) => QueuedTorrent.fromJson(json))
          .toList();
      _downloads
          .removeWhere((item) => item is Torrent || item is QueuedTorrent);
      _downloads.addAll([
        ...postQueuedTorrents,
        ...queuedTorrents,
      ]);

      return {"success": true};
    } catch (e, stackTrace) {
      debugPrint('Error in _fetchTorrents: $e');
      debugPrint('Stack trace: $stackTrace');
      return {
        "success": false,
        "detail": e.toString(),
        "stackTrace": stackTrace
      };
    }
  }

  Future<Map<String, dynamic>> _fetchWebDownloads(BuildContext context,
      {bool bypassCache = false}) async {
    try {
      final apiService = Provider.of<TorboxAPI>(context, listen: false);
      final response =
          await apiService.getWebDownloadsList(bypassCache: bypassCache);

      if (!response.success) {
        return {
          "success": false,
          "detail": response.detail,
        };
      }
      final List<WebDownload> webDownloads = (response.data as List)
          .map((json) => WebDownload.fromJson(json))
          .toList();
      webDownloads
          .where((webdl) => webdl.progress < 1 && webdl.active)
          .forEach((webdl) {
        startPeriodicUpdate(webdl.id, DownloadableItemType.webdl);
      });
      _downloads.removeWhere((item) => item is WebDownload);
      _downloads.addAll(webDownloads);

      return {"success": true};
    } catch (e, stackTrace) {
      debugPrint('Error in _fetchWebDownloads: $e');
      debugPrint('Stack trace: $stackTrace');
      return {
        "success": false,
        "detail": e.toString(),
        "stackTrace": stackTrace
      };
    }
  }

  Future<Map<String, dynamic>> _fetchUsenet(BuildContext context,
      {bool bypassCache = false}) async {
    try {
      final apiService = Provider.of<TorboxAPI>(context, listen: false);
      final response =
          await apiService.getUsenetDownloadsList(bypassCache: bypassCache);

      if (!response.success) {
        return {
          "success": false,
          "detail": response.detail,
        };
      }
      final List<Usenet> usenetDownloads =
          (response.data as List).map((json) => Usenet.fromJson(json)).toList();
      usenetDownloads
          .where((usenet) => usenet.progress < 1 && usenet.active)
          .forEach((usenet) {
        startPeriodicUpdate(usenet.id, DownloadableItemType.usenet);
      });
      _downloads.removeWhere((item) => item is Usenet);
      _downloads.addAll(usenetDownloads);

      return {"success": true};
    } catch (e, stackTrace) {
      debugPrint('Error in _fetchUsenet: $e');
      debugPrint('Stack trace: $stackTrace');
      return {
        "success": false,
        "detail": e.toString(),
        "stackTrace": stackTrace
      };
    }
  }

  void startSelection(DownloadableItem item) {
    selectedItems.add(item);
    isSelecting = true;
    notifyListeners();
  }

  void toggleSelection(DownloadableItem item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
      if (selectedItems.isEmpty) {
        isSelecting = false;
      }
    } else {
      selectedItems.add(item);
    }
    notifyListeners();
  }

  void clearSelection() {
    isSelecting = false;
    selectedItems.clear();
    notifyListeners();
  }

  // make sure only visible items are selected
  void selectAllItems() {
    // If only one type of item is selected, select all items of that type
    // unless all items of that type are selected, then select all items
    // types are inactive, active, queued, usenet, web download

    // first, check if only one type of item is selected
    final selectedTypes = selectedItems.map((item) {
      if (item is Torrent) {
        return item.active ? 'active' : 'inactive';
      } else if (item is QueuedTorrent) {
        return 'queued';
      } else if (item is Usenet) {
        return 'usenet';
      } else if (item is WebDownload) {
        return 'web';
      } else {
        throw Exception('Invalid selectable type');
      }
    }).toSet();

    if (selectedTypes.length == 1) {
      final type = selectedTypes.first;
      late final List<DownloadableItem> newSelectedItems;
      switch (type) {
        case 'active':
          newSelectedItems =
              List<DownloadableItem>.from(filteredSortedActiveTorrents);
          break;
        case 'inactive':
          newSelectedItems =
              List<DownloadableItem>.from(filteredSortedInactiveTorrents);
          break;
        case 'queued':
          newSelectedItems =
              List<DownloadableItem>.from(filteredSortedQueuedTorrents);
          break;
        case 'usenet':
          newSelectedItems =
              List<DownloadableItem>.from(filteredSortedUsenetDownloads);
          break;
        case 'web':
          newSelectedItems =
              List<DownloadableItem>.from(filteredSortedWebDownloads);
          break;
      }
      if (ListEquality().equals(newSelectedItems, selectedItems)) {
        // If all items of that type are already selected, select all items
        selectedItems = [
          ...filteredSortedInactiveTorrents,
          ...filteredSortedActiveTorrents,
          ...filteredSortedQueuedTorrents,
          ...filteredSortedUsenetDownloads,
          ...filteredSortedWebDownloads,
        ];
      } else {
        // Otherwise, select all items of that type
        selectedItems = List<DownloadableItem>.from(newSelectedItems);
      }
    } else {
      // If multiple types are selected, select all items of all types
      selectedItems = [
        ...filteredSortedInactiveTorrents,
        ...filteredSortedActiveTorrents,
        ...filteredSortedQueuedTorrents,
        ...filteredSortedUsenetDownloads,
        ...filteredSortedWebDownloads,
      ];
    }
    notifyListeners();
  }

  void invertSelection() {
    // see above function - if constrained to just one set
    final selectedTypes = selectedItems.map((item) {
      if (item is Torrent) {
        return item.active ? 'active' : 'inactive';
      } else if (item is QueuedTorrent) {
        return 'queued';
      } else if (item is Usenet) {
        return 'usenet';
      } else if (item is WebDownload) {
        return 'web';
      } else {
        throw Exception('Invalid selectable type');
      }
    }).toSet();
    if (selectedTypes.length == 1) {
      final type = selectedTypes.first;
      switch (type) {
        case 'active':
          selectedItems = filteredSortedActiveTorrents
              .where((item) => !selectedItems.contains(item))
              .toList();
          break;
        case 'inactive':
          selectedItems = filteredSortedInactiveTorrents
              .where((item) => !selectedItems.contains(item))
              .toList();
          break;
        case 'queued':
          selectedItems = filteredSortedQueuedTorrents
              .where((item) => !selectedItems.contains(item))
              .toList();
          break;
        case 'usenet':
          selectedItems = filteredSortedUsenetDownloads
              .where((item) => !selectedItems.contains(item))
              .toList();
          break;
        case 'web':
          selectedItems = filteredSortedWebDownloads
              .where((item) => !selectedItems.contains(item))
              .toList();
          break;
      }
    } else {
      // If multiple types are selected, invert selection across all items
      final allItems = [
        ...filteredSortedInactiveTorrents,
        ...filteredSortedActiveTorrents,
        ...filteredSortedQueuedTorrents,
        ...filteredSortedUsenetDownloads,
        ...filteredSortedWebDownloads,
      ];
      selectedItems =
          allItems.where((item) => !selectedItems.contains(item)).toList();
    }
    notifyListeners();
  }

  Future<void> _handleSelectedItems(
      Future<TorboxAPIResponse?>? Function(DownloadableItem) action,
      {bool actionIsDelete = false}) async {
    // Iterate over a copy to avoid concurrent modification errors
    for (var item in List<DownloadableItem>.from(selectedItems)) {
      item.itemStatus = DownloadableItemStatus.loading;
      notifyListeners();
      final response = await action(item);
      if (response != null) {
        if (response.success) {
          item.itemStatus = DownloadableItemStatus.success;
          if (actionIsDelete) {
            _downloads.remove(item);
          }
        } else {
          item.itemStatus = DownloadableItemStatus.error;
          item.errorMessage = "${response.detail} (${response.error})";
        }
      } else {
        item.itemStatus = DownloadableItemStatus.idle;
      }

      notifyListeners();
    }
    clearSelection();
  }

  Future<void> deleteSelectedItems() async {
    await _handleSelectedItems((item) => item.delete(), actionIsDelete: true);
  }

  Future<void> pauseSelectedItems() async {
    await _handleSelectedItems((item) => item.pause());
  }

  Future<void> resumeSelectedItems() async {
    await _handleSelectedItems((item) => item.resume());
  }

  Future<void> reannounceSelectedItems() async {
    await _handleSelectedItems((item) => item.reannounce());
  }

  Future<void> downloadSelectedItems() async {
    await _handleSelectedItems((item) => item.download());
  }

  static String handleTorrentName(String name) {
    if (Settings.getValue<bool>('key-use-torrent-name-parsing',
        defaultValue: false)!) {
      PTN ptn = PTN();
      return ptn.parse(name)['title'];
    } else {
      return name;
    }
  }
}

enum DownloadableItemType { torrent, webdl, usenet }
