// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_code_start_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceCodeStartData _$DeviceCodeStartDataFromJson(Map<String, dynamic> json) =>
    _DeviceCodeStartData(
      deviceCode: json['device_code'] as String,
      interval: (json['interval'] as num).toInt(),
      expiresAt: json['expires_at'] as String,
      verificationUrl: json['verification_url'] as String,
      friendlyVerificationUrl: json['friendly_verification_url'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$DeviceCodeStartDataToJson(
  _DeviceCodeStartData instance,
) => <String, dynamic>{
  'device_code': instance.deviceCode,
  'interval': instance.interval,
  'expires_at': instance.expiresAt,
  'verification_url': instance.verificationUrl,
  'friendly_verification_url': instance.friendlyVerificationUrl,
  'code': instance.code,
};
