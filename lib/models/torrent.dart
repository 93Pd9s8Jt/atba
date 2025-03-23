import 'package:atba/services/torbox_service.dart';
import 'package:atba/models/torbox_api_response.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

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

String getReadableSize(int size) {
  if (size < 1024) {
    return '$size B';
  } else if (size < 1024 * 1024) {
    return '${(size / 1024).toStringAsPrecision(3)} KB';
  } else if (size < 1024 * 1024 * 1024) {
    return '${(size / (1024 * 1024)).toStringAsPrecision(3)} MB';
  } else {
    return '${(size / (1024 * 1024 * 1024)).toStringAsPrecision(3)} GB';
  }
}

enum TorrentStatus { idle, loading, success, error }

class Torrent {
  static late TorboxAPI apiService;

  static void initApiService(TorboxAPI apiServicee) {
    apiService = apiServicee;
  }

  final int id;
  final String hash;
  final String? magnet;
  final int size;
  final bool active;
  final String authId;
  final String downloadState;
  final int seeds;
  final int peers;
  final double ratio;
  final double progress;
  final int downloadSpeed;
  final int uploadSpeed;
  final String name;
  final int eta;
  final int server;
  final bool torrentFile;
  final DateTime? expiresAt;
  final bool downloadPresent;
  final bool downloadFinished;
  final List<TorrentFile>? files;
  final int inactiveCheck;
  final num availability;
  final DateTime createdAt;
  final DateTime updatedAt;
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
  String? errorMessage;

  Torrent({
    required this.id,
    required this.hash,
    required this.magnet,
    required this.size,
    required this.active,
    required this.authId,
    required this.downloadState,
    required this.seeds,
    required this.peers,
    required this.ratio,
    required this.progress,
    required this.downloadSpeed,
    required this.uploadSpeed,
    required this.name,
    required this.eta,
    required this.server,
    required this.torrentFile,
    required this.expiresAt,
    required this.downloadPresent,
    required this.downloadFinished,
    required this.files,
    required this.inactiveCheck,
    required this.availability,
    required this.createdAt,
    required this.updatedAt,
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
      hash: json['hash'] as String,
      magnet: json['magnet'] as String?,
      size: json['size'] as int,
      active: json['active'] as bool,
      authId: json['auth_id'] as String,
      downloadState: json['download_state'] as String,
      seeds: json['seeds'] as int,
      peers: json['peers'] as int,
      ratio: (json['ratio'] as num).toDouble(),
      progress: (json['progress'] as num).toDouble(),
      downloadSpeed: json['download_speed'] as int,
      uploadSpeed: json['upload_speed'] as int,
      name: json['name'] as String,
      eta: json['eta'] as int,
      server: json['server'] as int,
      torrentFile: json['torrent_file'] as bool,
      expiresAt: json["expires_at"] == null ? null : DateTime.parse(json['expires_at']),
      downloadPresent: json['download_present'] as bool,
      downloadFinished: json['download_finished'] as bool,
      files: (json['files'] as List?)
          ?.map((fileJson) => TorrentFile.fromJson(fileJson as Map<String, dynamic>))
          .toList(),
      inactiveCheck: json['inactive_check'] as int,
      availability: json['availability'] as num,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
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



  // methods to interact with api

  Future<TorboxAPIResponse> delete() async {
    status = TorrentStatus.loading;
    final response = await apiService.controlTorrent(torrentId: id, ControlTorrentType.delete);
    if (response.success) {
      status = TorrentStatus.success;
    } else {
      status = TorrentStatus.error;
      errorMessage = response.detail;
    }
    return response;
  }

  Future<TorboxAPIResponse> reannounce() async {
    status = TorrentStatus.loading;
    final response = await apiService.controlTorrent(torrentId: id, ControlTorrentType.reannounce);
    if (response.success) {
      status = TorrentStatus.success;
    } else {
      status = TorrentStatus.error;
      errorMessage = response.detail;
    }
    return response;
  }
  Future<TorboxAPIResponse> pause() async {
    status = TorrentStatus.loading;
    final response = await apiService.controlTorrent(torrentId: id, ControlTorrentType.pause);
    if (response.success) {
      status = TorrentStatus.success;
    } else {
      status = TorrentStatus.error;
      errorMessage = response.detail;
    }
    return response;
  }


  Future<TorboxAPIResponse> resume() async {
    status = TorrentStatus.loading;
    final response = await apiService.controlTorrent(torrentId: id, ControlTorrentType.resume);
    if (response.success) {
      status = TorrentStatus.success;
    } else {
      status = TorrentStatus.error;
      errorMessage = response.detail;
    }
    return response;
  }

  Future<TorboxAPIResponse> exportAsMagnet() async {
    final response = await apiService.exportTorrentData(id, ExportTorrentDataType.magnet);
    return response;
  }

  Future<TorboxAPIResponse> exportAsTorrent() async {
    final response = await apiService.exportTorrentData(id, ExportTorrentDataType.torrentFile);
    return response; // data has path to file
  }

  Future<TorboxAPIResponse> download() async {
    final folderPath = Settings.getValue<String>("folder_path");
    if (folderPath == null) {
      throw Exception('Folder path not set');
    }
    final response = await apiService.getTorrentDownloadUrl(id, zipLink: true);
    await FlutterDownloader.enqueue(
      url: response.data as String,
      savedDir: folderPath,
      fileName: "$name.zip",
      showNotification: true,
      openFileFromNotification: true,
    );
    return response;
    
  }


}

class QueuedTorrent {
  final int id;
  final DateTime createdAt;
  final String magnet;
  final String? torrentFile;
  final String hash;
  final String name;
  final String type;

  QueuedTorrent({
    required this.id,
    required this.createdAt,
    required this.magnet,
    required this.torrentFile,
    required this.hash,
    required this.name,
    required this.type,
  });

  factory QueuedTorrent.fromJson(Map<String, dynamic> json) {
    return QueuedTorrent(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      magnet: json['magnet'] as String,
      torrentFile: json['torrent_file'] as String?,
      hash: json['hash'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
    );
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
