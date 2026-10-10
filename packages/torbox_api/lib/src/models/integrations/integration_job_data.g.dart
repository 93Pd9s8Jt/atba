// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integration_job_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IntegrationJobData _$IntegrationJobDataFromJson(Map<String, dynamic> json) =>
    _IntegrationJobData(
      id: (json['id'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      authId: json['auth_id'] as String,
      hash: json['hash'] as String,
      type: json['type'] as String,
      integration: json['integration'] as String,
      fileId: (json['file_id'] as num?)?.toInt(),
      zip: json['zip'] as bool,
      progress: (json['progress'] as num).toDouble(),
      detail: json['detail'] as String,
      downloadUrl: json['download_url'] as String?,
      status: json['status'] as String,
      fileName: json['file_name'] as String,
      taskId: json['task_id'] as String?,
      jobId: json['job_id'] as String?,
    );

Map<String, dynamic> _$IntegrationJobDataToJson(_IntegrationJobData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'auth_id': instance.authId,
      'hash': instance.hash,
      'type': instance.type,
      'integration': instance.integration,
      'file_id': instance.fileId,
      'zip': instance.zip,
      'progress': instance.progress,
      'detail': instance.detail,
      'download_url': instance.downloadUrl,
      'status': instance.status,
      'file_name': instance.fileName,
      'task_id': instance.taskId,
      'job_id': instance.jobId,
    };
