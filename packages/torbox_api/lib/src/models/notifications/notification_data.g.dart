// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) =>
    _NotificationData(
      id: (json['id'] as num).toInt(),
      createdAt: json['created_at'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      authId: json['auth_id'] as String,
    );

Map<String, dynamic> _$NotificationDataToJson(_NotificationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'title': instance.title,
      'message': instance.message,
      'auth_id': instance.authId,
    };
