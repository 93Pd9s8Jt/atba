// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cached_availability_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CachedAvailabilityData {

 String get name; int get size; String get hash;/// Only present when the request used `list_files=true`.
 List<CachedFileData>? get files;
/// Create a copy of CachedAvailabilityData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CachedAvailabilityDataCopyWith<CachedAvailabilityData> get copyWith => _$CachedAvailabilityDataCopyWithImpl<CachedAvailabilityData>(this as CachedAvailabilityData, _$identity);

  /// Serializes this CachedAvailabilityData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CachedAvailabilityData&&(identical(other.name, name) || other.name == name)&&(identical(other.size, size) || other.size == size)&&(identical(other.hash, hash) || other.hash == hash)&&const DeepCollectionEquality().equals(other.files, files));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,size,hash,const DeepCollectionEquality().hash(files));

@override
String toString() {
  return 'CachedAvailabilityData(name: $name, size: $size, hash: $hash, files: $files)';
}


}

/// @nodoc
abstract mixin class $CachedAvailabilityDataCopyWith<$Res>  {
  factory $CachedAvailabilityDataCopyWith(CachedAvailabilityData value, $Res Function(CachedAvailabilityData) _then) = _$CachedAvailabilityDataCopyWithImpl;
@useResult
$Res call({
 String name, int size, String hash, List<CachedFileData>? files
});




}
/// @nodoc
class _$CachedAvailabilityDataCopyWithImpl<$Res>
    implements $CachedAvailabilityDataCopyWith<$Res> {
  _$CachedAvailabilityDataCopyWithImpl(this._self, this._then);

  final CachedAvailabilityData _self;
  final $Res Function(CachedAvailabilityData) _then;

/// Create a copy of CachedAvailabilityData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? size = null,Object? hash = null,Object? files = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,files: freezed == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<CachedFileData>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CachedAvailabilityData].
extension CachedAvailabilityDataPatterns on CachedAvailabilityData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CachedAvailabilityData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CachedAvailabilityData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CachedAvailabilityData value)  $default,){
final _that = this;
switch (_that) {
case _CachedAvailabilityData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CachedAvailabilityData value)?  $default,){
final _that = this;
switch (_that) {
case _CachedAvailabilityData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int size,  String hash,  List<CachedFileData>? files)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CachedAvailabilityData() when $default != null:
return $default(_that.name,_that.size,_that.hash,_that.files);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int size,  String hash,  List<CachedFileData>? files)  $default,) {final _that = this;
switch (_that) {
case _CachedAvailabilityData():
return $default(_that.name,_that.size,_that.hash,_that.files);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int size,  String hash,  List<CachedFileData>? files)?  $default,) {final _that = this;
switch (_that) {
case _CachedAvailabilityData() when $default != null:
return $default(_that.name,_that.size,_that.hash,_that.files);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CachedAvailabilityData implements CachedAvailabilityData {
  const _CachedAvailabilityData({required this.name, required this.size, required this.hash, final  List<CachedFileData>? files}): _files = files;
  factory _CachedAvailabilityData.fromJson(Map<String, dynamic> json) => _$CachedAvailabilityDataFromJson(json);

@override final  String name;
@override final  int size;
@override final  String hash;
/// Only present when the request used `list_files=true`.
 final  List<CachedFileData>? _files;
/// Only present when the request used `list_files=true`.
@override List<CachedFileData>? get files {
  final value = _files;
  if (value == null) return null;
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CachedAvailabilityData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CachedAvailabilityDataCopyWith<_CachedAvailabilityData> get copyWith => __$CachedAvailabilityDataCopyWithImpl<_CachedAvailabilityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CachedAvailabilityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CachedAvailabilityData&&(identical(other.name, name) || other.name == name)&&(identical(other.size, size) || other.size == size)&&(identical(other.hash, hash) || other.hash == hash)&&const DeepCollectionEquality().equals(other._files, _files));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,size,hash,const DeepCollectionEquality().hash(_files));

@override
String toString() {
  return 'CachedAvailabilityData(name: $name, size: $size, hash: $hash, files: $files)';
}


}

/// @nodoc
abstract mixin class _$CachedAvailabilityDataCopyWith<$Res> implements $CachedAvailabilityDataCopyWith<$Res> {
  factory _$CachedAvailabilityDataCopyWith(_CachedAvailabilityData value, $Res Function(_CachedAvailabilityData) _then) = __$CachedAvailabilityDataCopyWithImpl;
@override @useResult
$Res call({
 String name, int size, String hash, List<CachedFileData>? files
});




}
/// @nodoc
class __$CachedAvailabilityDataCopyWithImpl<$Res>
    implements _$CachedAvailabilityDataCopyWith<$Res> {
  __$CachedAvailabilityDataCopyWithImpl(this._self, this._then);

  final _CachedAvailabilityData _self;
  final $Res Function(_CachedAvailabilityData) _then;

/// Create a copy of CachedAvailabilityData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? size = null,Object? hash = null,Object? files = freezed,}) {
  return _then(_CachedAvailabilityData(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,files: freezed == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<CachedFileData>?,
  ));
}


}


/// @nodoc
mixin _$CachedFileData {

 int? get id; String get name; int get size; String? get opensubtitlesHash; String? get shortName; String? get mimetype;
/// Create a copy of CachedFileData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CachedFileDataCopyWith<CachedFileData> get copyWith => _$CachedFileDataCopyWithImpl<CachedFileData>(this as CachedFileData, _$identity);

  /// Serializes this CachedFileData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CachedFileData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.size, size) || other.size == size)&&(identical(other.opensubtitlesHash, opensubtitlesHash) || other.opensubtitlesHash == opensubtitlesHash)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.mimetype, mimetype) || other.mimetype == mimetype));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,size,opensubtitlesHash,shortName,mimetype);

@override
String toString() {
  return 'CachedFileData(id: $id, name: $name, size: $size, opensubtitlesHash: $opensubtitlesHash, shortName: $shortName, mimetype: $mimetype)';
}


}

/// @nodoc
abstract mixin class $CachedFileDataCopyWith<$Res>  {
  factory $CachedFileDataCopyWith(CachedFileData value, $Res Function(CachedFileData) _then) = _$CachedFileDataCopyWithImpl;
@useResult
$Res call({
 int? id, String name, int size, String? opensubtitlesHash, String? shortName, String? mimetype
});




}
/// @nodoc
class _$CachedFileDataCopyWithImpl<$Res>
    implements $CachedFileDataCopyWith<$Res> {
  _$CachedFileDataCopyWithImpl(this._self, this._then);

  final CachedFileData _self;
  final $Res Function(CachedFileData) _then;

/// Create a copy of CachedFileData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? size = null,Object? opensubtitlesHash = freezed,Object? shortName = freezed,Object? mimetype = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,opensubtitlesHash: freezed == opensubtitlesHash ? _self.opensubtitlesHash : opensubtitlesHash // ignore: cast_nullable_to_non_nullable
as String?,shortName: freezed == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String?,mimetype: freezed == mimetype ? _self.mimetype : mimetype // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CachedFileData].
extension CachedFileDataPatterns on CachedFileData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CachedFileData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CachedFileData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CachedFileData value)  $default,){
final _that = this;
switch (_that) {
case _CachedFileData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CachedFileData value)?  $default,){
final _that = this;
switch (_that) {
case _CachedFileData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String name,  int size,  String? opensubtitlesHash,  String? shortName,  String? mimetype)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CachedFileData() when $default != null:
return $default(_that.id,_that.name,_that.size,_that.opensubtitlesHash,_that.shortName,_that.mimetype);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String name,  int size,  String? opensubtitlesHash,  String? shortName,  String? mimetype)  $default,) {final _that = this;
switch (_that) {
case _CachedFileData():
return $default(_that.id,_that.name,_that.size,_that.opensubtitlesHash,_that.shortName,_that.mimetype);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String name,  int size,  String? opensubtitlesHash,  String? shortName,  String? mimetype)?  $default,) {final _that = this;
switch (_that) {
case _CachedFileData() when $default != null:
return $default(_that.id,_that.name,_that.size,_that.opensubtitlesHash,_that.shortName,_that.mimetype);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CachedFileData implements CachedFileData {
  const _CachedFileData({this.id, required this.name, required this.size, this.opensubtitlesHash, this.shortName, this.mimetype});
  factory _CachedFileData.fromJson(Map<String, dynamic> json) => _$CachedFileDataFromJson(json);

@override final  int? id;
@override final  String name;
@override final  int size;
@override final  String? opensubtitlesHash;
@override final  String? shortName;
@override final  String? mimetype;

/// Create a copy of CachedFileData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CachedFileDataCopyWith<_CachedFileData> get copyWith => __$CachedFileDataCopyWithImpl<_CachedFileData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CachedFileDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CachedFileData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.size, size) || other.size == size)&&(identical(other.opensubtitlesHash, opensubtitlesHash) || other.opensubtitlesHash == opensubtitlesHash)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.mimetype, mimetype) || other.mimetype == mimetype));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,size,opensubtitlesHash,shortName,mimetype);

@override
String toString() {
  return 'CachedFileData(id: $id, name: $name, size: $size, opensubtitlesHash: $opensubtitlesHash, shortName: $shortName, mimetype: $mimetype)';
}


}

/// @nodoc
abstract mixin class _$CachedFileDataCopyWith<$Res> implements $CachedFileDataCopyWith<$Res> {
  factory _$CachedFileDataCopyWith(_CachedFileData value, $Res Function(_CachedFileData) _then) = __$CachedFileDataCopyWithImpl;
@override @useResult
$Res call({
 int? id, String name, int size, String? opensubtitlesHash, String? shortName, String? mimetype
});




}
/// @nodoc
class __$CachedFileDataCopyWithImpl<$Res>
    implements _$CachedFileDataCopyWith<$Res> {
  __$CachedFileDataCopyWithImpl(this._self, this._then);

  final _CachedFileData _self;
  final $Res Function(_CachedFileData) _then;

/// Create a copy of CachedFileData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? size = null,Object? opensubtitlesHash = freezed,Object? shortName = freezed,Object? mimetype = freezed,}) {
  return _then(_CachedFileData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,opensubtitlesHash: freezed == opensubtitlesHash ? _self.opensubtitlesHash : opensubtitlesHash // ignore: cast_nullable_to_non_nullable
as String?,shortName: freezed == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String?,mimetype: freezed == mimetype ? _self.mimetype : mimetype // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
