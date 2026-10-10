// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'torrent_info_file_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TorrentInfoFileData {

 String get name; int get size;
/// Create a copy of TorrentInfoFileData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TorrentInfoFileDataCopyWith<TorrentInfoFileData> get copyWith => _$TorrentInfoFileDataCopyWithImpl<TorrentInfoFileData>(this as TorrentInfoFileData, _$identity);

  /// Serializes this TorrentInfoFileData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TorrentInfoFileData&&(identical(other.name, name) || other.name == name)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,size);

@override
String toString() {
  return 'TorrentInfoFileData(name: $name, size: $size)';
}


}

/// @nodoc
abstract mixin class $TorrentInfoFileDataCopyWith<$Res>  {
  factory $TorrentInfoFileDataCopyWith(TorrentInfoFileData value, $Res Function(TorrentInfoFileData) _then) = _$TorrentInfoFileDataCopyWithImpl;
@useResult
$Res call({
 String name, int size
});




}
/// @nodoc
class _$TorrentInfoFileDataCopyWithImpl<$Res>
    implements $TorrentInfoFileDataCopyWith<$Res> {
  _$TorrentInfoFileDataCopyWithImpl(this._self, this._then);

  final TorrentInfoFileData _self;
  final $Res Function(TorrentInfoFileData) _then;

/// Create a copy of TorrentInfoFileData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? size = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TorrentInfoFileData].
extension TorrentInfoFileDataPatterns on TorrentInfoFileData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TorrentInfoFileData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TorrentInfoFileData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TorrentInfoFileData value)  $default,){
final _that = this;
switch (_that) {
case _TorrentInfoFileData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TorrentInfoFileData value)?  $default,){
final _that = this;
switch (_that) {
case _TorrentInfoFileData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TorrentInfoFileData() when $default != null:
return $default(_that.name,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int size)  $default,) {final _that = this;
switch (_that) {
case _TorrentInfoFileData():
return $default(_that.name,_that.size);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int size)?  $default,) {final _that = this;
switch (_that) {
case _TorrentInfoFileData() when $default != null:
return $default(_that.name,_that.size);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TorrentInfoFileData implements TorrentInfoFileData {
  const _TorrentInfoFileData({required this.name, required this.size});
  factory _TorrentInfoFileData.fromJson(Map<String, dynamic> json) => _$TorrentInfoFileDataFromJson(json);

@override final  String name;
@override final  int size;

/// Create a copy of TorrentInfoFileData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TorrentInfoFileDataCopyWith<_TorrentInfoFileData> get copyWith => __$TorrentInfoFileDataCopyWithImpl<_TorrentInfoFileData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TorrentInfoFileDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TorrentInfoFileData&&(identical(other.name, name) || other.name == name)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,size);

@override
String toString() {
  return 'TorrentInfoFileData(name: $name, size: $size)';
}


}

/// @nodoc
abstract mixin class _$TorrentInfoFileDataCopyWith<$Res> implements $TorrentInfoFileDataCopyWith<$Res> {
  factory _$TorrentInfoFileDataCopyWith(_TorrentInfoFileData value, $Res Function(_TorrentInfoFileData) _then) = __$TorrentInfoFileDataCopyWithImpl;
@override @useResult
$Res call({
 String name, int size
});




}
/// @nodoc
class __$TorrentInfoFileDataCopyWithImpl<$Res>
    implements _$TorrentInfoFileDataCopyWith<$Res> {
  __$TorrentInfoFileDataCopyWithImpl(this._self, this._then);

  final _TorrentInfoFileData _self;
  final $Res Function(_TorrentInfoFileData) _then;

/// Create a copy of TorrentInfoFileData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? size = null,}) {
  return _then(_TorrentInfoFileData(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
