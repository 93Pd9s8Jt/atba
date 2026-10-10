// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'created_web_download_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatedWebDownloadData {

 String get hash;@JsonKey(name: 'webdownload_id') int get webdownloadId; String get authId; String? get jdownloaderId;/// Individual links extracted from the submitted link.
 List<String>? get linkList;
/// Create a copy of CreatedWebDownloadData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatedWebDownloadDataCopyWith<CreatedWebDownloadData> get copyWith => _$CreatedWebDownloadDataCopyWithImpl<CreatedWebDownloadData>(this as CreatedWebDownloadData, _$identity);

  /// Serializes this CreatedWebDownloadData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatedWebDownloadData&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.webdownloadId, webdownloadId) || other.webdownloadId == webdownloadId)&&(identical(other.authId, authId) || other.authId == authId)&&(identical(other.jdownloaderId, jdownloaderId) || other.jdownloaderId == jdownloaderId)&&const DeepCollectionEquality().equals(other.linkList, linkList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hash,webdownloadId,authId,jdownloaderId,const DeepCollectionEquality().hash(linkList));

@override
String toString() {
  return 'CreatedWebDownloadData(hash: $hash, webdownloadId: $webdownloadId, authId: $authId, jdownloaderId: $jdownloaderId, linkList: $linkList)';
}


}

/// @nodoc
abstract mixin class $CreatedWebDownloadDataCopyWith<$Res>  {
  factory $CreatedWebDownloadDataCopyWith(CreatedWebDownloadData value, $Res Function(CreatedWebDownloadData) _then) = _$CreatedWebDownloadDataCopyWithImpl;
@useResult
$Res call({
 String hash,@JsonKey(name: 'webdownload_id') int webdownloadId, String authId, String? jdownloaderId, List<String>? linkList
});




}
/// @nodoc
class _$CreatedWebDownloadDataCopyWithImpl<$Res>
    implements $CreatedWebDownloadDataCopyWith<$Res> {
  _$CreatedWebDownloadDataCopyWithImpl(this._self, this._then);

  final CreatedWebDownloadData _self;
  final $Res Function(CreatedWebDownloadData) _then;

/// Create a copy of CreatedWebDownloadData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hash = null,Object? webdownloadId = null,Object? authId = null,Object? jdownloaderId = freezed,Object? linkList = freezed,}) {
  return _then(_self.copyWith(
hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,webdownloadId: null == webdownloadId ? _self.webdownloadId : webdownloadId // ignore: cast_nullable_to_non_nullable
as int,authId: null == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String,jdownloaderId: freezed == jdownloaderId ? _self.jdownloaderId : jdownloaderId // ignore: cast_nullable_to_non_nullable
as String?,linkList: freezed == linkList ? _self.linkList : linkList // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatedWebDownloadData].
extension CreatedWebDownloadDataPatterns on CreatedWebDownloadData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatedWebDownloadData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatedWebDownloadData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatedWebDownloadData value)  $default,){
final _that = this;
switch (_that) {
case _CreatedWebDownloadData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatedWebDownloadData value)?  $default,){
final _that = this;
switch (_that) {
case _CreatedWebDownloadData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String hash, @JsonKey(name: 'webdownload_id')  int webdownloadId,  String authId,  String? jdownloaderId,  List<String>? linkList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatedWebDownloadData() when $default != null:
return $default(_that.hash,_that.webdownloadId,_that.authId,_that.jdownloaderId,_that.linkList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String hash, @JsonKey(name: 'webdownload_id')  int webdownloadId,  String authId,  String? jdownloaderId,  List<String>? linkList)  $default,) {final _that = this;
switch (_that) {
case _CreatedWebDownloadData():
return $default(_that.hash,_that.webdownloadId,_that.authId,_that.jdownloaderId,_that.linkList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String hash, @JsonKey(name: 'webdownload_id')  int webdownloadId,  String authId,  String? jdownloaderId,  List<String>? linkList)?  $default,) {final _that = this;
switch (_that) {
case _CreatedWebDownloadData() when $default != null:
return $default(_that.hash,_that.webdownloadId,_that.authId,_that.jdownloaderId,_that.linkList);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatedWebDownloadData implements CreatedWebDownloadData {
  const _CreatedWebDownloadData({required this.hash, @JsonKey(name: 'webdownload_id') required this.webdownloadId, required this.authId, this.jdownloaderId, final  List<String>? linkList}): _linkList = linkList;
  factory _CreatedWebDownloadData.fromJson(Map<String, dynamic> json) => _$CreatedWebDownloadDataFromJson(json);

@override final  String hash;
@override@JsonKey(name: 'webdownload_id') final  int webdownloadId;
@override final  String authId;
@override final  String? jdownloaderId;
/// Individual links extracted from the submitted link.
 final  List<String>? _linkList;
/// Individual links extracted from the submitted link.
@override List<String>? get linkList {
  final value = _linkList;
  if (value == null) return null;
  if (_linkList is EqualUnmodifiableListView) return _linkList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CreatedWebDownloadData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatedWebDownloadDataCopyWith<_CreatedWebDownloadData> get copyWith => __$CreatedWebDownloadDataCopyWithImpl<_CreatedWebDownloadData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatedWebDownloadDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatedWebDownloadData&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.webdownloadId, webdownloadId) || other.webdownloadId == webdownloadId)&&(identical(other.authId, authId) || other.authId == authId)&&(identical(other.jdownloaderId, jdownloaderId) || other.jdownloaderId == jdownloaderId)&&const DeepCollectionEquality().equals(other._linkList, _linkList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hash,webdownloadId,authId,jdownloaderId,const DeepCollectionEquality().hash(_linkList));

@override
String toString() {
  return 'CreatedWebDownloadData(hash: $hash, webdownloadId: $webdownloadId, authId: $authId, jdownloaderId: $jdownloaderId, linkList: $linkList)';
}


}

/// @nodoc
abstract mixin class _$CreatedWebDownloadDataCopyWith<$Res> implements $CreatedWebDownloadDataCopyWith<$Res> {
  factory _$CreatedWebDownloadDataCopyWith(_CreatedWebDownloadData value, $Res Function(_CreatedWebDownloadData) _then) = __$CreatedWebDownloadDataCopyWithImpl;
@override @useResult
$Res call({
 String hash,@JsonKey(name: 'webdownload_id') int webdownloadId, String authId, String? jdownloaderId, List<String>? linkList
});




}
/// @nodoc
class __$CreatedWebDownloadDataCopyWithImpl<$Res>
    implements _$CreatedWebDownloadDataCopyWith<$Res> {
  __$CreatedWebDownloadDataCopyWithImpl(this._self, this._then);

  final _CreatedWebDownloadData _self;
  final $Res Function(_CreatedWebDownloadData) _then;

/// Create a copy of CreatedWebDownloadData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hash = null,Object? webdownloadId = null,Object? authId = null,Object? jdownloaderId = freezed,Object? linkList = freezed,}) {
  return _then(_CreatedWebDownloadData(
hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,webdownloadId: null == webdownloadId ? _self.webdownloadId : webdownloadId // ignore: cast_nullable_to_non_nullable
as int,authId: null == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String,jdownloaderId: freezed == jdownloaderId ? _self.jdownloaderId : jdownloaderId // ignore: cast_nullable_to_non_nullable
as String?,linkList: freezed == linkList ? _self._linkList : linkList // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
