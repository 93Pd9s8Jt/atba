// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_download_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WebDownloadData _$WebDownloadDataFromJson(Map<String, dynamic> json) =>
    _WebDownloadData(
      id: (json['id'] as num).toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      authId: json['auth_id'] as String?,
      name: json['name'] as String?,
      hash: json['hash'] as String?,
      downloadState: json['download_state'] as String?,
      downloadSpeed: (json['download_speed'] as num?)?.toInt(),
      originalUrl: json['original_url'] as String?,
      eta: (json['eta'] as num?)?.toInt(),
      progress: (json['progress'] as num?)?.toDouble(),
      size: (json['size'] as num?)?.toInt(),
      downloadId: json['download_id'] as String?,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => DownloadFileData.fromJson(e as Map<String, dynamic>))
          .toList(),
      active: json['active'] as bool?,
      cached: json['cached'] as bool?,
      downloadPresent: json['download_present'] as bool?,
      downloadFinished: json['download_finished'] as bool?,
      expiresAt: json['expires_at'] as String?,
      error: json['error'] as String?,
      cachedAt: json['cached_at'] as String?,
      server: (json['server'] as num?)?.toInt(),
      alternativeHashes: (json['alternative_hashes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      airlocked: json['airlocked'] as bool?,
    );

Map<String, dynamic> _$WebDownloadDataToJson(_WebDownloadData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'auth_id': instance.authId,
      'name': instance.name,
      'hash': instance.hash,
      'download_state': instance.downloadState,
      'download_speed': instance.downloadSpeed,
      'original_url': instance.originalUrl,
      'eta': instance.eta,
      'progress': instance.progress,
      'size': instance.size,
      'download_id': instance.downloadId,
      'files': instance.files?.map((e) => e.toJson()).toList(),
      'active': instance.active,
      'cached': instance.cached,
      'download_present': instance.downloadPresent,
      'download_finished': instance.downloadFinished,
      'expires_at': instance.expiresAt,
      'error': instance.error,
      'cached_at': instance.cachedAt,
      'server': instance.server,
      'alternative_hashes': instance.alternativeHashes,
      'tags': instance.tags,
      'airlocked': instance.airlocked,
    };
