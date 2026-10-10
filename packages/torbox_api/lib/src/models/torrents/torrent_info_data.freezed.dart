// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'torrent_info_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TorrentInfoData {

 String? get name; String get hash; int? get size; List<String>? get trackers; int? get seeds; int? get peers; List<TorrentInfoFileData>? get files;
/// Create a copy of TorrentInfoData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TorrentInfoDataCopyWith<TorrentInfoData> get copyWith => _$TorrentInfoDataCopyWithImpl<TorrentInfoData>(this as TorrentInfoData, _$identity);

  /// Serializes this TorrentInfoData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TorrentInfoData&&(identical(other.name, name) || other.name == name)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other.trackers, trackers)&&(identical(other.seeds, seeds) || other.seeds == seeds)&&(identical(other.peers, peers) || other.peers == peers)&&const DeepCollectionEquality().equals(other.files, files));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,hash,size,const DeepCollectionEquality().hash(trackers),seeds,peers,const DeepCollectionEquality().hash(files));

@override
String toString() {
  return 'TorrentInfoData(name: $name, hash: $hash, size: $size, trackers: $trackers, seeds: $seeds, peers: $peers, files: $files)';
}


}

/// @nodoc
abstract mixin class $TorrentInfoDataCopyWith<$Res>  {
  factory $TorrentInfoDataCopyWith(TorrentInfoData value, $Res Function(TorrentInfoData) _then) = _$TorrentInfoDataCopyWithImpl;
@useResult
$Res call({
 String? name, String hash, int? size, List<String>? trackers, int? seeds, int? peers, List<TorrentInfoFileData>? files
});




}
/// @nodoc
class _$TorrentInfoDataCopyWithImpl<$Res>
    implements $TorrentInfoDataCopyWith<$Res> {
  _$TorrentInfoDataCopyWithImpl(this._self, this._then);

  final TorrentInfoData _self;
  final $Res Function(TorrentInfoData) _then;

/// Create a copy of TorrentInfoData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? hash = null,Object? size = freezed,Object? trackers = freezed,Object? seeds = freezed,Object? peers = freezed,Object? files = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,trackers: freezed == trackers ? _self.trackers : trackers // ignore: cast_nullable_to_non_nullable
as List<String>?,seeds: freezed == seeds ? _self.seeds : seeds // ignore: cast_nullable_to_non_nullable
as int?,peers: freezed == peers ? _self.peers : peers // ignore: cast_nullable_to_non_nullable
as int?,files: freezed == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<TorrentInfoFileData>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TorrentInfoData].
extension TorrentInfoDataPatterns on TorrentInfoData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TorrentInfoData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TorrentInfoData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TorrentInfoData value)  $default,){
final _that = this;
switch (_that) {
case _TorrentInfoData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TorrentInfoData value)?  $default,){
final _that = this;
switch (_that) {
case _TorrentInfoData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String hash,  int? size,  List<String>? trackers,  int? seeds,  int? peers,  List<TorrentInfoFileData>? files)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TorrentInfoData() when $default != null:
return $default(_that.name,_that.hash,_that.size,_that.trackers,_that.seeds,_that.peers,_that.files);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String hash,  int? size,  List<String>? trackers,  int? seeds,  int? peers,  List<TorrentInfoFileData>? files)  $default,) {final _that = this;
switch (_that) {
case _TorrentInfoData():
return $default(_that.name,_that.hash,_that.size,_that.trackers,_that.seeds,_that.peers,_that.files);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String hash,  int? size,  List<String>? trackers,  int? seeds,  int? peers,  List<TorrentInfoFileData>? files)?  $default,) {final _that = this;
switch (_that) {
case _TorrentInfoData() when $default != null:
return $default(_that.name,_that.hash,_that.size,_that.trackers,_that.seeds,_that.peers,_that.files);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TorrentInfoData implements TorrentInfoData {
  const _TorrentInfoData({this.name, required this.hash, this.size, final  List<String>? trackers, this.seeds, this.peers, final  List<TorrentInfoFileData>? files}): _trackers = trackers,_files = files;
  factory _TorrentInfoData.fromJson(Map<String, dynamic> json) => _$TorrentInfoDataFromJson(json);

@override final  String? name;
@override final  String hash;
@override final  int? size;
 final  List<String>? _trackers;
@override List<String>? get trackers {
  final value = _trackers;
  if (value == null) return null;
  if (_trackers is EqualUnmodifiableListView) return _trackers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? seeds;
@override final  int? peers;
 final  List<TorrentInfoFileData>? _files;
@override List<TorrentInfoFileData>? get files {
  final value = _files;
  if (value == null) return null;
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TorrentInfoData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TorrentInfoDataCopyWith<_TorrentInfoData> get copyWith => __$TorrentInfoDataCopyWithImpl<_TorrentInfoData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TorrentInfoDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TorrentInfoData&&(identical(other.name, name) || other.name == name)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other._trackers, _trackers)&&(identical(other.seeds, seeds) || other.seeds == seeds)&&(identical(other.peers, peers) || other.peers == peers)&&const DeepCollectionEquality().equals(other._files, _files));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,hash,size,const DeepCollectionEquality().hash(_trackers),seeds,peers,const DeepCollectionEquality().hash(_files));

@override
String toString() {
  return 'TorrentInfoData(name: $name, hash: $hash, size: $size, trackers: $trackers, seeds: $seeds, peers: $peers, files: $files)';
}


}

/// @nodoc
abstract mixin class _$TorrentInfoDataCopyWith<$Res> implements $TorrentInfoDataCopyWith<$Res> {
  factory _$TorrentInfoDataCopyWith(_TorrentInfoData value, $Res Function(_TorrentInfoData) _then) = __$TorrentInfoDataCopyWithImpl;
@override @useResult
$Res call({
 String? name, String hash, int? size, List<String>? trackers, int? seeds, int? peers, List<TorrentInfoFileData>? files
});




}
/// @nodoc
class __$TorrentInfoDataCopyWithImpl<$Res>
    implements _$TorrentInfoDataCopyWith<$Res> {
  __$TorrentInfoDataCopyWithImpl(this._self, this._then);

  final _TorrentInfoData _self;
  final $Res Function(_TorrentInfoData) _then;

/// Create a copy of TorrentInfoData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? hash = null,Object? size = freezed,Object? trackers = freezed,Object? seeds = freezed,Object? peers = freezed,Object? files = freezed,}) {
  return _then(_TorrentInfoData(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,trackers: freezed == trackers ? _self._trackers : trackers // ignore: cast_nullable_to_non_nullable
as List<String>?,seeds: freezed == seeds ? _self.seeds : seeds // ignore: cast_nullable_to_non_nullable
as int?,peers: freezed == peers ? _self.peers : peers // ignore: cast_nullable_to_non_nullable
as int?,files: freezed == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<TorrentInfoFileData>?,
  ));
}


}

// dart format on
