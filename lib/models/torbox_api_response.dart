import 'package:atba/models/torrent.dart';

class TorboxAPIResponse {
  final bool success;
  final String? error;
  final String? detail;
  final dynamic data;

  TorboxAPIResponse({
    required this.success,
    this.error,
    required this.detail,
    this.data,
  });

  factory TorboxAPIResponse.fromJson(Map<String, dynamic> json) {
    return TorboxAPIResponse(
      success: json['success'],
      error: json['error'],
      detail: json['detail'],
      data: json['data'],
    );
  }

  String get detailOrUnknown =>
      detail != null && detail!.isNotEmpty ? detail! : 'Unknown error.';
}

class TorrentSearchResult {
  final String hash;
  final String rawTitle;
  final String title;
  final Map<String, dynamic> titleParsedData;
  final String? magnetLink;
  final String? torrentLink;
  final int lastKnownSeeders;
  final int lastKnownPeers;
  final int size;
  final String tracker;
  final List<String>? categories;
  final int files;
  final SearchTabType searchResultType;
  final String? nzbLink; 
  final String age; // XXd
  final bool userSearch; // whether it is returned by byoi

  TorrentSearchResult({
    required this.hash,
    required this.rawTitle,
    required this.title,
    required this.titleParsedData,
    required this.magnetLink,
    this.torrentLink,
    required this.lastKnownSeeders,
    required this.lastKnownPeers,
    required this.size,
    required this.tracker,
    required this.categories,
    required this.files,
    required this.searchResultType,
    required this.nzbLink,
    required this.age,
    required this.userSearch,
  });

  factory TorrentSearchResult.fromJson(Map<String, dynamic> json) {
    return TorrentSearchResult(
      hash: json['hash'],
      rawTitle: json['raw_title'],
      title: json['title'],
      titleParsedData: Map<String, dynamic>.from(json['title_parsed_data']),
      magnetLink: json['magnet_link'],
      torrentLink: json['torrent'],
      lastKnownSeeders: json['last_known_seeders'],
      lastKnownPeers: json['last_known_peers'],
      size: int.parse(json['size'] .toString()),
      tracker: json['tracker'],
      categories: json['categories'].cast<String>(),
      files: int.parse(json["files"] .toString()),
      searchResultType: SearchTabTypeExtension.fromString(json['type']) ?? SearchTabType.torrent,
      nzbLink: json['nzb'],
      age: json['age'],
      userSearch: json['user_search'],
    );
  }

  get readableSize {
    return getReadableSize(size);
  }
}

enum SearchTabType { torrent, usenet }

extension SearchTabTypeExtension on SearchTabType {
  String get pluralName {
    switch (this) {
      case SearchTabType.torrent:
        return 'Torrents';
      case SearchTabType.usenet:
        return 'Usenet';
    }
  }

  String get searchResultType {
    switch (this) {
      case SearchTabType.torrent:
        return 'torrents';
      case SearchTabType.usenet:
        return 'nzbs';
    }
  }

  String get name {
    switch (this) {
      case SearchTabType.torrent:
        return 'Torrent';
      case SearchTabType.usenet:
        return 'Usenet';
    }
  }

  static SearchTabType? fromString(String? value) {
    if (value == null) return null;
    switch (value.toLowerCase()) {
      case 'torrent':
        return SearchTabType.torrent;
      case 'usenet':
        return SearchTabType.usenet;
      default:
        return null;
    }
  }
}
