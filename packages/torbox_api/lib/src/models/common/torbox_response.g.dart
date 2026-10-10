// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torbox_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TorBoxResponse<T> _$TorBoxResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _TorBoxResponse<T>(
  success: json['success'] as bool,
  error: const TorBoxErrorCodeConverter().fromJson(json['error']),
  detail: json['detail'] as String?,
  data: _$nullableGenericFromJson(json['data'], fromJsonT),
);

Map<String, dynamic> _$TorBoxResponseToJson<T>(
  _TorBoxResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'success': instance.success,
  'error': const TorBoxErrorCodeConverter().toJson(instance.error),
  'detail': instance.detail,
  'data': _$nullableGenericToJson(instance.data, toJsonT),
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);
