
import 'package:atba/utils.dart';

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

class SearchResult {
  final String hash;
  final String rawTitle;
  final String title;
  final Map<String, dynamic> titleParsedData;
  final String? magnetLink;
  final String? torrentLink;
  final int lastKnownSeeders;
  final int lastKnownPeers;
  final int size;
  final bool? cached;
  final String tracker;
  final List<String>? categories;
  final int files;
  final SearchTabType searchResultType;
  final String? nzbLink; 
  final String age; // XXd
  final bool userSearch; // whether it is returned by byoi

  SearchResult({
    required this.hash,
    required this.rawTitle,
    required this.title,
    required this.titleParsedData,
    required this.magnetLink,
    this.torrentLink,
    required this.lastKnownSeeders,
    required this.lastKnownPeers,
    required this.size,
    this.cached,
    required this.tracker,
    required this.categories,
    required this.files,
    required this.searchResultType,
    required this.nzbLink,
    required this.age,
    required this.userSearch,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      hash: json['hash'],
      rawTitle: json['raw_title'],
      title: json['title'],
      titleParsedData: Map<String, dynamic>.from(json['title_parsed_data']),
      magnetLink: json['magnet_link'],
      torrentLink: json['torrent'],
      lastKnownSeeders: json['last_known_seeders'],
      lastKnownPeers: json['last_known_peers'],
      size: int.parse(json['size'] .toString()),
      cached: json['cached'],
      tracker: json['tracker'],
      categories: json['categories'].cast<String>(),
      files: int.parse(json["files"] .toString()),
      searchResultType: SearchTabTypeExtension.fromString(json['type']) ?? SearchTabType.torrent,
      nzbLink: json['nzb'],
      age: json['age'],
      userSearch: json['user_search'],
      
    );
  }

  String get readableSize {
    return getReadableSize(size);
  }

  int get parsedAge {
    // age is of form XXXXd
    if (age.isEmpty) return 0;
    assert(age.endsWith('d'), 'Age must end with "d"');
    final days = int.tryParse(age.substring(0, age.length - 1)) ?? 0;
    return days;
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
/*
0 =
"id" -> 95996
1 =
"created_at" -> "2025-12-07T19:15:06.198752+00:00"
2 =
"updated_at" -> "2025-12-07T19:15:07.711253+00:00"
3 =
"auth_id" -> "be089f0f-63cd-4215-9649-37acf63585b0"
4 =
"hash" -> "7afd51e5458dfd9b8e75ba5f1d640a301803dd1a"
5 =
"type" -> "torrent"
6 =
"integration" -> "google"
7 =
"file_id" -> 0
8 =
"zip" -> false
9 =
"progress" -> 0
10 =
"detail" -> "Failed to request permission from Google Drive. Errored with status code: 401 Please try again."
11 =
"download_url" -> null
12 =
"status" -> "failed"
13 =
"task_id" -> "2b0a19ae-fad1-4117-b506-67b86f784e83"
*/
class JobQueueStatusResponse {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String authId;
  final String hash;
  final String type;
  final String integration;
  final int? fileId;
  final bool zip;
  final num progress;
  final String detail;
  final String? downloadUrl;
  final JobQueueStatus status;
  final String taskId;
  final String? fileName;

  JobQueueStatusResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.authId,
    required this.hash,
    required this.type,
    required this.integration,
    required this.fileId,
    required this.zip,
    required this.progress,
    required this.detail,
    required this.downloadUrl,
    required this.status,
    required this.taskId,
    required this.fileName,
  });

  factory JobQueueStatusResponse.fromJson(Map<String, dynamic> json) {
    return JobQueueStatusResponse(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      authId: json['auth_id'],
      hash: json['hash'],
      type: json['type'],
      integration: json['integration'],
      fileId: json['file_id'],
      zip: json['zip'],
      progress: json['progress'],
      detail: json['detail'],
      downloadUrl: json['download_url'],
      status: JobQueueStatusExtension.fromString(json['status']),
      taskId: json['task_id'],
      fileName: json["file_name"],
    );
  }
}

enum JobQueueStatus { completed, failed, pending, uploading, preparing }

extension JobQueueStatusExtension on JobQueueStatus {
  String get name {
    switch (this) {
      case JobQueueStatus.completed:
        return 'completed';
      case JobQueueStatus.failed:
        return 'failed';
      case JobQueueStatus.pending:
        return 'pending';
      case JobQueueStatus.uploading:
        return 'uploading';
      case JobQueueStatus.preparing:
        return 'preparing';
    }
  }

  static JobQueueStatus fromString(String value) {
    switch (value.toLowerCase()) {
      case 'completed':
        return JobQueueStatus.completed;
      case 'failed':
        return JobQueueStatus.failed;
      case 'pending':
        return JobQueueStatus.pending;
      case 'uploading':
        return JobQueueStatus.uploading;
      case 'preparing':
        return JobQueueStatus.preparing;
      default:
        throw Exception('Unknown JobQueueStatus value: $value');
    }
  }
}