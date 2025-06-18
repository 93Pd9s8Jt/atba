import 'dart:convert';

import 'package:atba/models/downloadable_item.dart';
import 'package:atba/models/torbox_api_response.dart';
import 'package:atba/services/torrent_name_parser.dart';
import 'package:either_dart/either.dart';
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

  late List<Usenet> usenetDownloads;
  late List<WebDownload> webDownloads;

  late List<Torrent> activeTorrents;
  late List<QueuedTorrent> queuedTorrents;
  late List<Torrent> inactiveTorrents;

  late List<Torrent> sortedActiveTorrents;
  late List<Torrent> sortedInactiveTorrents;
  late List<QueuedTorrent> sortedQueuedTorrents;

  late List<Torrent> filteredSortedActiveTorrents;
  late List<Torrent> filteredSortedInactiveTorrents;

  final GlobalKey<AnimatedListState> animatedActiveTorrentsListKey =
      GlobalKey<AnimatedListState>(debugLabel: 'activeTorrentsListKey');
  final GlobalKey<AnimatedListState> animatedQueuedTorrentsListKey =
      GlobalKey<AnimatedListState>(debugLabel: 'queuedTorrentsListKey');
  final GlobalKey<AnimatedListState> animatedInactiveTorrentsListKey =
      GlobalKey<AnimatedListState>(debugLabel: 'inactiveTorrentsListKey');

  void addItemToAnimatedList(Torrent torrent) {
    final listItems = torrent.active
        ? filteredSortedActiveTorrents
        : filteredSortedInactiveTorrents;
    listItems.add(torrent);
    sortAndFilterTorrents();
    notifyListeners();
  }

  void removeItemFromAnimatedList(Either<QueuedTorrent, Torrent> torrent) {
    torrent.either(
        (queuedTorrent) => queuedTorrents.remove(queuedTorrent),
        (torrent) => (torrent.active ? activeTorrents : inactiveTorrents)
            .remove(torrent));
    sortAndFilterTorrents();
    notifyListeners();
  }

  late Future<Map<String, dynamic>> _torrentsFuture;
  late Future<Map<String, dynamic>> _webDownloadsFuture;
  late Future<Map<String, dynamic>> _usenetFuture;

  bool isSelecting = false;
  List<SelectableItem> selectedItems = [];
  final BuildContext context;

  DownloadsPageState(this.context) {
    _torrentsFuture = _fetchTorrents(context);
    _webDownloadsFuture = _fetchWebDownloads(context);
    _usenetFuture = _fetchUsenet(context);
  }

  bool get isTorrentNamesCensored => _isTorrentNamesCensored;
  String get selectedSortingOption => _selectedSortingOption;
  List<String> get selectedMainFilters => _selectedMainFilters;
  Future<Map<String, dynamic>> get torrentsFuture => _torrentsFuture;
  Future<Map<String, dynamic>> get webDownloadsFuture => _webDownloadsFuture;
  Future<Map<String, dynamic>> get usenetFuture => _usenetFuture;

  Future<void> refreshTorrents({bool bypassCache = false}) async {
    _torrentsFuture = _fetchTorrents(context);
    await _torrentsFuture;
    notifyListeners();
  }

  Future<void> refreshWebDownloads({bool bypassCache = false}) async {
    _webDownloadsFuture = _fetchWebDownloads(context);
    await _webDownloadsFuture;
    notifyListeners();
  }

  Future<void> refreshUsenet({bool bypassCache = false}) async {
    _usenetFuture = _fetchUsenet(context);
    await _usenetFuture;
    notifyListeners();
  }

  void toggleTorrentNamesCensoring() {
    _isTorrentNamesCensored = !_isTorrentNamesCensored;
    notifyListeners();
  }

  void updateSortingOption(String option) {
    _selectedSortingOption = option;
    sortAndFilterTorrents();
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

  Future<Map<String, dynamic>> _fetchTorrents(BuildContext context) async {
    try {
      final apiService = Provider.of<TorboxAPI>(context, listen: false);
      final responses = await Future.wait(
          [apiService.getTorrentsList(), apiService.getQueuedItemsList()]);

      if (!responses[0].success || !responses[1].success) {
        return {
          "success": false,
          "detail":
              responses.firstWhere((response) => !response.success).detail,
        };
      }

      final postQueuedTorrents = (responses[0].data as List)
          .map((json) => Torrent.fromJson(json))
          .toList();

      queuedTorrents = (responses[1].data as List)
          .map((json) => QueuedTorrent.fromJson(json))
          .toList();

      activeTorrents =
          postQueuedTorrents.where((torrent) => torrent.active).toList();
      inactiveTorrents =
          postQueuedTorrents.where((torrent) => !torrent.active).toList();
      sortAndFilterTorrents();

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

  Future<Map<String, dynamic>> _fetchWebDownloads(BuildContext context) async {
    try {
      final apiService = Provider.of<TorboxAPI>(context, listen: false);
      final response = await apiService.getWebDownloadsList();

      if (!response.success) {
        return {
          "success": false,
          "detail": response.detail,
        };
      }
      webDownloads = (response.data as List)
          .map((json) => WebDownload.fromJson(json))
          .toList();

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

  Future<Map<String, dynamic>> _fetchUsenet(BuildContext context) async {
    try {
      final apiService = Provider.of<TorboxAPI>(context, listen: false);
      final response = await apiService.getUsenetDownloadsList();

      if (!response.success) {
        return {
          "success": false,
          "detail": response.detail,
        };
      }
      usenetDownloads =
          (response.data as List).map((json) => Usenet.fromJson(json)).toList();

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

  void _filterTorrents(List<Torrent> data) {
    Map<String, Function> filtersCopy = Map.from(filters);
    filtersCopy
        .removeWhere((key, value) => !_selectedMainFilters.contains(key));
    data.removeWhere(
        (value) => !filtersCopy.values.every((element) => element(value)));
  }

  void applyFilters(List<Torrent> torrents) {
    _filterTorrents(torrents);
    notifyListeners();
  }

  void startSelection(SelectableItem item) {
    assert(
        item is QueuedTorrent ||
            item is Torrent ||
            item is Usenet ||
            item is WebDownload,
        'Item must be a valid selectable type');
    selectedItems.add(item);
    isSelecting = true;
    notifyListeners();
  }

  void toggleSelection(SelectableItem item) {
    assert(
        item is QueuedTorrent ||
            item is Torrent ||
            item is Usenet ||
            item is WebDownload,
        'Item must be a valid selectable type');
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

  void sortAndFilterTorrents() {
    sortedActiveTorrents = List<Torrent>.from(activeTorrents);
    sortedInactiveTorrents = List<Torrent>.from(inactiveTorrents);
    sortedQueuedTorrents = List<QueuedTorrent>.from(queuedTorrents);
    _sortTorrents(sortedActiveTorrents);
    _sortTorrents(sortedInactiveTorrents);
    _sortQueuedTorrents(sortedQueuedTorrents);
    filteredSortedActiveTorrents = List<Torrent>.from(sortedActiveTorrents);
    filteredSortedInactiveTorrents = List<Torrent>.from(sortedInactiveTorrents);
    _filterTorrents(filteredSortedActiveTorrents);
    _filterTorrents(filteredSortedInactiveTorrents);
  }

  void _sortTorrents(List<Torrent> torrents) {
    final sortingFunction = sortingOptions[_selectedSortingOption];
    if (sortingFunction != null) {
      torrents.sort((a, b) => sortingFunction(a, b) ?? 0);
    }
  }

  void _sortQueuedTorrents(List<QueuedTorrent> torrents) {
    final sortingFunction = queuedSortingOptions[_selectedSortingOption];
    if (sortingFunction != null) {
      torrents.sort((a, b) => sortingFunction(a, b) ?? 0);
    }
  }

  void selectAllTorrents() {
    selectedItems = selectedItems = [
      ...filteredSortedInactiveTorrents
          .map((torrent) => Right<QueuedTorrent, Torrent>(torrent)),
      ...filteredSortedActiveTorrents
          .map((torrent) => Right<QueuedTorrent, Torrent>(torrent)),
      ...sortedQueuedTorrents
          .map((queuedTorrent) => Left<QueuedTorrent, Torrent>(queuedTorrent))
    ];
    notifyListeners();
  }

  void invertSelection() {
    selectedItems = [
      ...filteredSortedInactiveTorrents
          .map((torrent) => Right<QueuedTorrent, Torrent>(torrent)),
      ...filteredSortedActiveTorrents
          .map((torrent) => Right<QueuedTorrent, Torrent>(torrent)),
      ...sortedQueuedTorrents
          .map((queuedTorrent) => Left<QueuedTorrent, Torrent>(queuedTorrent))
    ].where((torrent) => !selectedItems.contains(torrent)).toList();
    notifyListeners();
  }

  Future<void> _handleSelectedItems(
      Future<TorboxAPIResponse>? Function(SelectableItem) action,
      {bool actionIsDelete = false}) async {
    // Iterate over a copy to avoid concurrent modification errors
    for (var item in List<SelectableItem>.from(selectedItems)) {
      assert(
          item is QueuedTorrent ||
              item is Torrent ||
              item is Usenet ||
              item is WebDownload,
          'Item must be a valid selectable type');
      switch (item.runtimeType) {
        case Usenet:
          item = item as Usenet;
          break;
        case WebDownload:
          item = item as WebDownload;
          break;
        case Torrent:
          Torrent torrent = item as Torrent;
          torrent.status = TorrentStatus.loading;
          notifyListeners();
          final response = await action(torrent);
          if (response!.success) {
            torrent.status = TorrentStatus.success;
            if (actionIsDelete) {
              removeItemFromAnimatedList(
                  Right<QueuedTorrent, Torrent>(torrent));
            }
          } else {
            torrent.status = TorrentStatus.error;
            torrent.errorMessage = "${response.detail} (${response.error})";
          }
          break;
        case QueuedTorrent:
          QueuedTorrent queuedTorrent = item as QueuedTorrent;
          queuedTorrent.status = TorrentStatus.loading;
          notifyListeners();
          final response =
              await action(Left<QueuedTorrent, Torrent>(queuedTorrent));
          if (response!.success) {
            queuedTorrent.status = TorrentStatus.success;
            if (actionIsDelete) {
              removeItemFromAnimatedList(
                  Left<QueuedTorrent, Torrent>(queuedTorrent));
            }
          } else {
            queuedTorrent.status = TorrentStatus.error;
            queuedTorrent.errorMessage =
                "${response.detail} (${response.error})";
          }
          break;
        default:
          throw Exception('Invalid selectable type');
      }
      notifyListeners();
      clearSelection();
    }
  }

  Future<void> deleteSelectedItems() async {
    await _handleSelectedItems((item) {
      if (item is Usenet) {
        return (item as Usenet).delete();
      } else if (item is WebDownload) {
        return (item as WebDownload).delete();
      } else if (item is QueuedTorrent) {
        return (item as QueuedTorrent).delete();
      } else if (item is Torrent) {
        return (item as Torrent).delete();
      } else {
        throw Exception('Invalid selectable type');
      }
    }, actionIsDelete: true);
  }

  Future<void> pauseSelectedItems() async {
    await _handleSelectedItems((item) {
      if (item is Torrent) {
        return item.pause();
      } else
        return null;
    });
  }

  Future<void> resumeSelectedItems() async {
    await _handleSelectedItems((item) {
      if (item is Torrent) {
        return item.resume();
      } else if (item is QueuedTorrent) {
        return item.start();
      } else {
        return null;
      }
    });
  }

  Future<void> reannounceSelectedItems() async {
    await _handleSelectedItems((item) {
      if (item is Torrent) {
        return item.reannounce();
      } else {
        return null;
      }
    });
  }

  Future<void> downloadSelectedItems() async {
    await _handleSelectedItems((item) {
      if (item is Torrent) {
        return item.download();
      } else if (item is Usenet) {
        return item.download();
      } else if (item is WebDownload) {
        return item.download();
      } else {
        return null;
      }
    });
  }

  void handleReorder(GlobalKey listKey, Either<Torrent, QueuedTorrent> item, int from, int to, List<Either<Torrent, QueuedTorrent>> newItems) {
    if (listKey == animatedActiveTorrentsListKey) {
        activeTorrents.remove(item.left);
        activeTorrents.insert(to, item.left);
    } else if (listKey == animatedQueuedTorrentsListKey) {
      queuedTorrents.remove(item.right);
      queuedTorrents.insert(to, item.right);
    } else if (listKey == animatedInactiveTorrentsListKey) {
      inactiveTorrents.remove(item.left);
      inactiveTorrents.insert(to, item.left);
    }
    // sortAndFilterTorrents();
    notifyListeners();
  }

  static final Map<String, bool? Function(Torrent)> filters = {
    "Download Ready": (torrent) => torrent.downloadFinished,
    "Uploading": (torrent) => (torrent.uploadSpeed ?? 0) > 0 && torrent.active,
    "Downloading": (torrent) =>
        (torrent.downloadSpeed ?? 0) > 0 && torrent.active,
    "Cached": (torrent) => torrent.cached,
  };

  static String handleTorrentName(String name) {
    if (Settings.getValue<bool>('key-use-torrent-name-parsing',
        defaultValue: false)!) {
      PTN ptn = PTN();
      return ptn.parse(name)['title'];
    } else {
      return name;
    }
  }

  static Map<String, int? Function(Torrent, Torrent)> sortingOptions = {
    "Default": (a, b) => null,
    "A to Z": (a, b) => (handleTorrentName(a.name))
        .toLowerCase()
        .compareTo(handleTorrentName(b.name).toLowerCase()),
    "Z to A": (a, b) => -(handleTorrentName(a.name))
        .toLowerCase()
        .compareTo(handleTorrentName(b.name).toLowerCase()),
    "Largest": (a, b) => -a.size.compareTo(b.size),
    "Smallest": (a, b) => a.size.compareTo(b.size),
    "Oldest": (a, b) => a.createdAt.compareTo(b.createdAt),
    "Newest": (a, b) => -a.createdAt.compareTo(b.createdAt),
    "Recently updated": (a, b) => a.updatedAt.compareTo(b.updatedAt)
  };

  static Map<String, int? Function(QueuedTorrent, QueuedTorrent)>
      queuedSortingOptions = {
    "Default": (a, b) => null,
    "A to Z": (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
    "Z to A": (a, b) => -a.name.toLowerCase().compareTo(b.name.toLowerCase()),
    "Oldest": (a, b) => a.createdAt.compareTo(b.createdAt),
    "Newest": (a, b) => -a.createdAt.compareTo(b.createdAt),
  };
}
