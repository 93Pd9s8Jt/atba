/*
       {
            "id": 0,
            "hash": "XXXXXXXXXXXXXXXXXXXXXXXXXX",
            "created_at": "2023-12-22T22:12:34.78989+00:00",
            "updated_at": "2023-12-22T16:12:41.552423+00:00",
            "size": 0,
            "active": true,
            "auth_id": "XXXXXXXXXXXXXXXXXXXXXXXXX",
            "download_state": "downloading",
            "progress": 1,
            "download_speed": 0,
            "upload_speed": 0,
            "name": "WebDownloadName",
            "eta": 8640000,
            "server": 0,
            "torrent_file": false,
            "expires_at": "2024-01-05T22:13:10.135864+00:00",
            "download_present": true,
            "download_finished": true,
            "error": "Some error.",
            "files": [
                {
                    "id": 0,
                    "md5": "XXXXXXXXXXXXXXXXXXXXXXXXX",
                    "s3_path": "/hash/webdownload_name/filename.ext",
                    "name": "WebDownloadFolder/WebDownloadName",
                    "size": 0,
                    "mimetype": "application/zip",
                    "short_name": "filename.ext"
                }
            ],
            "inactive_check": 0,
            "availability": 0
        }
*/

import 'package:atba/models/torbox_api_response.dart';
import 'package:atba/services/torbox_service.dart';
import 'package:background_downloader/background_downloader.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:atba/config/constants.dart';
import 'downloadable_item.dart';
import 'package:json_annotation/json_annotation.dart';
part 'webdownload.g.dart';

enum WebDownloadState { downloading, finished, error, unknown }

@JsonSerializable()
class WebDownload extends DownloadableItem {
  final WebDownloadState state;
  final String error;

  WebDownload({
    required super.id,
    required super.name,
    required super.createdAt,
    required super.updatedAt,
    required super.size,
    required super.active,
    required super.authId,
    required super.downloadState,
    required super.progress,
    required super.downloadSpeed,
    required super.uploadSpeed,
    required super.eta,
    required super.torrentFile,
    required DateTime super.expiresAt,
    required super.downloadPresent,
    required super.downloadFinished,
    required super.files,
    required super.inactiveCheck,
    required super.availability,
    required this.state,
    required this.error,
  });

  factory WebDownload.fromJson(Map<String, dynamic> json) {
    return WebDownload(
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
      expiresAt: DateTime.parse(json['expires_at']),
      downloadPresent: json['download_present'],
      downloadFinished: json['download_finished'],
      files: (json['files'] as List)
          .map((file) => DownloadableFile.fromJson(file))
          .toList(),
      inactiveCheck: json['inactive_check'],
      availability: json['availability'],
      state: WebDownloadState.values.firstWhere(
        (e) => e.toString() == 'WebDownloadState.${json['download_state']}',
        orElse: () => WebDownloadState.unknown,
      ),
      error: json['error'] ?? '',
    );
  }

  factory WebDownload.fromJsonGenerated(Map<String, dynamic> json) =>
      _$WebDownloadFromJson(json);
  @override
  Map<String, dynamic> toJsonGenerated() => _$WebDownloadToJson(this);

  @override
  Future<TorboxAPIResponse> delete() async {
    return await DownloadableItem.apiService.controlWebDownload(
      ControlWebdlType.delete,
      webId: id,
    );
  }

  @override
  Future<TorboxAPIResponse> download() async {
    final folderPath = Settings.getValue<String>(Constants.folderPath);
    if (folderPath == null) {
      throw Exception('Folder path not set');
    }
    final response = await DownloadableItem.apiService.getWebDownloadUrl(
      id,
      zipLink: true,
    );
    await FileDownloader().enqueue(
      DownloadTask(
        url: response.data as String,
        directory: folderPath,
        filename: "$name.zip",
        allowPause: true
      ),
    );
    return response;
  }

  @override
  Future<TorboxAPIResponse> downloadFile(DownloadableFile file) async {
    final folderPath = Settings.getValue<String>(Constants.folderPath);
    if (folderPath == null) {
      throw Exception('Folder path not set');
    }
    final response = await DownloadableItem.apiService.getWebDownloadUrl(
      id,
      fileId: file.id,
    );
    if (!response.success) {
      return response;
    }
    await FileDownloader().enqueue(
      DownloadTask(
        url: response.data as String,
        directory: folderPath,
        filename: file.name.split('/').last,
        allowPause: true
      ),
    );
    return response;
  }
}
