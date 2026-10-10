// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ValidationErrorItem _$ValidationErrorItemFromJson(Map<String, dynamic> json) =>
    _ValidationErrorItem(
      loc: json['loc'] as List<dynamic>,
      msg: json['msg'] as String,
      type: json['type'] as String,
      input: json['input'],
      ctx: json['ctx'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ValidationErrorItemToJson(
  _ValidationErrorItem instance,
) => <String, dynamic>{
  'loc': instance.loc,
  'msg': instance.msg,
  'type': instance.type,
  'input': instance.input,
  'ctx': instance.ctx,
};

_HttpValidationError _$HttpValidationErrorFromJson(Map<String, dynamic> json) =>
    _HttpValidationError(
      detail: (json['detail'] as List<dynamic>)
          .map((e) => ValidationErrorItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HttpValidationErrorToJson(
  _HttpValidationError instance,
) => <String, dynamic>{
  'detail': instance.detail.map((e) => e.toJson()).toList(),
};
