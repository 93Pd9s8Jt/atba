// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webdownload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebDownload _$WebDownloadFromJson(Map<String, dynamic> json) =>
    WebDownload(
        id: (json['id'] as num).toInt(),
        name: json['name'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        size: (json['size'] as num).toInt(),
        active: json['active'] as bool,
        authId: json['authId'] as String,
        downloadState: json['downloadState'] as String,
        progress: (json['progress'] as num).toDouble(),
        downloadSpeed: (json['downloadSpeed'] as num?)?.toInt(),
        uploadSpeed: (json['uploadSpeed'] as num?)?.toInt(),
        eta: (json['eta'] as num).toInt(),
        torrentFile: json['torrentFile'] as bool?,
        expiresAt: json['expiresAt'] == null
            ? null
            : DateTime.parse(json['expiresAt'] as String),
        downloadPresent: json['downloadPresent'] as bool,
        downloadFinished: json['downloadFinished'] as bool,
        files: (json['files'] as List<dynamic>)
            .map((e) => DownloadableFile.fromJson(e as Map<String, dynamic>))
            .toList(),
        inactiveCheck: (json['inactiveCheck'] as num?)?.toInt(),
        availability: json['availability'] as num?,
        state: $enumDecode(_$WebDownloadStateEnumMap, json['state']),
        error: json['error'] as String,
      )
      ..itemStatus = $enumDecodeNullable(
        _$DownloadableItemStatusEnumMap,
        json['itemStatus'],
      )
      ..errorMessage = json['errorMessage'] as String?;

Map<String, dynamic> _$WebDownloadToJson(WebDownload instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'size': instance.size,
      'active': instance.active,
      'authId': instance.authId,
      'downloadState': instance.downloadState,
      'progress': instance.progress,
      'downloadSpeed': instance.downloadSpeed,
      'uploadSpeed': instance.uploadSpeed,
      'eta': instance.eta,
      'torrentFile': instance.torrentFile,
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'downloadPresent': instance.downloadPresent,
      'downloadFinished': instance.downloadFinished,
      'files': instance.files,
      'inactiveCheck': instance.inactiveCheck,
      'availability': instance.availability,
      'itemStatus': _$DownloadableItemStatusEnumMap[instance.itemStatus],
      'errorMessage': instance.errorMessage,
      'state': _$WebDownloadStateEnumMap[instance.state]!,
      'error': instance.error,
    };

const _$WebDownloadStateEnumMap = {
  WebDownloadState.downloading: 'downloading',
  WebDownloadState.finished: 'finished',
  WebDownloadState.error: 'error',
  WebDownloadState.unknown: 'unknown',
};

const _$DownloadableItemStatusEnumMap = {
  DownloadableItemStatus.idle: 'idle',
  DownloadableItemStatus.loading: 'loading',
  DownloadableItemStatus.success: 'success',
  DownloadableItemStatus.error: 'error',
};
