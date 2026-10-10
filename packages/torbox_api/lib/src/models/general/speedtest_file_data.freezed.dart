// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speedtest_file_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpeedtestFileData {

 String get region; String get name; String get domain; String get path; String get url; bool get closest; SpeedtestCoordinates get coordinates;
/// Create a copy of SpeedtestFileData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeedtestFileDataCopyWith<SpeedtestFileData> get copyWith => _$SpeedtestFileDataCopyWithImpl<SpeedtestFileData>(this as SpeedtestFileData, _$identity);

  /// Serializes this SpeedtestFileData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeedtestFileData&&(identical(other.region, region) || other.region == region)&&(identical(other.name, name) || other.name == name)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.path, path) || other.path == path)&&(identical(other.url, url) || other.url == url)&&(identical(other.closest, closest) || other.closest == closest)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,region,name,domain,path,url,closest,coordinates);

@override
String toString() {
  return 'SpeedtestFileData(region: $region, name: $name, domain: $domain, path: $path, url: $url, closest: $closest, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class $SpeedtestFileDataCopyWith<$Res>  {
  factory $SpeedtestFileDataCopyWith(SpeedtestFileData value, $Res Function(SpeedtestFileData) _then) = _$SpeedtestFileDataCopyWithImpl;
@useResult
$Res call({
 String region, String name, String domain, String path, String url, bool closest, SpeedtestCoordinates coordinates
});


$SpeedtestCoordinatesCopyWith<$Res> get coordinates;

}
/// @nodoc
class _$SpeedtestFileDataCopyWithImpl<$Res>
    implements $SpeedtestFileDataCopyWith<$Res> {
  _$SpeedtestFileDataCopyWithImpl(this._self, this._then);

  final SpeedtestFileData _self;
  final $Res Function(SpeedtestFileData) _then;

/// Create a copy of SpeedtestFileData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? region = null,Object? name = null,Object? domain = null,Object? path = null,Object? url = null,Object? closest = null,Object? coordinates = null,}) {
  return _then(_self.copyWith(
region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,closest: null == closest ? _self.closest : closest // ignore: cast_nullable_to_non_nullable
as bool,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as SpeedtestCoordinates,
  ));
}
/// Create a copy of SpeedtestFileData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpeedtestCoordinatesCopyWith<$Res> get coordinates {
  
  return $SpeedtestCoordinatesCopyWith<$Res>(_self.coordinates, (value) {
    return _then(_self.copyWith(coordinates: value));
  });
}
}


/// Adds pattern-matching-related methods to [SpeedtestFileData].
extension SpeedtestFileDataPatterns on SpeedtestFileData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpeedtestFileData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpeedtestFileData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpeedtestFileData value)  $default,){
final _that = this;
switch (_that) {
case _SpeedtestFileData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpeedtestFileData value)?  $default,){
final _that = this;
switch (_that) {
case _SpeedtestFileData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String region,  String name,  String domain,  String path,  String url,  bool closest,  SpeedtestCoordinates coordinates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpeedtestFileData() when $default != null:
return $default(_that.region,_that.name,_that.domain,_that.path,_that.url,_that.closest,_that.coordinates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String region,  String name,  String domain,  String path,  String url,  bool closest,  SpeedtestCoordinates coordinates)  $default,) {final _that = this;
switch (_that) {
case _SpeedtestFileData():
return $default(_that.region,_that.name,_that.domain,_that.path,_that.url,_that.closest,_that.coordinates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String region,  String name,  String domain,  String path,  String url,  bool closest,  SpeedtestCoordinates coordinates)?  $default,) {final _that = this;
switch (_that) {
case _SpeedtestFileData() when $default != null:
return $default(_that.region,_that.name,_that.domain,_that.path,_that.url,_that.closest,_that.coordinates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpeedtestFileData implements SpeedtestFileData {
  const _SpeedtestFileData({required this.region, required this.name, required this.domain, required this.path, required this.url, required this.closest, required this.coordinates});
  factory _SpeedtestFileData.fromJson(Map<String, dynamic> json) => _$SpeedtestFileDataFromJson(json);

@override final  String region;
@override final  String name;
@override final  String domain;
@override final  String path;
@override final  String url;
@override final  bool closest;
@override final  SpeedtestCoordinates coordinates;

/// Create a copy of SpeedtestFileData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeedtestFileDataCopyWith<_SpeedtestFileData> get copyWith => __$SpeedtestFileDataCopyWithImpl<_SpeedtestFileData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpeedtestFileDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpeedtestFileData&&(identical(other.region, region) || other.region == region)&&(identical(other.name, name) || other.name == name)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.path, path) || other.path == path)&&(identical(other.url, url) || other.url == url)&&(identical(other.closest, closest) || other.closest == closest)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,region,name,domain,path,url,closest,coordinates);

@override
String toString() {
  return 'SpeedtestFileData(region: $region, name: $name, domain: $domain, path: $path, url: $url, closest: $closest, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class _$SpeedtestFileDataCopyWith<$Res> implements $SpeedtestFileDataCopyWith<$Res> {
  factory _$SpeedtestFileDataCopyWith(_SpeedtestFileData value, $Res Function(_SpeedtestFileData) _then) = __$SpeedtestFileDataCopyWithImpl;
@override @useResult
$Res call({
 String region, String name, String domain, String path, String url, bool closest, SpeedtestCoordinates coordinates
});


@override $SpeedtestCoordinatesCopyWith<$Res> get coordinates;

}
/// @nodoc
class __$SpeedtestFileDataCopyWithImpl<$Res>
    implements _$SpeedtestFileDataCopyWith<$Res> {
  __$SpeedtestFileDataCopyWithImpl(this._self, this._then);

  final _SpeedtestFileData _self;
  final $Res Function(_SpeedtestFileData) _then;

/// Create a copy of SpeedtestFileData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? region = null,Object? name = null,Object? domain = null,Object? path = null,Object? url = null,Object? closest = null,Object? coordinates = null,}) {
  return _then(_SpeedtestFileData(
region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,closest: null == closest ? _self.closest : closest // ignore: cast_nullable_to_non_nullable
as bool,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as SpeedtestCoordinates,
  ));
}

/// Create a copy of SpeedtestFileData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpeedtestCoordinatesCopyWith<$Res> get coordinates {
  
  return $SpeedtestCoordinatesCopyWith<$Res>(_self.coordinates, (value) {
    return _then(_self.copyWith(coordinates: value));
  });
}
}


/// @nodoc
mixin _$SpeedtestCoordinates {

 double get lat; double get lng;
/// Create a copy of SpeedtestCoordinates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeedtestCoordinatesCopyWith<SpeedtestCoordinates> get copyWith => _$SpeedtestCoordinatesCopyWithImpl<SpeedtestCoordinates>(this as SpeedtestCoordinates, _$identity);

  /// Serializes this SpeedtestCoordinates to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeedtestCoordinates&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng);

@override
String toString() {
  return 'SpeedtestCoordinates(lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $SpeedtestCoordinatesCopyWith<$Res>  {
  factory $SpeedtestCoordinatesCopyWith(SpeedtestCoordinates value, $Res Function(SpeedtestCoordinates) _then) = _$SpeedtestCoordinatesCopyWithImpl;
@useResult
$Res call({
 double lat, double lng
});




}
/// @nodoc
class _$SpeedtestCoordinatesCopyWithImpl<$Res>
    implements $SpeedtestCoordinatesCopyWith<$Res> {
  _$SpeedtestCoordinatesCopyWithImpl(this._self, this._then);

  final SpeedtestCoordinates _self;
  final $Res Function(SpeedtestCoordinates) _then;

/// Create a copy of SpeedtestCoordinates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = null,Object? lng = null,}) {
  return _then(_self.copyWith(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SpeedtestCoordinates].
extension SpeedtestCoordinatesPatterns on SpeedtestCoordinates {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpeedtestCoordinates value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpeedtestCoordinates() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpeedtestCoordinates value)  $default,){
final _that = this;
switch (_that) {
case _SpeedtestCoordinates():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpeedtestCoordinates value)?  $default,){
final _that = this;
switch (_that) {
case _SpeedtestCoordinates() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double lat,  double lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpeedtestCoordinates() when $default != null:
return $default(_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double lat,  double lng)  $default,) {final _that = this;
switch (_that) {
case _SpeedtestCoordinates():
return $default(_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double lat,  double lng)?  $default,) {final _that = this;
switch (_that) {
case _SpeedtestCoordinates() when $default != null:
return $default(_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpeedtestCoordinates implements SpeedtestCoordinates {
  const _SpeedtestCoordinates({required this.lat, required this.lng});
  factory _SpeedtestCoordinates.fromJson(Map<String, dynamic> json) => _$SpeedtestCoordinatesFromJson(json);

@override final  double lat;
@override final  double lng;

/// Create a copy of SpeedtestCoordinates
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeedtestCoordinatesCopyWith<_SpeedtestCoordinates> get copyWith => __$SpeedtestCoordinatesCopyWithImpl<_SpeedtestCoordinates>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpeedtestCoordinatesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpeedtestCoordinates&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng);

@override
String toString() {
  return 'SpeedtestCoordinates(lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$SpeedtestCoordinatesCopyWith<$Res> implements $SpeedtestCoordinatesCopyWith<$Res> {
  factory _$SpeedtestCoordinatesCopyWith(_SpeedtestCoordinates value, $Res Function(_SpeedtestCoordinates) _then) = __$SpeedtestCoordinatesCopyWithImpl;
@override @useResult
$Res call({
 double lat, double lng
});




}
/// @nodoc
class __$SpeedtestCoordinatesCopyWithImpl<$Res>
    implements _$SpeedtestCoordinatesCopyWith<$Res> {
  __$SpeedtestCoordinatesCopyWithImpl(this._self, this._then);

  final _SpeedtestCoordinates _self;
  final $Res Function(_SpeedtestCoordinates) _then;

/// Create a copy of SpeedtestCoordinates
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? lng = null,}) {
  return _then(_SpeedtestCoordinates(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
