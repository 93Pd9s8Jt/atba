// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usenet_provider_connection_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsenetProviderConnectionData _$UsenetProviderConnectionDataFromJson(
  Map<String, dynamic> json,
) => _UsenetProviderConnectionData(
  host: json['host'] as String,
  port: (json['port'] as num).toInt(),
  ssl: json['ssl'] as bool,
  username: json['username'] as String,
  password: json['password'] as String,
  connections: (json['connections'] as num).toInt(),
  retention: (json['retention'] as num).toInt(),
  limitations: json['limitations'] as String,
);

Map<String, dynamic> _$UsenetProviderConnectionDataToJson(
  _UsenetProviderConnectionData instance,
) => <String, dynamic>{
  'host': instance.host,
  'port': instance.port,
  'ssl': instance.ssl,
  'username': instance.username,
  'password': instance.password,
  'connections': instance.connections,
  'retention': instance.retention,
  'limitations': instance.limitations,
};
