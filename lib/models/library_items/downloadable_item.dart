import 'package:atba/config/constants.dart';
import 'package:atba/models/library_items/library_item.dart';
import 'package:atba/models/torbox_api_response.dart';
import 'package:background_downloader/background_downloader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';
part 'downloadable_item.g.dart';

abstract class DownloadableItem extends LibraryItem {
  final List<DownloadableFile> files;

  DownloadableItem({
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
    required super.expiresAt,
    required super.downloadPresent,
    required super.downloadFinished,
    required this.files,
    required super.inactiveCheck,
    required super.availability,
    super.itemStatus,
    super.errorMessage,
  });

  @mustBeOverridden
  Future<TorboxAPIResponse> getZippedDownloadUrlById(int id);

  @mustBeOverridden
  Future<TorboxAPIResponse> getDownloadUrlByFileId(int id, int fileId);

  @nonVirtual
  Future<TorboxAPIResponse> download() async {
    final response = await getZippedDownloadUrlById(id);

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

  @nonVirtual
  Future<TorboxAPIResponse> downloadFile(DownloadableFile file) async {
    final response = await getDownloadUrlByFileId(id, file.id);
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

  @override
  Map<String, dynamic> toJsonGenerated();
}

@JsonSerializable()
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
      s3Path:
          json['s3Path'] ?? json['s3_path'], // apparently api can use both ??
      name: json['name'],
      size: json['size'],
      mimetype: json['mimetype'],
      shortName: json['shortName'] ?? json['short_name'], // ditto
    );
  }
  factory DownloadableFile.fromJsonGenerated(Map<String, dynamic> json) =>
      _$DownloadableFileFromJson(json);

  Map<String, dynamic> toJson() => _$DownloadableFileToJson(this);
}

enum DownloadableItemStatus { idle, loading, success, error }
