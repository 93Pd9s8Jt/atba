// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_file_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DownloadFileData {

 int get id; String? get md5; String? get hash; String get name; int get size;@JsonKey(name: 'zipped') bool? get zipped; String? get s3Path; bool? get infected; String? get mimetype; String? get shortName; String? get absolutePath; String? get opensubtitlesHash;
/// Create a copy of DownloadFileData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadFileDataCopyWith<DownloadFileData> get copyWith => _$DownloadFileDataCopyWithImpl<DownloadFileData>(this as DownloadFileData, _$identity);

  /// Serializes this DownloadFileData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadFileData&&(identical(other.id, id) || other.id == id)&&(identical(other.md5, md5) || other.md5 == md5)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.name, name) || other.name == name)&&(identical(other.size, size) || other.size == size)&&(identical(other.zipped, zipped) || other.zipped == zipped)&&(identical(other.s3Path, s3Path) || other.s3Path == s3Path)&&(identical(other.infected, infected) || other.infected == infected)&&(identical(other.mimetype, mimetype) || other.mimetype == mimetype)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.absolutePath, absolutePath) || other.absolutePath == absolutePath)&&(identical(other.opensubtitlesHash, opensubtitlesHash) || other.opensubtitlesHash == opensubtitlesHash));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,md5,hash,name,size,zipped,s3Path,infected,mimetype,shortName,absolutePath,opensubtitlesHash);

@override
String toString() {
  return 'DownloadFileData(id: $id, md5: $md5, hash: $hash, name: $name, size: $size, zipped: $zipped, s3Path: $s3Path, infected: $infected, mimetype: $mimetype, shortName: $shortName, absolutePath: $absolutePath, opensubtitlesHash: $opensubtitlesHash)';
}


}

/// @nodoc
abstract mixin class $DownloadFileDataCopyWith<$Res>  {
  factory $DownloadFileDataCopyWith(DownloadFileData value, $Res Function(DownloadFileData) _then) = _$DownloadFileDataCopyWithImpl;
@useResult
$Res call({
 int id, String? md5, String? hash, String name, int size,@JsonKey(name: 'zipped') bool? zipped, String? s3Path, bool? infected, String? mimetype, String? shortName, String? absolutePath, String? opensubtitlesHash
});




}
/// @nodoc
class _$DownloadFileDataCopyWithImpl<$Res>
    implements $DownloadFileDataCopyWith<$Res> {
  _$DownloadFileDataCopyWithImpl(this._self, this._then);

  final DownloadFileData _self;
  final $Res Function(DownloadFileData) _then;

/// Create a copy of DownloadFileData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? md5 = freezed,Object? hash = freezed,Object? name = null,Object? size = null,Object? zipped = freezed,Object? s3Path = freezed,Object? infected = freezed,Object? mimetype = freezed,Object? shortName = freezed,Object? absolutePath = freezed,Object? opensubtitlesHash = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,md5: freezed == md5 ? _self.md5 : md5 // ignore: cast_nullable_to_non_nullable
as String?,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,zipped: freezed == zipped ? _self.zipped : zipped // ignore: cast_nullable_to_non_nullable
as bool?,s3Path: freezed == s3Path ? _self.s3Path : s3Path // ignore: cast_nullable_to_non_nullable
as String?,infected: freezed == infected ? _self.infected : infected // ignore: cast_nullable_to_non_nullable
as bool?,mimetype: freezed == mimetype ? _self.mimetype : mimetype // ignore: cast_nullable_to_non_nullable
as String?,shortName: freezed == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String?,absolutePath: freezed == absolutePath ? _self.absolutePath : absolutePath // ignore: cast_nullable_to_non_nullable
as String?,opensubtitlesHash: freezed == opensubtitlesHash ? _self.opensubtitlesHash : opensubtitlesHash // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DownloadFileData].
extension DownloadFileDataPatterns on DownloadFileData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DownloadFileData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DownloadFileData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DownloadFileData value)  $default,){
final _that = this;
switch (_that) {
case _DownloadFileData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DownloadFileData value)?  $default,){
final _that = this;
switch (_that) {
case _DownloadFileData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? md5,  String? hash,  String name,  int size, @JsonKey(name: 'zipped')  bool? zipped,  String? s3Path,  bool? infected,  String? mimetype,  String? shortName,  String? absolutePath,  String? opensubtitlesHash)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DownloadFileData() when $default != null:
return $default(_that.id,_that.md5,_that.hash,_that.name,_that.size,_that.zipped,_that.s3Path,_that.infected,_that.mimetype,_that.shortName,_that.absolutePath,_that.opensubtitlesHash);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? md5,  String? hash,  String name,  int size, @JsonKey(name: 'zipped')  bool? zipped,  String? s3Path,  bool? infected,  String? mimetype,  String? shortName,  String? absolutePath,  String? opensubtitlesHash)  $default,) {final _that = this;
switch (_that) {
case _DownloadFileData():
return $default(_that.id,_that.md5,_that.hash,_that.name,_that.size,_that.zipped,_that.s3Path,_that.infected,_that.mimetype,_that.shortName,_that.absolutePath,_that.opensubtitlesHash);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? md5,  String? hash,  String name,  int size, @JsonKey(name: 'zipped')  bool? zipped,  String? s3Path,  bool? infected,  String? mimetype,  String? shortName,  String? absolutePath,  String? opensubtitlesHash)?  $default,) {final _that = this;
switch (_that) {
case _DownloadFileData() when $default != null:
return $default(_that.id,_that.md5,_that.hash,_that.name,_that.size,_that.zipped,_that.s3Path,_that.infected,_that.mimetype,_that.shortName,_that.absolutePath,_that.opensubtitlesHash);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DownloadFileData implements DownloadFileData {
  const _DownloadFileData({required this.id, this.md5, this.hash, required this.name, required this.size, @JsonKey(name: 'zipped') this.zipped, this.s3Path, this.infected, this.mimetype, this.shortName, this.absolutePath, this.opensubtitlesHash});
  factory _DownloadFileData.fromJson(Map<String, dynamic> json) => _$DownloadFileDataFromJson(json);

@override final  int id;
@override final  String? md5;
@override final  String? hash;
@override final  String name;
@override final  int size;
@override@JsonKey(name: 'zipped') final  bool? zipped;
@override final  String? s3Path;
@override final  bool? infected;
@override final  String? mimetype;
@override final  String? shortName;
@override final  String? absolutePath;
@override final  String? opensubtitlesHash;

/// Create a copy of DownloadFileData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownloadFileDataCopyWith<_DownloadFileData> get copyWith => __$DownloadFileDataCopyWithImpl<_DownloadFileData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DownloadFileDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownloadFileData&&(identical(other.id, id) || other.id == id)&&(identical(other.md5, md5) || other.md5 == md5)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.name, name) || other.name == name)&&(identical(other.size, size) || other.size == size)&&(identical(other.zipped, zipped) || other.zipped == zipped)&&(identical(other.s3Path, s3Path) || other.s3Path == s3Path)&&(identical(other.infected, infected) || other.infected == infected)&&(identical(other.mimetype, mimetype) || other.mimetype == mimetype)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.absolutePath, absolutePath) || other.absolutePath == absolutePath)&&(identical(other.opensubtitlesHash, opensubtitlesHash) || other.opensubtitlesHash == opensubtitlesHash));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,md5,hash,name,size,zipped,s3Path,infected,mimetype,shortName,absolutePath,opensubtitlesHash);

@override
String toString() {
  return 'DownloadFileData(id: $id, md5: $md5, hash: $hash, name: $name, size: $size, zipped: $zipped, s3Path: $s3Path, infected: $infected, mimetype: $mimetype, shortName: $shortName, absolutePath: $absolutePath, opensubtitlesHash: $opensubtitlesHash)';
}


}

/// @nodoc
abstract mixin class _$DownloadFileDataCopyWith<$Res> implements $DownloadFileDataCopyWith<$Res> {
  factory _$DownloadFileDataCopyWith(_DownloadFileData value, $Res Function(_DownloadFileData) _then) = __$DownloadFileDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String? md5, String? hash, String name, int size,@JsonKey(name: 'zipped') bool? zipped, String? s3Path, bool? infected, String? mimetype, String? shortName, String? absolutePath, String? opensubtitlesHash
});




}
/// @nodoc
class __$DownloadFileDataCopyWithImpl<$Res>
    implements _$DownloadFileDataCopyWith<$Res> {
  __$DownloadFileDataCopyWithImpl(this._self, this._then);

  final _DownloadFileData _self;
  final $Res Function(_DownloadFileData) _then;

/// Create a copy of DownloadFileData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? md5 = freezed,Object? hash = freezed,Object? name = null,Object? size = null,Object? zipped = freezed,Object? s3Path = freezed,Object? infected = freezed,Object? mimetype = freezed,Object? shortName = freezed,Object? absolutePath = freezed,Object? opensubtitlesHash = freezed,}) {
  return _then(_DownloadFileData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,md5: freezed == md5 ? _self.md5 : md5 // ignore: cast_nullable_to_non_nullable
as String?,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,zipped: freezed == zipped ? _self.zipped : zipped // ignore: cast_nullable_to_non_nullable
as bool?,s3Path: freezed == s3Path ? _self.s3Path : s3Path // ignore: cast_nullable_to_non_nullable
as String?,infected: freezed == infected ? _self.infected : infected // ignore: cast_nullable_to_non_nullable
as bool?,mimetype: freezed == mimetype ? _self.mimetype : mimetype // ignore: cast_nullable_to_non_nullable
as String?,shortName: freezed == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String?,absolutePath: freezed == absolutePath ? _self.absolutePath : absolutePath // ignore: cast_nullable_to_non_nullable
as String?,opensubtitlesHash: freezed == opensubtitlesHash ? _self.opensubtitlesHash : opensubtitlesHash // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
