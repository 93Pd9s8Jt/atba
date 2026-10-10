// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'created_usenet_download_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatedUsenetDownloadData {

 String get hash;/// Declared as `usenetdownload_id` by the API.
@JsonKey(name: 'usenetdownload_id') int get usenetDownloadId; String get authId;
/// Create a copy of CreatedUsenetDownloadData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatedUsenetDownloadDataCopyWith<CreatedUsenetDownloadData> get copyWith => _$CreatedUsenetDownloadDataCopyWithImpl<CreatedUsenetDownloadData>(this as CreatedUsenetDownloadData, _$identity);

  /// Serializes this CreatedUsenetDownloadData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatedUsenetDownloadData&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.usenetDownloadId, usenetDownloadId) || other.usenetDownloadId == usenetDownloadId)&&(identical(other.authId, authId) || other.authId == authId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hash,usenetDownloadId,authId);

@override
String toString() {
  return 'CreatedUsenetDownloadData(hash: $hash, usenetDownloadId: $usenetDownloadId, authId: $authId)';
}


}

/// @nodoc
abstract mixin class $CreatedUsenetDownloadDataCopyWith<$Res>  {
  factory $CreatedUsenetDownloadDataCopyWith(CreatedUsenetDownloadData value, $Res Function(CreatedUsenetDownloadData) _then) = _$CreatedUsenetDownloadDataCopyWithImpl;
@useResult
$Res call({
 String hash,@JsonKey(name: 'usenetdownload_id') int usenetDownloadId, String authId
});




}
/// @nodoc
class _$CreatedUsenetDownloadDataCopyWithImpl<$Res>
    implements $CreatedUsenetDownloadDataCopyWith<$Res> {
  _$CreatedUsenetDownloadDataCopyWithImpl(this._self, this._then);

  final CreatedUsenetDownloadData _self;
  final $Res Function(CreatedUsenetDownloadData) _then;

/// Create a copy of CreatedUsenetDownloadData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hash = null,Object? usenetDownloadId = null,Object? authId = null,}) {
  return _then(_self.copyWith(
hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,usenetDownloadId: null == usenetDownloadId ? _self.usenetDownloadId : usenetDownloadId // ignore: cast_nullable_to_non_nullable
as int,authId: null == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatedUsenetDownloadData].
extension CreatedUsenetDownloadDataPatterns on CreatedUsenetDownloadData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatedUsenetDownloadData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatedUsenetDownloadData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatedUsenetDownloadData value)  $default,){
final _that = this;
switch (_that) {
case _CreatedUsenetDownloadData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatedUsenetDownloadData value)?  $default,){
final _that = this;
switch (_that) {
case _CreatedUsenetDownloadData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String hash, @JsonKey(name: 'usenetdownload_id')  int usenetDownloadId,  String authId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatedUsenetDownloadData() when $default != null:
return $default(_that.hash,_that.usenetDownloadId,_that.authId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String hash, @JsonKey(name: 'usenetdownload_id')  int usenetDownloadId,  String authId)  $default,) {final _that = this;
switch (_that) {
case _CreatedUsenetDownloadData():
return $default(_that.hash,_that.usenetDownloadId,_that.authId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String hash, @JsonKey(name: 'usenetdownload_id')  int usenetDownloadId,  String authId)?  $default,) {final _that = this;
switch (_that) {
case _CreatedUsenetDownloadData() when $default != null:
return $default(_that.hash,_that.usenetDownloadId,_that.authId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatedUsenetDownloadData implements CreatedUsenetDownloadData {
  const _CreatedUsenetDownloadData({required this.hash, @JsonKey(name: 'usenetdownload_id') required this.usenetDownloadId, required this.authId});
  factory _CreatedUsenetDownloadData.fromJson(Map<String, dynamic> json) => _$CreatedUsenetDownloadDataFromJson(json);

@override final  String hash;
/// Declared as `usenetdownload_id` by the API.
@override@JsonKey(name: 'usenetdownload_id') final  int usenetDownloadId;
@override final  String authId;

/// Create a copy of CreatedUsenetDownloadData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatedUsenetDownloadDataCopyWith<_CreatedUsenetDownloadData> get copyWith => __$CreatedUsenetDownloadDataCopyWithImpl<_CreatedUsenetDownloadData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatedUsenetDownloadDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatedUsenetDownloadData&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.usenetDownloadId, usenetDownloadId) || other.usenetDownloadId == usenetDownloadId)&&(identical(other.authId, authId) || other.authId == authId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hash,usenetDownloadId,authId);

@override
String toString() {
  return 'CreatedUsenetDownloadData(hash: $hash, usenetDownloadId: $usenetDownloadId, authId: $authId)';
}


}

/// @nodoc
abstract mixin class _$CreatedUsenetDownloadDataCopyWith<$Res> implements $CreatedUsenetDownloadDataCopyWith<$Res> {
  factory _$CreatedUsenetDownloadDataCopyWith(_CreatedUsenetDownloadData value, $Res Function(_CreatedUsenetDownloadData) _then) = __$CreatedUsenetDownloadDataCopyWithImpl;
@override @useResult
$Res call({
 String hash,@JsonKey(name: 'usenetdownload_id') int usenetDownloadId, String authId
});




}
/// @nodoc
class __$CreatedUsenetDownloadDataCopyWithImpl<$Res>
    implements _$CreatedUsenetDownloadDataCopyWith<$Res> {
  __$CreatedUsenetDownloadDataCopyWithImpl(this._self, this._then);

  final _CreatedUsenetDownloadData _self;
  final $Res Function(_CreatedUsenetDownloadData) _then;

/// Create a copy of CreatedUsenetDownloadData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hash = null,Object? usenetDownloadId = null,Object? authId = null,}) {
  return _then(_CreatedUsenetDownloadData(
hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,usenetDownloadId: null == usenetDownloadId ? _self.usenetDownloadId : usenetDownloadId // ignore: cast_nullable_to_non_nullable
as int,authId: null == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
