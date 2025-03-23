import 'dart:convert';

import 'package:atba/services/torrent_name_parser.dart';
import 'package:flutter/material.dart';
import 'package:atba/models/torrent.dart';
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

  void removeItemFromAnimatedList(Torrent torrent) {
    final listItems = torrent.active
        ? activeTorrents
        : inactiveTorrents;
    listItems.remove(torrent);
    sortAndFilterTorrents();
    notifyListeners();
  }

  late Future<Map<String, dynamic>> _torrentsFuture;

  bool isSelecting = false;
  List<Torrent> selectedTorrents = [];
  final BuildContext context;

  DownloadsPageState(this.context) {
    _torrentsFuture = _fetchTorrents(context);
  }

  bool get isTorrentNamesCensored => _isTorrentNamesCensored;
  String get selectedSortingOption => _selectedSortingOption;
  List<String> get selectedMainFilters => _selectedMainFilters;
  Future<Map<String, dynamic>> get torrentsFuture => _torrentsFuture;

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

  void startSelection(Torrent torrent) {
    isSelecting = true;
    selectedTorrents.add(torrent);
    notifyListeners();
  }

  void toggleSelection(Torrent torrent) {
    if (selectedTorrents.contains(torrent)) {
      selectedTorrents.remove(torrent);
      if (selectedTorrents.isEmpty) {
        isSelecting = false;
      }
    } else {
      selectedTorrents.add(torrent);
    }
    notifyListeners();
  }

  void clearSelection() {
    isSelecting = false;
    selectedTorrents.clear();
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
    selectedTorrents =
        filteredSortedInactiveTorrents + filteredSortedActiveTorrents;
    notifyListeners();
  }

  void invertSelection() {
    selectedTorrents = [
      ...filteredSortedInactiveTorrents,
      ...filteredSortedActiveTorrents
    ].where((torrent) => !selectedTorrents.contains(torrent)).toList();
    notifyListeners();
  }

  Future<void> deleteSelectedTorrents() async {
    for (var torrent in selectedTorrents) {
      torrent.status = TorrentStatus.loading;
      notifyListeners();
      final response = await torrent.delete();
      if (response.success) {
        torrent.status = TorrentStatus.success;
        removeItemFromAnimatedList(torrent);
      } else {
        torrent.status = TorrentStatus.error;
        torrent.errorMessage = "${response.detail} (${response.error})";
      }
      notifyListeners();
    }
    // _torrentsFuture = _fetchTorrents(context);
    clearSelection();
  }

  Future<void> pauseSelectedTorrents() async {
    for (var torrent in selectedTorrents) {
      torrent.status = TorrentStatus.loading;
      notifyListeners();
      final response = await torrent.pause();
      if (response.success) {
        torrent.status = TorrentStatus.success;
      } else {
        torrent.status = TorrentStatus.error;
        torrent.errorMessage = "${response.detail} (${response.error})";
      }
      notifyListeners();
    }
    _torrentsFuture = _fetchTorrents(context);
    clearSelection();
  }

  Future<void> resumeSelectedTorrents() async {
    for (var torrent in selectedTorrents) {
      torrent.status = TorrentStatus.loading;
      notifyListeners();
      final response = await torrent.resume();
      if (response.success) {
        torrent.status = TorrentStatus.success;
      } else {
        torrent.status = TorrentStatus.error;
        torrent.errorMessage = "${response.detail} (${response.error})";
      }
      notifyListeners();
    }
    _torrentsFuture = _fetchTorrents(context);
    clearSelection();
  }

  Future<void> reannounceSelectedTorrents() async {
    for (var torrent in selectedTorrents) {
      torrent.status = TorrentStatus.loading;
      notifyListeners();
      final response = await torrent.reannounce();
      if (response.success) {
        torrent.status = TorrentStatus.success;
      } else {
        torrent.status = TorrentStatus.error;
        torrent.errorMessage = "${response.detail} (${response.error})";
      }
      notifyListeners();
    }
    _torrentsFuture = _fetchTorrents(context);
    clearSelection();
  }

  Future<void> downloadSelectedTorrents() async {
    for (var torrent in selectedTorrents) {
      torrent.status = TorrentStatus.loading;
      notifyListeners();
      final response = await torrent.download();
      if (response.success) {
        torrent.status = TorrentStatus.success;
      } else {
        torrent.status = TorrentStatus.error;
        torrent.errorMessage = "${response.detail} (${response.error})";
      }
      notifyListeners();
    }
    _torrentsFuture = _fetchTorrents(context);
    clearSelection();
  }

  static final Map<String, bool? Function(Torrent)> filters = {
    "Download Ready": (torrent) => torrent.downloadFinished,
    "Uploading": (torrent) => torrent.uploadSpeed > 0 && torrent.active,
    "Downloading": (torrent) => torrent.downloadSpeed > 0 && torrent.active,
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
    "Largest": (a, b) => a.size.compareTo(b.size),
    "Smallest": (a, b) => -a.size.compareTo(b.size),
    "Oldest": (a, b) => a.createdAt.compareTo(b.createdAt),
    "Newest": (a, b) => -a.createdAt.compareTo(b.createdAt),
    "Recently updated": (a, b) => a.updatedAt.compareTo(b.updatedAt)
  };

  static Map<String, int? Function(QueuedTorrent, QueuedTorrent)> queuedSortingOptions = {
    "Default": (a, b) => null,
    "A to Z": (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
    "Z to A": (a, b) => -a.name.toLowerCase().compareTo(b.name.toLowerCase()),
    "Oldest": (a, b) => a.createdAt.compareTo(b.createdAt),
    "Newest": (a, b) => -a.createdAt.compareTo(b.createdAt),
  };
}
