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
  static late TorboxAPI apiService;

  static void initApiService(TorboxAPI apiServicee) {
    apiService = apiServicee;
  }

  Usenet({
    required int id,
    required String name,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int size,
    required bool active,
    required String authId,
    required String downloadState,
    required double progress,
    required int downloadSpeed,
    required int? uploadSpeed,
    required int eta,
    required bool? torrentFile,
    required DateTime? expiresAt,
    required bool downloadPresent,
    required bool downloadFinished,
    required List<DownloadableFile> files,
    required int? inactiveCheck,
    required num? availability,
  }) : super(
          id: id,
          name: name,
          createdAt: createdAt,
          updatedAt: updatedAt,
          size: size,
          active: active,
          authId: authId,
          downloadState: downloadState,
          progress: progress,
          downloadSpeed: downloadSpeed,
          uploadSpeed: uploadSpeed,
          eta: eta,
          torrentFile: torrentFile,
          expiresAt: expiresAt,
          downloadPresent: downloadPresent,
          downloadFinished: downloadFinished,
          files: files,
          inactiveCheck: inactiveCheck,
          availability: availability,
        );

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
      expiresAt: json['expires_at'] != null ? DateTime.parse(json['expires_at']) : null,
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
    return await apiService.controlUsenetDownload(ControlUsenetType.delete, usenetId: id);
  }

  Future<TorboxAPIResponse> download() async {
    final folderPath = Settings.getValue<String>("folder_path");
    if (folderPath == null) {
      throw Exception('Folder path not set');
    }
    final response = await apiService.getUsenetDownloadUrl(id, zipLink: true);
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