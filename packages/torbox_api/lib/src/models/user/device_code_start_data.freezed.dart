// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_code_start_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceCodeStartData {

 String get deviceCode;/// Polling interval in seconds.
 int get interval;/// ISO-8601 timestamp when the device code expires.
 String get expiresAt; String get verificationUrl;/// Short URL suitable for manual entry.
 String get friendlyVerificationUrl;/// Human-friendly code the user enters on the verification page.
 String get code;
/// Create a copy of DeviceCodeStartData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceCodeStartDataCopyWith<DeviceCodeStartData> get copyWith => _$DeviceCodeStartDataCopyWithImpl<DeviceCodeStartData>(this as DeviceCodeStartData, _$identity);

  /// Serializes this DeviceCodeStartData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceCodeStartData&&(identical(other.deviceCode, deviceCode) || other.deviceCode == deviceCode)&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.verificationUrl, verificationUrl) || other.verificationUrl == verificationUrl)&&(identical(other.friendlyVerificationUrl, friendlyVerificationUrl) || other.friendlyVerificationUrl == friendlyVerificationUrl)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceCode,interval,expiresAt,verificationUrl,friendlyVerificationUrl,code);

@override
String toString() {
  return 'DeviceCodeStartData(deviceCode: $deviceCode, interval: $interval, expiresAt: $expiresAt, verificationUrl: $verificationUrl, friendlyVerificationUrl: $friendlyVerificationUrl, code: $code)';
}


}

/// @nodoc
abstract mixin class $DeviceCodeStartDataCopyWith<$Res>  {
  factory $DeviceCodeStartDataCopyWith(DeviceCodeStartData value, $Res Function(DeviceCodeStartData) _then) = _$DeviceCodeStartDataCopyWithImpl;
@useResult
$Res call({
 String deviceCode, int interval, String expiresAt, String verificationUrl, String friendlyVerificationUrl, String code
});




}
/// @nodoc
class _$DeviceCodeStartDataCopyWithImpl<$Res>
    implements $DeviceCodeStartDataCopyWith<$Res> {
  _$DeviceCodeStartDataCopyWithImpl(this._self, this._then);

  final DeviceCodeStartData _self;
  final $Res Function(DeviceCodeStartData) _then;

/// Create a copy of DeviceCodeStartData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceCode = null,Object? interval = null,Object? expiresAt = null,Object? verificationUrl = null,Object? friendlyVerificationUrl = null,Object? code = null,}) {
  return _then(_self.copyWith(
deviceCode: null == deviceCode ? _self.deviceCode : deviceCode // ignore: cast_nullable_to_non_nullable
as String,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as int,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,verificationUrl: null == verificationUrl ? _self.verificationUrl : verificationUrl // ignore: cast_nullable_to_non_nullable
as String,friendlyVerificationUrl: null == friendlyVerificationUrl ? _self.friendlyVerificationUrl : friendlyVerificationUrl // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceCodeStartData].
extension DeviceCodeStartDataPatterns on DeviceCodeStartData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceCodeStartData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceCodeStartData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceCodeStartData value)  $default,){
final _that = this;
switch (_that) {
case _DeviceCodeStartData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceCodeStartData value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceCodeStartData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String deviceCode,  int interval,  String expiresAt,  String verificationUrl,  String friendlyVerificationUrl,  String code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceCodeStartData() when $default != null:
return $default(_that.deviceCode,_that.interval,_that.expiresAt,_that.verificationUrl,_that.friendlyVerificationUrl,_that.code);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String deviceCode,  int interval,  String expiresAt,  String verificationUrl,  String friendlyVerificationUrl,  String code)  $default,) {final _that = this;
switch (_that) {
case _DeviceCodeStartData():
return $default(_that.deviceCode,_that.interval,_that.expiresAt,_that.verificationUrl,_that.friendlyVerificationUrl,_that.code);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String deviceCode,  int interval,  String expiresAt,  String verificationUrl,  String friendlyVerificationUrl,  String code)?  $default,) {final _that = this;
switch (_that) {
case _DeviceCodeStartData() when $default != null:
return $default(_that.deviceCode,_that.interval,_that.expiresAt,_that.verificationUrl,_that.friendlyVerificationUrl,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceCodeStartData implements DeviceCodeStartData {
  const _DeviceCodeStartData({required this.deviceCode, required this.interval, required this.expiresAt, required this.verificationUrl, required this.friendlyVerificationUrl, required this.code});
  factory _DeviceCodeStartData.fromJson(Map<String, dynamic> json) => _$DeviceCodeStartDataFromJson(json);

@override final  String deviceCode;
/// Polling interval in seconds.
@override final  int interval;
/// ISO-8601 timestamp when the device code expires.
@override final  String expiresAt;
@override final  String verificationUrl;
/// Short URL suitable for manual entry.
@override final  String friendlyVerificationUrl;
/// Human-friendly code the user enters on the verification page.
@override final  String code;

/// Create a copy of DeviceCodeStartData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceCodeStartDataCopyWith<_DeviceCodeStartData> get copyWith => __$DeviceCodeStartDataCopyWithImpl<_DeviceCodeStartData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceCodeStartDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceCodeStartData&&(identical(other.deviceCode, deviceCode) || other.deviceCode == deviceCode)&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.verificationUrl, verificationUrl) || other.verificationUrl == verificationUrl)&&(identical(other.friendlyVerificationUrl, friendlyVerificationUrl) || other.friendlyVerificationUrl == friendlyVerificationUrl)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceCode,interval,expiresAt,verificationUrl,friendlyVerificationUrl,code);

@override
String toString() {
  return 'DeviceCodeStartData(deviceCode: $deviceCode, interval: $interval, expiresAt: $expiresAt, verificationUrl: $verificationUrl, friendlyVerificationUrl: $friendlyVerificationUrl, code: $code)';
}


}

/// @nodoc
abstract mixin class _$DeviceCodeStartDataCopyWith<$Res> implements $DeviceCodeStartDataCopyWith<$Res> {
  factory _$DeviceCodeStartDataCopyWith(_DeviceCodeStartData value, $Res Function(_DeviceCodeStartData) _then) = __$DeviceCodeStartDataCopyWithImpl;
@override @useResult
$Res call({
 String deviceCode, int interval, String expiresAt, String verificationUrl, String friendlyVerificationUrl, String code
});




}
/// @nodoc
class __$DeviceCodeStartDataCopyWithImpl<$Res>
    implements _$DeviceCodeStartDataCopyWith<$Res> {
  __$DeviceCodeStartDataCopyWithImpl(this._self, this._then);

  final _DeviceCodeStartData _self;
  final $Res Function(_DeviceCodeStartData) _then;

/// Create a copy of DeviceCodeStartData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceCode = null,Object? interval = null,Object? expiresAt = null,Object? verificationUrl = null,Object? friendlyVerificationUrl = null,Object? code = null,}) {
  return _then(_DeviceCodeStartData(
deviceCode: null == deviceCode ? _self.deviceCode : deviceCode // ignore: cast_nullable_to_non_nullable
as String,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as int,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,verificationUrl: null == verificationUrl ? _self.verificationUrl : verificationUrl // ignore: cast_nullable_to_non_nullable
as String,friendlyVerificationUrl: null == friendlyVerificationUrl ? _self.friendlyVerificationUrl : friendlyVerificationUrl // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
