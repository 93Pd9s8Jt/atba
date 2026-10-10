// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'queued_download_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueuedDownloadData {

 int get id; String get createdAt; String? get magnet;/// Contents of the queued `.torrent` file, if any.
 String? get torrentFile; String? get hash; String? get name; String get type; String? get nameOverride; int? get seedTorrentOverride;
/// Create a copy of QueuedDownloadData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueuedDownloadDataCopyWith<QueuedDownloadData> get copyWith => _$QueuedDownloadDataCopyWithImpl<QueuedDownloadData>(this as QueuedDownloadData, _$identity);

  /// Serializes this QueuedDownloadData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueuedDownloadData&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.magnet, magnet) || other.magnet == magnet)&&(identical(other.torrentFile, torrentFile) || other.torrentFile == torrentFile)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.nameOverride, nameOverride) || other.nameOverride == nameOverride)&&(identical(other.seedTorrentOverride, seedTorrentOverride) || other.seedTorrentOverride == seedTorrentOverride));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,magnet,torrentFile,hash,name,type,nameOverride,seedTorrentOverride);

@override
String toString() {
  return 'QueuedDownloadData(id: $id, createdAt: $createdAt, magnet: $magnet, torrentFile: $torrentFile, hash: $hash, name: $name, type: $type, nameOverride: $nameOverride, seedTorrentOverride: $seedTorrentOverride)';
}


}

/// @nodoc
abstract mixin class $QueuedDownloadDataCopyWith<$Res>  {
  factory $QueuedDownloadDataCopyWith(QueuedDownloadData value, $Res Function(QueuedDownloadData) _then) = _$QueuedDownloadDataCopyWithImpl;
@useResult
$Res call({
 int id, String createdAt, String? magnet, String? torrentFile, String? hash, String? name, String type, String? nameOverride, int? seedTorrentOverride
});




}
/// @nodoc
class _$QueuedDownloadDataCopyWithImpl<$Res>
    implements $QueuedDownloadDataCopyWith<$Res> {
  _$QueuedDownloadDataCopyWithImpl(this._self, this._then);

  final QueuedDownloadData _self;
  final $Res Function(QueuedDownloadData) _then;

/// Create a copy of QueuedDownloadData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? magnet = freezed,Object? torrentFile = freezed,Object? hash = freezed,Object? name = freezed,Object? type = null,Object? nameOverride = freezed,Object? seedTorrentOverride = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,magnet: freezed == magnet ? _self.magnet : magnet // ignore: cast_nullable_to_non_nullable
as String?,torrentFile: freezed == torrentFile ? _self.torrentFile : torrentFile // ignore: cast_nullable_to_non_nullable
as String?,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,nameOverride: freezed == nameOverride ? _self.nameOverride : nameOverride // ignore: cast_nullable_to_non_nullable
as String?,seedTorrentOverride: freezed == seedTorrentOverride ? _self.seedTorrentOverride : seedTorrentOverride // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [QueuedDownloadData].
extension QueuedDownloadDataPatterns on QueuedDownloadData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueuedDownloadData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueuedDownloadData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueuedDownloadData value)  $default,){
final _that = this;
switch (_that) {
case _QueuedDownloadData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueuedDownloadData value)?  $default,){
final _that = this;
switch (_that) {
case _QueuedDownloadData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String createdAt,  String? magnet,  String? torrentFile,  String? hash,  String? name,  String type,  String? nameOverride,  int? seedTorrentOverride)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueuedDownloadData() when $default != null:
return $default(_that.id,_that.createdAt,_that.magnet,_that.torrentFile,_that.hash,_that.name,_that.type,_that.nameOverride,_that.seedTorrentOverride);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String createdAt,  String? magnet,  String? torrentFile,  String? hash,  String? name,  String type,  String? nameOverride,  int? seedTorrentOverride)  $default,) {final _that = this;
switch (_that) {
case _QueuedDownloadData():
return $default(_that.id,_that.createdAt,_that.magnet,_that.torrentFile,_that.hash,_that.name,_that.type,_that.nameOverride,_that.seedTorrentOverride);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String createdAt,  String? magnet,  String? torrentFile,  String? hash,  String? name,  String type,  String? nameOverride,  int? seedTorrentOverride)?  $default,) {final _that = this;
switch (_that) {
case _QueuedDownloadData() when $default != null:
return $default(_that.id,_that.createdAt,_that.magnet,_that.torrentFile,_that.hash,_that.name,_that.type,_that.nameOverride,_that.seedTorrentOverride);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueuedDownloadData implements QueuedDownloadData {
  const _QueuedDownloadData({required this.id, required this.createdAt, this.magnet, this.torrentFile, this.hash, this.name, required this.type, this.nameOverride, this.seedTorrentOverride});
  factory _QueuedDownloadData.fromJson(Map<String, dynamic> json) => _$QueuedDownloadDataFromJson(json);

@override final  int id;
@override final  String createdAt;
@override final  String? magnet;
/// Contents of the queued `.torrent` file, if any.
@override final  String? torrentFile;
@override final  String? hash;
@override final  String? name;
@override final  String type;
@override final  String? nameOverride;
@override final  int? seedTorrentOverride;

/// Create a copy of QueuedDownloadData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueuedDownloadDataCopyWith<_QueuedDownloadData> get copyWith => __$QueuedDownloadDataCopyWithImpl<_QueuedDownloadData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueuedDownloadDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueuedDownloadData&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.magnet, magnet) || other.magnet == magnet)&&(identical(other.torrentFile, torrentFile) || other.torrentFile == torrentFile)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.nameOverride, nameOverride) || other.nameOverride == nameOverride)&&(identical(other.seedTorrentOverride, seedTorrentOverride) || other.seedTorrentOverride == seedTorrentOverride));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,magnet,torrentFile,hash,name,type,nameOverride,seedTorrentOverride);

@override
String toString() {
  return 'QueuedDownloadData(id: $id, createdAt: $createdAt, magnet: $magnet, torrentFile: $torrentFile, hash: $hash, name: $name, type: $type, nameOverride: $nameOverride, seedTorrentOverride: $seedTorrentOverride)';
}


}

/// @nodoc
abstract mixin class _$QueuedDownloadDataCopyWith<$Res> implements $QueuedDownloadDataCopyWith<$Res> {
  factory _$QueuedDownloadDataCopyWith(_QueuedDownloadData value, $Res Function(_QueuedDownloadData) _then) = __$QueuedDownloadDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String createdAt, String? magnet, String? torrentFile, String? hash, String? name, String type, String? nameOverride, int? seedTorrentOverride
});




}
/// @nodoc
class __$QueuedDownloadDataCopyWithImpl<$Res>
    implements _$QueuedDownloadDataCopyWith<$Res> {
  __$QueuedDownloadDataCopyWithImpl(this._self, this._then);

  final _QueuedDownloadData _self;
  final $Res Function(_QueuedDownloadData) _then;

/// Create a copy of QueuedDownloadData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? magnet = freezed,Object? torrentFile = freezed,Object? hash = freezed,Object? name = freezed,Object? type = null,Object? nameOverride = freezed,Object? seedTorrentOverride = freezed,}) {
  return _then(_QueuedDownloadData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,magnet: freezed == magnet ? _self.magnet : magnet // ignore: cast_nullable_to_non_nullable
as String?,torrentFile: freezed == torrentFile ? _self.torrentFile : torrentFile // ignore: cast_nullable_to_non_nullable
as String?,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,nameOverride: freezed == nameOverride ? _self.nameOverride : nameOverride // ignore: cast_nullable_to_non_nullable
as String?,seedTorrentOverride: freezed == seedTorrentOverride ? _self.seedTorrentOverride : seedTorrentOverride // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
