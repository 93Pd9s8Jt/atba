// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usenet_download_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsenetDownloadData {

 int get id; String? get createdAt; String? get updatedAt; String? get authId; String? get name; String? get hash; String? get downloadState; int? get downloadSpeed; String? get originalUrl; int? get eta; double? get progress; int? get size; String? get downloadId; List<DownloadFileData>? get files; bool? get active; bool? get cached; bool? get downloadPresent; bool? get downloadFinished; String? get expiresAt; int? get server; String? get cachedAt; List<String>? get alternativeHashes; List<String>? get tags; bool? get airlocked;
/// Create a copy of UsenetDownloadData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsenetDownloadDataCopyWith<UsenetDownloadData> get copyWith => _$UsenetDownloadDataCopyWithImpl<UsenetDownloadData>(this as UsenetDownloadData, _$identity);

  /// Serializes this UsenetDownloadData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsenetDownloadData&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.authId, authId) || other.authId == authId)&&(identical(other.name, name) || other.name == name)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.downloadState, downloadState) || other.downloadState == downloadState)&&(identical(other.downloadSpeed, downloadSpeed) || other.downloadSpeed == downloadSpeed)&&(identical(other.originalUrl, originalUrl) || other.originalUrl == originalUrl)&&(identical(other.eta, eta) || other.eta == eta)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.size, size) || other.size == size)&&(identical(other.downloadId, downloadId) || other.downloadId == downloadId)&&const DeepCollectionEquality().equals(other.files, files)&&(identical(other.active, active) || other.active == active)&&(identical(other.cached, cached) || other.cached == cached)&&(identical(other.downloadPresent, downloadPresent) || other.downloadPresent == downloadPresent)&&(identical(other.downloadFinished, downloadFinished) || other.downloadFinished == downloadFinished)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.server, server) || other.server == server)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt)&&const DeepCollectionEquality().equals(other.alternativeHashes, alternativeHashes)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.airlocked, airlocked) || other.airlocked == airlocked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,createdAt,updatedAt,authId,name,hash,downloadState,downloadSpeed,originalUrl,eta,progress,size,downloadId,const DeepCollectionEquality().hash(files),active,cached,downloadPresent,downloadFinished,expiresAt,server,cachedAt,const DeepCollectionEquality().hash(alternativeHashes),const DeepCollectionEquality().hash(tags),airlocked]);

@override
String toString() {
  return 'UsenetDownloadData(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, authId: $authId, name: $name, hash: $hash, downloadState: $downloadState, downloadSpeed: $downloadSpeed, originalUrl: $originalUrl, eta: $eta, progress: $progress, size: $size, downloadId: $downloadId, files: $files, active: $active, cached: $cached, downloadPresent: $downloadPresent, downloadFinished: $downloadFinished, expiresAt: $expiresAt, server: $server, cachedAt: $cachedAt, alternativeHashes: $alternativeHashes, tags: $tags, airlocked: $airlocked)';
}


}

/// @nodoc
abstract mixin class $UsenetDownloadDataCopyWith<$Res>  {
  factory $UsenetDownloadDataCopyWith(UsenetDownloadData value, $Res Function(UsenetDownloadData) _then) = _$UsenetDownloadDataCopyWithImpl;
@useResult
$Res call({
 int id, String? createdAt, String? updatedAt, String? authId, String? name, String? hash, String? downloadState, int? downloadSpeed, String? originalUrl, int? eta, double? progress, int? size, String? downloadId, List<DownloadFileData>? files, bool? active, bool? cached, bool? downloadPresent, bool? downloadFinished, String? expiresAt, int? server, String? cachedAt, List<String>? alternativeHashes, List<String>? tags, bool? airlocked
});




}
/// @nodoc
class _$UsenetDownloadDataCopyWithImpl<$Res>
    implements $UsenetDownloadDataCopyWith<$Res> {
  _$UsenetDownloadDataCopyWithImpl(this._self, this._then);

  final UsenetDownloadData _self;
  final $Res Function(UsenetDownloadData) _then;

/// Create a copy of UsenetDownloadData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? authId = freezed,Object? name = freezed,Object? hash = freezed,Object? downloadState = freezed,Object? downloadSpeed = freezed,Object? originalUrl = freezed,Object? eta = freezed,Object? progress = freezed,Object? size = freezed,Object? downloadId = freezed,Object? files = freezed,Object? active = freezed,Object? cached = freezed,Object? downloadPresent = freezed,Object? downloadFinished = freezed,Object? expiresAt = freezed,Object? server = freezed,Object? cachedAt = freezed,Object? alternativeHashes = freezed,Object? tags = freezed,Object? airlocked = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,authId: freezed == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,downloadState: freezed == downloadState ? _self.downloadState : downloadState // ignore: cast_nullable_to_non_nullable
as String?,downloadSpeed: freezed == downloadSpeed ? _self.downloadSpeed : downloadSpeed // ignore: cast_nullable_to_non_nullable
as int?,originalUrl: freezed == originalUrl ? _self.originalUrl : originalUrl // ignore: cast_nullable_to_non_nullable
as String?,eta: freezed == eta ? _self.eta : eta // ignore: cast_nullable_to_non_nullable
as int?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,downloadId: freezed == downloadId ? _self.downloadId : downloadId // ignore: cast_nullable_to_non_nullable
as String?,files: freezed == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<DownloadFileData>?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,cached: freezed == cached ? _self.cached : cached // ignore: cast_nullable_to_non_nullable
as bool?,downloadPresent: freezed == downloadPresent ? _self.downloadPresent : downloadPresent // ignore: cast_nullable_to_non_nullable
as bool?,downloadFinished: freezed == downloadFinished ? _self.downloadFinished : downloadFinished // ignore: cast_nullable_to_non_nullable
as bool?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,server: freezed == server ? _self.server : server // ignore: cast_nullable_to_non_nullable
as int?,cachedAt: freezed == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as String?,alternativeHashes: freezed == alternativeHashes ? _self.alternativeHashes : alternativeHashes // ignore: cast_nullable_to_non_nullable
as List<String>?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,airlocked: freezed == airlocked ? _self.airlocked : airlocked // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [UsenetDownloadData].
extension UsenetDownloadDataPatterns on UsenetDownloadData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsenetDownloadData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsenetDownloadData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsenetDownloadData value)  $default,){
final _that = this;
switch (_that) {
case _UsenetDownloadData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsenetDownloadData value)?  $default,){
final _that = this;
switch (_that) {
case _UsenetDownloadData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? createdAt,  String? updatedAt,  String? authId,  String? name,  String? hash,  String? downloadState,  int? downloadSpeed,  String? originalUrl,  int? eta,  double? progress,  int? size,  String? downloadId,  List<DownloadFileData>? files,  bool? active,  bool? cached,  bool? downloadPresent,  bool? downloadFinished,  String? expiresAt,  int? server,  String? cachedAt,  List<String>? alternativeHashes,  List<String>? tags,  bool? airlocked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsenetDownloadData() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.authId,_that.name,_that.hash,_that.downloadState,_that.downloadSpeed,_that.originalUrl,_that.eta,_that.progress,_that.size,_that.downloadId,_that.files,_that.active,_that.cached,_that.downloadPresent,_that.downloadFinished,_that.expiresAt,_that.server,_that.cachedAt,_that.alternativeHashes,_that.tags,_that.airlocked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? createdAt,  String? updatedAt,  String? authId,  String? name,  String? hash,  String? downloadState,  int? downloadSpeed,  String? originalUrl,  int? eta,  double? progress,  int? size,  String? downloadId,  List<DownloadFileData>? files,  bool? active,  bool? cached,  bool? downloadPresent,  bool? downloadFinished,  String? expiresAt,  int? server,  String? cachedAt,  List<String>? alternativeHashes,  List<String>? tags,  bool? airlocked)  $default,) {final _that = this;
switch (_that) {
case _UsenetDownloadData():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.authId,_that.name,_that.hash,_that.downloadState,_that.downloadSpeed,_that.originalUrl,_that.eta,_that.progress,_that.size,_that.downloadId,_that.files,_that.active,_that.cached,_that.downloadPresent,_that.downloadFinished,_that.expiresAt,_that.server,_that.cachedAt,_that.alternativeHashes,_that.tags,_that.airlocked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? createdAt,  String? updatedAt,  String? authId,  String? name,  String? hash,  String? downloadState,  int? downloadSpeed,  String? originalUrl,  int? eta,  double? progress,  int? size,  String? downloadId,  List<DownloadFileData>? files,  bool? active,  bool? cached,  bool? downloadPresent,  bool? downloadFinished,  String? expiresAt,  int? server,  String? cachedAt,  List<String>? alternativeHashes,  List<String>? tags,  bool? airlocked)?  $default,) {final _that = this;
switch (_that) {
case _UsenetDownloadData() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.authId,_that.name,_that.hash,_that.downloadState,_that.downloadSpeed,_that.originalUrl,_that.eta,_that.progress,_that.size,_that.downloadId,_that.files,_that.active,_that.cached,_that.downloadPresent,_that.downloadFinished,_that.expiresAt,_that.server,_that.cachedAt,_that.alternativeHashes,_that.tags,_that.airlocked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UsenetDownloadData implements UsenetDownloadData {
  const _UsenetDownloadData({required this.id, this.createdAt, this.updatedAt, this.authId, this.name, this.hash, this.downloadState, this.downloadSpeed, this.originalUrl, this.eta, this.progress, this.size, this.downloadId, final  List<DownloadFileData>? files, this.active, this.cached, this.downloadPresent, this.downloadFinished, this.expiresAt, this.server, this.cachedAt, final  List<String>? alternativeHashes, final  List<String>? tags, this.airlocked}): _files = files,_alternativeHashes = alternativeHashes,_tags = tags;
  factory _UsenetDownloadData.fromJson(Map<String, dynamic> json) => _$UsenetDownloadDataFromJson(json);

@override final  int id;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? authId;
@override final  String? name;
@override final  String? hash;
@override final  String? downloadState;
@override final  int? downloadSpeed;
@override final  String? originalUrl;
@override final  int? eta;
@override final  double? progress;
@override final  int? size;
@override final  String? downloadId;
 final  List<DownloadFileData>? _files;
@override List<DownloadFileData>? get files {
  final value = _files;
  if (value == null) return null;
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? active;
@override final  bool? cached;
@override final  bool? downloadPresent;
@override final  bool? downloadFinished;
@override final  String? expiresAt;
@override final  int? server;
@override final  String? cachedAt;
 final  List<String>? _alternativeHashes;
@override List<String>? get alternativeHashes {
  final value = _alternativeHashes;
  if (value == null) return null;
  if (_alternativeHashes is EqualUnmodifiableListView) return _alternativeHashes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? airlocked;

/// Create a copy of UsenetDownloadData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsenetDownloadDataCopyWith<_UsenetDownloadData> get copyWith => __$UsenetDownloadDataCopyWithImpl<_UsenetDownloadData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsenetDownloadDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsenetDownloadData&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.authId, authId) || other.authId == authId)&&(identical(other.name, name) || other.name == name)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.downloadState, downloadState) || other.downloadState == downloadState)&&(identical(other.downloadSpeed, downloadSpeed) || other.downloadSpeed == downloadSpeed)&&(identical(other.originalUrl, originalUrl) || other.originalUrl == originalUrl)&&(identical(other.eta, eta) || other.eta == eta)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.size, size) || other.size == size)&&(identical(other.downloadId, downloadId) || other.downloadId == downloadId)&&const DeepCollectionEquality().equals(other._files, _files)&&(identical(other.active, active) || other.active == active)&&(identical(other.cached, cached) || other.cached == cached)&&(identical(other.downloadPresent, downloadPresent) || other.downloadPresent == downloadPresent)&&(identical(other.downloadFinished, downloadFinished) || other.downloadFinished == downloadFinished)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.server, server) || other.server == server)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt)&&const DeepCollectionEquality().equals(other._alternativeHashes, _alternativeHashes)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.airlocked, airlocked) || other.airlocked == airlocked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,createdAt,updatedAt,authId,name,hash,downloadState,downloadSpeed,originalUrl,eta,progress,size,downloadId,const DeepCollectionEquality().hash(_files),active,cached,downloadPresent,downloadFinished,expiresAt,server,cachedAt,const DeepCollectionEquality().hash(_alternativeHashes),const DeepCollectionEquality().hash(_tags),airlocked]);

@override
String toString() {
  return 'UsenetDownloadData(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, authId: $authId, name: $name, hash: $hash, downloadState: $downloadState, downloadSpeed: $downloadSpeed, originalUrl: $originalUrl, eta: $eta, progress: $progress, size: $size, downloadId: $downloadId, files: $files, active: $active, cached: $cached, downloadPresent: $downloadPresent, downloadFinished: $downloadFinished, expiresAt: $expiresAt, server: $server, cachedAt: $cachedAt, alternativeHashes: $alternativeHashes, tags: $tags, airlocked: $airlocked)';
}


}

/// @nodoc
abstract mixin class _$UsenetDownloadDataCopyWith<$Res> implements $UsenetDownloadDataCopyWith<$Res> {
  factory _$UsenetDownloadDataCopyWith(_UsenetDownloadData value, $Res Function(_UsenetDownloadData) _then) = __$UsenetDownloadDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String? createdAt, String? updatedAt, String? authId, String? name, String? hash, String? downloadState, int? downloadSpeed, String? originalUrl, int? eta, double? progress, int? size, String? downloadId, List<DownloadFileData>? files, bool? active, bool? cached, bool? downloadPresent, bool? downloadFinished, String? expiresAt, int? server, String? cachedAt, List<String>? alternativeHashes, List<String>? tags, bool? airlocked
});




}
/// @nodoc
class __$UsenetDownloadDataCopyWithImpl<$Res>
    implements _$UsenetDownloadDataCopyWith<$Res> {
  __$UsenetDownloadDataCopyWithImpl(this._self, this._then);

  final _UsenetDownloadData _self;
  final $Res Function(_UsenetDownloadData) _then;

/// Create a copy of UsenetDownloadData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? authId = freezed,Object? name = freezed,Object? hash = freezed,Object? downloadState = freezed,Object? downloadSpeed = freezed,Object? originalUrl = freezed,Object? eta = freezed,Object? progress = freezed,Object? size = freezed,Object? downloadId = freezed,Object? files = freezed,Object? active = freezed,Object? cached = freezed,Object? downloadPresent = freezed,Object? downloadFinished = freezed,Object? expiresAt = freezed,Object? server = freezed,Object? cachedAt = freezed,Object? alternativeHashes = freezed,Object? tags = freezed,Object? airlocked = freezed,}) {
  return _then(_UsenetDownloadData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,authId: freezed == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,downloadState: freezed == downloadState ? _self.downloadState : downloadState // ignore: cast_nullable_to_non_nullable
as String?,downloadSpeed: freezed == downloadSpeed ? _self.downloadSpeed : downloadSpeed // ignore: cast_nullable_to_non_nullable
as int?,originalUrl: freezed == originalUrl ? _self.originalUrl : originalUrl // ignore: cast_nullable_to_non_nullable
as String?,eta: freezed == eta ? _self.eta : eta // ignore: cast_nullable_to_non_nullable
as int?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,downloadId: freezed == downloadId ? _self.downloadId : downloadId // ignore: cast_nullable_to_non_nullable
as String?,files: freezed == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<DownloadFileData>?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,cached: freezed == cached ? _self.cached : cached // ignore: cast_nullable_to_non_nullable
as bool?,downloadPresent: freezed == downloadPresent ? _self.downloadPresent : downloadPresent // ignore: cast_nullable_to_non_nullable
as bool?,downloadFinished: freezed == downloadFinished ? _self.downloadFinished : downloadFinished // ignore: cast_nullable_to_non_nullable
as bool?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,server: freezed == server ? _self.server : server // ignore: cast_nullable_to_non_nullable
as int?,cachedAt: freezed == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as String?,alternativeHashes: freezed == alternativeHashes ? _self._alternativeHashes : alternativeHashes // ignore: cast_nullable_to_non_nullable
as List<String>?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,airlocked: freezed == airlocked ? _self.airlocked : airlocked // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
