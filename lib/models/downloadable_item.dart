import 'package:atba/models/torbox_api_response.dart';
import 'package:atba/services/torbox_service.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

abstract class DownloadableItem {
  static late TorboxAPI apiService;

  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int size;
  final bool active;
  final String authId;
  final String downloadState;
  final double progress;
  final int? downloadSpeed;
  final int? uploadSpeed;
  final int eta;
  final bool? torrentFile;
  final DateTime? expiresAt;
  final bool downloadPresent;
  final bool downloadFinished;
  final List<DownloadableFile> files;
  final int? inactiveCheck;
  final num? availability;
  // not part of the API response, but used in the UI
  DownloadableItemStatus? itemStatus;
  String? errorMessage;


  DownloadableItem({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.size,
    required this.active,
    required this.authId,
    required this.downloadState,
    required this.progress,
    required this.downloadSpeed,
    required this.uploadSpeed,
    required this.eta,
    required this.torrentFile,
    required this.expiresAt,
    required this.downloadPresent,
    required this.downloadFinished,
    required this.files,
    required this.inactiveCheck,
    required this.availability,
    this.itemStatus,
    this.errorMessage,
  });

  static void initApiService(TorboxAPI apiServicee) {
    apiService = apiServicee;
  }

  Future<TorboxAPIResponse> delete();
  Future<TorboxAPIResponse?> pause() async => null;
  Future<TorboxAPIResponse?> resume() async => null;
  Future<TorboxAPIResponse?> start() async => null;
  Future<TorboxAPIResponse?> reannounce() async => null;

  Future<TorboxAPIResponse> download() async {
    final folderPath = Settings.getValue<String>("folder_path");
    if (folderPath == null) {
      throw Exception('Folder path not set');
    }
    final response = await apiService.getWebDownloadUrl(id, zipLink: true);
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

class DownloadableFile {
  final int id;
  final String? md5;
  final String s3Path;
  final String name;
  final int size;
  final String mimetype;
  final String shortName;

  DownloadableFile({
    required this.id,
    required this.md5,
    required this.s3Path,
    required this.name,
    required this.size,
    required this.mimetype,
    required this.shortName,
  });

  factory DownloadableFile.fromJson(Map<String, dynamic> json) {
    return DownloadableFile(
      id: json['id'],
      md5: json['md5'],
      s3Path: json['s3_path'],
      name: json['name'],
      size: json['size'],
      mimetype: json['mimetype'],
      shortName: json['short_name'],
    );
  }
}

/// Union type for selectable items in the UI.
/// Add more types as needed.
typedef SelectableItem = Object /* DownloadableItem | QueuedTorrent */;

enum DownloadableItemStatus {
  idle, loading, success, error
}
