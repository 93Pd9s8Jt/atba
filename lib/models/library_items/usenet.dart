import 'package:atba/models/library_items/library_item.dart';
import 'package:atba/models/library_items/downloadable_item.dart';
import 'package:atba/models/torbox_api_response.dart';
import 'package:atba/services/torbox_service.dart';
import 'package:json_annotation/json_annotation.dart';
part 'usenet.g.dart';

enum UsenetPostProcessing {
  none,
  defaultProcessing,
  repair,
  repairAndUnpack,
  repairAndUnpackAndDelete,
}

@JsonSerializable()
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

  factory Usenet.fromJsonGenerated(Map<String, dynamic> json) =>
      _$UsenetFromJson(json);
  @override
  Map<String, dynamic> toJsonGenerated() => _$UsenetToJson(this);

  @override
  Future<TorboxAPIResponse> delete() async {
    return await LibraryItem.apiService.controlUsenetDownload(
      ControlUsenetType.delete,
      usenetId: id,
    );
  }

  @override
  Future<TorboxAPIResponse> getZippedDownloadUrlById(int id) {
    return LibraryItem.apiService.getUsenetDownloadUrl(id, zipLink: true);
  }

  @override
  Future<TorboxAPIResponse> getDownloadUrlByFileId(int id, int fileId) {
    return LibraryItem.apiService.getUsenetDownloadUrl(id, fileId: fileId);
  }
}
