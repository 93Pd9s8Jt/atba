// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_token_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceTokenData _$DeviceTokenDataFromJson(Map<String, dynamic> json) =>
    _DeviceTokenData(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
    );

Map<String, dynamic> _$DeviceTokenDataToJson(_DeviceTokenData instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
    };
