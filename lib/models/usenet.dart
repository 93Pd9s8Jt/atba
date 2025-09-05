import 'package:atba/models/torbox_api_response.dart';
import 'package:atba/services/torbox_service.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'downloadable_item.dart';

enum UsenetPostProcessing {
  none,
  defaultProcessing,
  repair,
  repairAndUnpack,
  repairAndUnpackAndDelete
}

class Usenet extends DownloadableItem {
  Usenet({
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
    required super.uploadSpeed,
    required super.eta,
    required super.torrentFile,
    required super.expiresAt,
    required super.downloadPresent,
    required super.downloadFinished,
    required super.files,
    required super.inactiveCheck,
    required super.availability,
  });

  factory Usenet.fromJson(Map<String, dynamic> json) {
    return Usenet(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      size: json['size'],
      active: json['active'],
      authId: json['auth_id'],
      downloadState: json['download_state'],
      progress: json['progress'].toDouble(),
      downloadSpeed: json['download_speed'],
      uploadSpeed: json['upload_speed'],
      eta: json['eta'],
      torrentFile: json['torrent_file'],
      expiresAt: json['expires_at'] != null
          ? DateTime.parse(json['expires_at'])
          : null,
      downloadPresent: json['download_present'],
      downloadFinished: json['download_finished'],
      files: (json['files'] as List)
          .map((file) => DownloadableFile.fromJson(file))
          .toList(),
      inactiveCheck: json['inactive_check'],
      availability: json['availability'],
    );
  }

  @override
  Future<TorboxAPIResponse> delete() async {
    return await DownloadableItem.apiService
        .controlUsenetDownload(ControlUsenetType.delete, usenetId: id);
  }

  @override
  Future<TorboxAPIResponse> download() async {
    final folderPath = Settings.getValue<String>("folder_path");
    if (folderPath == null) {
      throw Exception('Folder path not set');
    }
    final response = await DownloadableItem.apiService
        .getUsenetDownloadUrl(id, zipLink: true);
    await FlutterDownloader.enqueue(
      url: response.data as String,
      savedDir: folderPath,
      fileName: "$name.zip",
      showNotification: true,
      openFileFromNotification: true,
    );
    return response;
  }

  @override
  Future<TorboxAPIResponse> downloadFile(DownloadableFile file) async {
    final folderPath = Settings.getValue<String>("folder_path");
    if (folderPath == null) {
      throw Exception('Folder path not set');
    }
    final response = await DownloadableItem.apiService
        .getUsenetDownloadUrl(id, fileId: file.id);
    if (!response.success) {
      return response;
    }
    await FlutterDownloader.enqueue(
      url: response.data as String,
      savedDir: folderPath,
      fileName: file.name,
      showNotification: true,
      openFileFromNotification: true,
    );
    return response;
  }
}
