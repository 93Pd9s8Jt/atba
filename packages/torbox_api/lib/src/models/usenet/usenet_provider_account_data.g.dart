// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usenet_provider_account_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsenetProviderAccountData _$UsenetProviderAccountDataFromJson(
  Map<String, dynamic> json,
) => _UsenetProviderAccountData(
  host: json['host'] as String,
  port: (json['port'] as num).toInt(),
  ssl: json['ssl'] as bool,
  connections: (json['connections'] as num).toInt(),
  username: json['username'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$UsenetProviderAccountDataToJson(
  _UsenetProviderAccountData instance,
) => <String, dynamic>{
  'host': instance.host,
  'port': instance.port,
  'ssl': instance.ssl,
  'connections': instance.connections,
  'username': instance.username,
  'password': instance.password,
};
