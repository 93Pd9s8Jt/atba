import 'package:atba/services/torbox_service.dart';
import 'package:atba/models/torbox_api_response.dart';
import 'package:background_downloader/background_downloader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:atba/config/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'downloadable_item.dart';
import 'package:json_annotation/json_annotation.dart';
part 'torrent.g.dart';

/*
Sample data:
           "id": 0,
            "hash": "XXXXXXXXXXXXXXXXXXXXXXXXXX",
            "created_at": "2023-12-22T22:12:34.78989+00:00",
            "updated_at": "2023-12-22T16:12:41.552423+00:00",
            "magnet": "XXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            "size": 0,
            "active": true,
            "auth_id": "XXXXXXXXXXXXXXXXXXXXXXXXX",
            "download_state": "downloading",
            "seeds": 0,
            "peers": 0,
            "ratio": 0,
            "progress": 1,
            "download_speed": 0,
            "upload_speed": 0,
            "name": "TorrentName",
            "eta": 8640000,
            "server": 0,
            "torrent_file": false,
            "expires_at": "2024-01-05T22:13:10.135864+00:00",
            "download_present": true,
            "download_finished": true,
            "files": [
                {
                    "id": 0,
                    "md5": "XXXXXXXXXXXXXXXXXXXXXXXXX",
                    "s3_path": "/hash/torrent_name/filename.ext",
                    "name": "TorrentFolder/TorrentName",
                    "size": 0,
                    "mimetype": "application/zip",
                    "short_name": "filename.ext"
                }
            ],
            "inactive_check": 0,
            "availability": 0
        }
*/

enum TorrentStatus { idle, loading, success, error }

@JsonSerializable()
class Torrent extends DownloadableItem {
  final String hash;
  final String? magnet;
  final int seeds;
  final int peers;
  final double ratio;
  final String? downloadPath;
  final String? tracker;
  final int totalUploaded;
  final int totalDownloaded;
  final bool cached;
  final String owner;
  final bool seedTorrent;
  final bool allowZipped;
  final bool longTermSeeding;
  final String? trackerMessage;
  TorrentStatus status = TorrentStatus.idle;
  @override
  DownloadableItemStatus? itemStatus;
  @override
  @override
  String? errorMessage;

  Torrent({
    required super.id,
    required super.name,
    required super.createdAt,
    required super.updatedAt,
    required super.size,
    required super.active,
    required super.authId,
    required super.downloadState,
    required super.progress,
    required int super.downloadSpeed,
    required int super.uploadSpeed,
    required super.eta,
    required bool super.torrentFile,
    required super.expiresAt,
    required super.downloadPresent,
    required super.downloadFinished,
    required super.files,
    required super.inactiveCheck,
    required super.availability,
    required this.hash,
    required this.magnet,
    required this.seeds,
    required this.peers,
    required this.ratio,
    required this.downloadPath,
    required this.tracker,
    required this.totalUploaded,
    required this.totalDownloaded,
    required this.cached,
    required this.owner,
    required this.seedTorrent,
    required this.allowZipped,
    required this.longTermSeeding,
    required this.trackerMessage,
  });

  factory Torrent.fromJson(Map<String, dynamic> json) {
    return Torrent(
      id: json['id'] as int,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      size: json['size'] as int,
      active: json['active'] as bool,
      authId: json['auth_id'] as String,
      downloadState: json['download_state'] as String,
      progress: (json['progress'] as num).toDouble(),
      downloadSpeed: json['download_speed'] as int,
      uploadSpeed: json['upload_speed'] as int,
      eta: json['eta'] as int,
      torrentFile: json['torrent_file'] as bool,
      expiresAt: json['expires_at'] != null
          ? DateTime.parse(json['expires_at'] as String)
          : null,
      downloadPresent: json['download_present'] as bool,
      downloadFinished: json['download_finished'] as bool,
      files:
          (json['files'] as List?)
              ?.map(
                (fileJson) =>
                    DownloadableFile.fromJson(fileJson as Map<String, dynamic>),
              )
              .toList() ??
          [],
      inactiveCheck: json['inactive_check'] as int?,
      availability: json['availability'] as num?,
      hash: json['hash'] as String,
      magnet: json['magnet'] as String?,
      seeds: json['seeds'] as int,
      peers: json['peers'] as int,
      ratio: (json['ratio'] as num).toDouble(),
      downloadPath: json['download_path'] as String?,
      tracker: json['tracker'] as String?,
      totalUploaded: json['total_uploaded'] as int,
      totalDownloaded: json['total_downloaded'] as int,
      cached: json['cached'] as bool,
      owner: json['owner'] as String,
      seedTorrent: json['seed_torrent'] as bool,
      allowZipped: json['allow_zipped'] as bool,
      longTermSeeding: json['long_term_seeding'] as bool,
      trackerMessage: json['tracker_message'] as String?,
    );
  }

  factory Torrent.fromJsonGenerated(Map<String, dynamic> json) =>
      _$TorrentFromJson(json);

  @override
  Map<String, dynamic> toJsonGenerated() => _$TorrentToJson(this);

  @override
  Future<TorboxAPIResponse> delete() async {
    status = TorrentStatus.loading;
    final response = await DownloadableItem.apiService.controlTorrent(
      torrentId: id,
      ControlTorrentType.delete,
    );
    if (response.success) {
      status = TorrentStatus.success;
    } else {
      status = TorrentStatus.error;
      errorMessage = response.detail;
    }
    return response;
  }

  @override
  Future<TorboxAPIResponse> reannounce() async {
    status = TorrentStatus.loading;
    final response = await DownloadableItem.apiService.controlTorrent(
      torrentId: id,
      ControlTorrentType.reannounce,
    );
    if (response.success) {
      status = TorrentStatus.success;
    } else {
      status = TorrentStatus.error;
      errorMessage = response.detail;
    }
    return response;
  }

  @override
  Future<TorboxAPIResponse> stop() async {
    status = TorrentStatus.loading;
    final response = await DownloadableItem.apiService.controlTorrent(
      torrentId: id,
      ControlTorrentType.stop,
    );
    if (response.success) {
      status = TorrentStatus.success;
    } else {
      status = TorrentStatus.error;
      errorMessage = response.detail;
    }
    return response;
  }

  @override
  Future<TorboxAPIResponse> resume() async {
    status = TorrentStatus.loading;
    final response = await DownloadableItem.apiService.controlTorrent(
      torrentId: id,
      ControlTorrentType.resume,
    );
    if (response.success) {
      status = TorrentStatus.success;
    } else {
      status = TorrentStatus.error;
      errorMessage = response.detail;
    }
    return response;
  }

  Future<TorboxAPIResponse> exportAsMagnet() async {
    final response = await DownloadableItem.apiService.exportTorrentData(
      id,
      ExportTorrentDataType.magnet,
    );
    return response;
  }

  Future<TorboxAPIResponse> exportAsTorrent() async {
    final response = await DownloadableItem.apiService.exportTorrentData(
      id,
      ExportTorrentDataType.torrentFile,
    );
    return response; // data has path to file
  }

  @override
  Future<TorboxAPIResponse> download() async {
    final response = await DownloadableItem.apiService.getTorrentDownloadUrl(
      id,
      zipLink: true,
    );

    if (!response.success) {
      return response; // Return early if the response is not successful
    }

    if (kIsWeb) {
      launchUrl(Uri.parse(response.data as String));
      return response;
    }

    final folderPath = Settings.getValue<String>(Constants.folderPath);
    if (folderPath == null) {
      throw Exception('Folder path not set');
    }

    await FileDownloader().enqueue(
      DownloadTask(
        url: response.data as String,
        baseDirectory: BaseDirectory.root,
        directory: folderPath,
        filename: "$name.zip",
        allowPause: true,
      ),
    );
    return response;
  }

  @override
  Future<TorboxAPIResponse> downloadFile(DownloadableFile file) async {
    final response = await DownloadableItem.apiService.getTorrentDownloadUrl(
      id,
      fileId: file.id,
    );
    if (!response.success) {
      return response;
    }

    if (kIsWeb) {
      launchUrl(Uri.parse(response.data as String));
      return response;
    }

    final folderPath = Settings.getValue<String>(Constants.folderPath);
    if (folderPath == null) {
      throw Exception('Folder path not set');
    }

    await FileDownloader().enqueue(
      DownloadTask(
        url: response.data as String,
        directory: folderPath,
        baseDirectory: BaseDirectory.root,
        filename: file.name.split('/').last,
        allowPause: true,
      ),
    );
    return response;
  }
}

@JsonSerializable()
class QueuedTorrent extends DownloadableItem {
  // Technically not downloadable though
  final String? magnet;
  final String? torrentFileLink;
  final String hash;
  final String? type;
  TorrentStatus status = TorrentStatus.idle;
  @override
  DownloadableItemStatus? itemStatus;
  @override
  @override
  String? errorMessage;

  QueuedTorrent({
    required super.id,
    required super.name,
    required super.createdAt,
    this.magnet,
    this.torrentFileLink,
    required this.hash,
    this.type,
  }) : super(
         updatedAt: createdAt,
         size: 0,
         active: false,
         authId: '',
         downloadState: '',
         progress: 0,
         downloadSpeed: 0,
         uploadSpeed: 0,
         eta: 0,
         torrentFile: null,
         expiresAt: null,
         downloadPresent: false,
         downloadFinished: false,
         files: [],
         inactiveCheck: null,
         availability: null,
       );

  factory QueuedTorrent.fromJson(Map<String, dynamic> json) {
    return QueuedTorrent(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      magnet: json['magnet'] as String?,
      torrentFileLink: json['torrent_file'] as String?,
      hash: json['hash'] as String,
      name: json['name'] as String,
      type: json['type'] as String?,
    );
  }

  factory QueuedTorrent.fromJsonStub(Map<String, dynamic> json) {
    // e.g. when created
    return QueuedTorrent(
      id: json['queued_id'] as int,
      hash: json['hash'] as String,
      name: json['name'] as String,
      createdAt: DateTime.now(),
    );
  }

  factory QueuedTorrent.fromJsonGenerated(Map<String, dynamic> json) =>
      _$QueuedTorrentFromJson(json);
  @override
  Map<String, dynamic> toJsonGenerated() => _$QueuedTorrentToJson(this);

  @override
  Future<TorboxAPIResponse> delete() async {
    status = TorrentStatus.loading;
    final response = await DownloadableItem.apiService.controlQueuedItem(
      QueuedItemOperation.delete,
      queuedId: id,
    );
    if (response.success) {
      status = TorrentStatus.success;
    } else {
      status = TorrentStatus.error;
      errorMessage = response.detail;
    }
    return response;
  }

  @override
  Future<TorboxAPIResponse> resume() async {
    status = TorrentStatus.loading;
    final response = await DownloadableItem.apiService.controlQueuedItem(
      QueuedItemOperation.start,
      queuedId: id,
    );
    if (response.success) {
      status = TorrentStatus.success;
    } else {
      status = TorrentStatus.error;
      errorMessage = response.detail;
    }
    return response;
  }
}

class TorrentFile {
  final int id;
  final String? md5;
  final String hash;
  final String absolutePath;
  final String s3Path;
  final String name;
  final int size;
  final String mimetype;
  final String shortName;

  TorrentFile({
    required this.id,
    required this.md5,
    required this.s3Path,
    required this.name,
    required this.size,
    required this.mimetype,
    required this.shortName,
    required this.absolutePath,
    required this.hash,
  });

  factory TorrentFile.fromJson(Map<String, dynamic> json) {
    return TorrentFile(
      id: json['id'] as int,
      md5: json['md5'] as String?,
      s3Path: json['s3_path'] as String,
      hash: json['hash'] as String,
      name: json['name'] as String,
      size: json['size'] as int,
      mimetype: json['mimetype'] as String,
      shortName: json['short_name'] as String,
      absolutePath: json['absolute_path'] as String,
    );
  }
}
