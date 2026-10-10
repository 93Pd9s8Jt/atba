// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_stats_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserStatsData {

/// Present when the request used `general=true`.
 UserGeneralStats? get general;/// Present when the request used `bandwidth=true`.
 List<UserBandwidthPoint>? get bandwidth;
/// Create a copy of UserStatsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserStatsDataCopyWith<UserStatsData> get copyWith => _$UserStatsDataCopyWithImpl<UserStatsData>(this as UserStatsData, _$identity);

  /// Serializes this UserStatsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserStatsData&&(identical(other.general, general) || other.general == general)&&const DeepCollectionEquality().equals(other.bandwidth, bandwidth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,general,const DeepCollectionEquality().hash(bandwidth));

@override
String toString() {
  return 'UserStatsData(general: $general, bandwidth: $bandwidth)';
}


}

/// @nodoc
abstract mixin class $UserStatsDataCopyWith<$Res>  {
  factory $UserStatsDataCopyWith(UserStatsData value, $Res Function(UserStatsData) _then) = _$UserStatsDataCopyWithImpl;
@useResult
$Res call({
 UserGeneralStats? general, List<UserBandwidthPoint>? bandwidth
});


$UserGeneralStatsCopyWith<$Res>? get general;

}
/// @nodoc
class _$UserStatsDataCopyWithImpl<$Res>
    implements $UserStatsDataCopyWith<$Res> {
  _$UserStatsDataCopyWithImpl(this._self, this._then);

  final UserStatsData _self;
  final $Res Function(UserStatsData) _then;

/// Create a copy of UserStatsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? general = freezed,Object? bandwidth = freezed,}) {
  return _then(_self.copyWith(
general: freezed == general ? _self.general : general // ignore: cast_nullable_to_non_nullable
as UserGeneralStats?,bandwidth: freezed == bandwidth ? _self.bandwidth : bandwidth // ignore: cast_nullable_to_non_nullable
as List<UserBandwidthPoint>?,
  ));
}
/// Create a copy of UserStatsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserGeneralStatsCopyWith<$Res>? get general {
    if (_self.general == null) {
    return null;
  }

  return $UserGeneralStatsCopyWith<$Res>(_self.general!, (value) {
    return _then(_self.copyWith(general: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserStatsData].
extension UserStatsDataPatterns on UserStatsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserStatsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserStatsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserStatsData value)  $default,){
final _that = this;
switch (_that) {
case _UserStatsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserStatsData value)?  $default,){
final _that = this;
switch (_that) {
case _UserStatsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserGeneralStats? general,  List<UserBandwidthPoint>? bandwidth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserStatsData() when $default != null:
return $default(_that.general,_that.bandwidth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserGeneralStats? general,  List<UserBandwidthPoint>? bandwidth)  $default,) {final _that = this;
switch (_that) {
case _UserStatsData():
return $default(_that.general,_that.bandwidth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserGeneralStats? general,  List<UserBandwidthPoint>? bandwidth)?  $default,) {final _that = this;
switch (_that) {
case _UserStatsData() when $default != null:
return $default(_that.general,_that.bandwidth);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserStatsData implements UserStatsData {
  const _UserStatsData({this.general, final  List<UserBandwidthPoint>? bandwidth}): _bandwidth = bandwidth;
  factory _UserStatsData.fromJson(Map<String, dynamic> json) => _$UserStatsDataFromJson(json);

/// Present when the request used `general=true`.
@override final  UserGeneralStats? general;
/// Present when the request used `bandwidth=true`.
 final  List<UserBandwidthPoint>? _bandwidth;
/// Present when the request used `bandwidth=true`.
@override List<UserBandwidthPoint>? get bandwidth {
  final value = _bandwidth;
  if (value == null) return null;
  if (_bandwidth is EqualUnmodifiableListView) return _bandwidth;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UserStatsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserStatsDataCopyWith<_UserStatsData> get copyWith => __$UserStatsDataCopyWithImpl<_UserStatsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserStatsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserStatsData&&(identical(other.general, general) || other.general == general)&&const DeepCollectionEquality().equals(other._bandwidth, _bandwidth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,general,const DeepCollectionEquality().hash(_bandwidth));

@override
String toString() {
  return 'UserStatsData(general: $general, bandwidth: $bandwidth)';
}


}

/// @nodoc
abstract mixin class _$UserStatsDataCopyWith<$Res> implements $UserStatsDataCopyWith<$Res> {
  factory _$UserStatsDataCopyWith(_UserStatsData value, $Res Function(_UserStatsData) _then) = __$UserStatsDataCopyWithImpl;
@override @useResult
$Res call({
 UserGeneralStats? general, List<UserBandwidthPoint>? bandwidth
});


@override $UserGeneralStatsCopyWith<$Res>? get general;

}
/// @nodoc
class __$UserStatsDataCopyWithImpl<$Res>
    implements _$UserStatsDataCopyWith<$Res> {
  __$UserStatsDataCopyWithImpl(this._self, this._then);

  final _UserStatsData _self;
  final $Res Function(_UserStatsData) _then;

/// Create a copy of UserStatsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? general = freezed,Object? bandwidth = freezed,}) {
  return _then(_UserStatsData(
general: freezed == general ? _self.general : general // ignore: cast_nullable_to_non_nullable
as UserGeneralStats?,bandwidth: freezed == bandwidth ? _self._bandwidth : bandwidth // ignore: cast_nullable_to_non_nullable
as List<UserBandwidthPoint>?,
  ));
}

/// Create a copy of UserStatsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserGeneralStatsCopyWith<$Res>? get general {
    if (_self.general == null) {
    return null;
  }

  return $UserGeneralStatsCopyWith<$Res>(_self.general!, (value) {
    return _then(_self.copyWith(general: value));
  });
}
}


/// @nodoc
mixin _$UserGeneralStats {

 int get totalDownloaded; int get totalUploaded; double get ratio; int get totalItemsDownloaded;
/// Create a copy of UserGeneralStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserGeneralStatsCopyWith<UserGeneralStats> get copyWith => _$UserGeneralStatsCopyWithImpl<UserGeneralStats>(this as UserGeneralStats, _$identity);

  /// Serializes this UserGeneralStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserGeneralStats&&(identical(other.totalDownloaded, totalDownloaded) || other.totalDownloaded == totalDownloaded)&&(identical(other.totalUploaded, totalUploaded) || other.totalUploaded == totalUploaded)&&(identical(other.ratio, ratio) || other.ratio == ratio)&&(identical(other.totalItemsDownloaded, totalItemsDownloaded) || other.totalItemsDownloaded == totalItemsDownloaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalDownloaded,totalUploaded,ratio,totalItemsDownloaded);

@override
String toString() {
  return 'UserGeneralStats(totalDownloaded: $totalDownloaded, totalUploaded: $totalUploaded, ratio: $ratio, totalItemsDownloaded: $totalItemsDownloaded)';
}


}

/// @nodoc
abstract mixin class $UserGeneralStatsCopyWith<$Res>  {
  factory $UserGeneralStatsCopyWith(UserGeneralStats value, $Res Function(UserGeneralStats) _then) = _$UserGeneralStatsCopyWithImpl;
@useResult
$Res call({
 int totalDownloaded, int totalUploaded, double ratio, int totalItemsDownloaded
});




}
/// @nodoc
class _$UserGeneralStatsCopyWithImpl<$Res>
    implements $UserGeneralStatsCopyWith<$Res> {
  _$UserGeneralStatsCopyWithImpl(this._self, this._then);

  final UserGeneralStats _self;
  final $Res Function(UserGeneralStats) _then;

/// Create a copy of UserGeneralStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalDownloaded = null,Object? totalUploaded = null,Object? ratio = null,Object? totalItemsDownloaded = null,}) {
  return _then(_self.copyWith(
totalDownloaded: null == totalDownloaded ? _self.totalDownloaded : totalDownloaded // ignore: cast_nullable_to_non_nullable
as int,totalUploaded: null == totalUploaded ? _self.totalUploaded : totalUploaded // ignore: cast_nullable_to_non_nullable
as int,ratio: null == ratio ? _self.ratio : ratio // ignore: cast_nullable_to_non_nullable
as double,totalItemsDownloaded: null == totalItemsDownloaded ? _self.totalItemsDownloaded : totalItemsDownloaded // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserGeneralStats].
extension UserGeneralStatsPatterns on UserGeneralStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserGeneralStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserGeneralStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserGeneralStats value)  $default,){
final _that = this;
switch (_that) {
case _UserGeneralStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserGeneralStats value)?  $default,){
final _that = this;
switch (_that) {
case _UserGeneralStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalDownloaded,  int totalUploaded,  double ratio,  int totalItemsDownloaded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserGeneralStats() when $default != null:
return $default(_that.totalDownloaded,_that.totalUploaded,_that.ratio,_that.totalItemsDownloaded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalDownloaded,  int totalUploaded,  double ratio,  int totalItemsDownloaded)  $default,) {final _that = this;
switch (_that) {
case _UserGeneralStats():
return $default(_that.totalDownloaded,_that.totalUploaded,_that.ratio,_that.totalItemsDownloaded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalDownloaded,  int totalUploaded,  double ratio,  int totalItemsDownloaded)?  $default,) {final _that = this;
switch (_that) {
case _UserGeneralStats() when $default != null:
return $default(_that.totalDownloaded,_that.totalUploaded,_that.ratio,_that.totalItemsDownloaded);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserGeneralStats implements UserGeneralStats {
  const _UserGeneralStats({required this.totalDownloaded, required this.totalUploaded, required this.ratio, required this.totalItemsDownloaded});
  factory _UserGeneralStats.fromJson(Map<String, dynamic> json) => _$UserGeneralStatsFromJson(json);

@override final  int totalDownloaded;
@override final  int totalUploaded;
@override final  double ratio;
@override final  int totalItemsDownloaded;

/// Create a copy of UserGeneralStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserGeneralStatsCopyWith<_UserGeneralStats> get copyWith => __$UserGeneralStatsCopyWithImpl<_UserGeneralStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserGeneralStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserGeneralStats&&(identical(other.totalDownloaded, totalDownloaded) || other.totalDownloaded == totalDownloaded)&&(identical(other.totalUploaded, totalUploaded) || other.totalUploaded == totalUploaded)&&(identical(other.ratio, ratio) || other.ratio == ratio)&&(identical(other.totalItemsDownloaded, totalItemsDownloaded) || other.totalItemsDownloaded == totalItemsDownloaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalDownloaded,totalUploaded,ratio,totalItemsDownloaded);

@override
String toString() {
  return 'UserGeneralStats(totalDownloaded: $totalDownloaded, totalUploaded: $totalUploaded, ratio: $ratio, totalItemsDownloaded: $totalItemsDownloaded)';
}


}

/// @nodoc
abstract mixin class _$UserGeneralStatsCopyWith<$Res> implements $UserGeneralStatsCopyWith<$Res> {
  factory _$UserGeneralStatsCopyWith(_UserGeneralStats value, $Res Function(_UserGeneralStats) _then) = __$UserGeneralStatsCopyWithImpl;
@override @useResult
$Res call({
 int totalDownloaded, int totalUploaded, double ratio, int totalItemsDownloaded
});




}
/// @nodoc
class __$UserGeneralStatsCopyWithImpl<$Res>
    implements _$UserGeneralStatsCopyWith<$Res> {
  __$UserGeneralStatsCopyWithImpl(this._self, this._then);

  final _UserGeneralStats _self;
  final $Res Function(_UserGeneralStats) _then;

/// Create a copy of UserGeneralStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalDownloaded = null,Object? totalUploaded = null,Object? ratio = null,Object? totalItemsDownloaded = null,}) {
  return _then(_UserGeneralStats(
totalDownloaded: null == totalDownloaded ? _self.totalDownloaded : totalDownloaded // ignore: cast_nullable_to_non_nullable
as int,totalUploaded: null == totalUploaded ? _self.totalUploaded : totalUploaded // ignore: cast_nullable_to_non_nullable
as int,ratio: null == ratio ? _self.ratio : ratio // ignore: cast_nullable_to_non_nullable
as double,totalItemsDownloaded: null == totalItemsDownloaded ? _self.totalItemsDownloaded : totalItemsDownloaded // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$UserBandwidthPoint {

 String get date; int get bytesDownloaded;
/// Create a copy of UserBandwidthPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserBandwidthPointCopyWith<UserBandwidthPoint> get copyWith => _$UserBandwidthPointCopyWithImpl<UserBandwidthPoint>(this as UserBandwidthPoint, _$identity);

  /// Serializes this UserBandwidthPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserBandwidthPoint&&(identical(other.date, date) || other.date == date)&&(identical(other.bytesDownloaded, bytesDownloaded) || other.bytesDownloaded == bytesDownloaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,bytesDownloaded);

@override
String toString() {
  return 'UserBandwidthPoint(date: $date, bytesDownloaded: $bytesDownloaded)';
}


}

/// @nodoc
abstract mixin class $UserBandwidthPointCopyWith<$Res>  {
  factory $UserBandwidthPointCopyWith(UserBandwidthPoint value, $Res Function(UserBandwidthPoint) _then) = _$UserBandwidthPointCopyWithImpl;
@useResult
$Res call({
 String date, int bytesDownloaded
});




}
/// @nodoc
class _$UserBandwidthPointCopyWithImpl<$Res>
    implements $UserBandwidthPointCopyWith<$Res> {
  _$UserBandwidthPointCopyWithImpl(this._self, this._then);

  final UserBandwidthPoint _self;
  final $Res Function(UserBandwidthPoint) _then;

/// Create a copy of UserBandwidthPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? bytesDownloaded = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,bytesDownloaded: null == bytesDownloaded ? _self.bytesDownloaded : bytesDownloaded // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserBandwidthPoint].
extension UserBandwidthPointPatterns on UserBandwidthPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserBandwidthPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserBandwidthPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserBandwidthPoint value)  $default,){
final _that = this;
switch (_that) {
case _UserBandwidthPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserBandwidthPoint value)?  $default,){
final _that = this;
switch (_that) {
case _UserBandwidthPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  int bytesDownloaded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserBandwidthPoint() when $default != null:
return $default(_that.date,_that.bytesDownloaded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  int bytesDownloaded)  $default,) {final _that = this;
switch (_that) {
case _UserBandwidthPoint():
return $default(_that.date,_that.bytesDownloaded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  int bytesDownloaded)?  $default,) {final _that = this;
switch (_that) {
case _UserBandwidthPoint() when $default != null:
return $default(_that.date,_that.bytesDownloaded);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserBandwidthPoint implements UserBandwidthPoint {
  const _UserBandwidthPoint({required this.date, required this.bytesDownloaded});
  factory _UserBandwidthPoint.fromJson(Map<String, dynamic> json) => _$UserBandwidthPointFromJson(json);

@override final  String date;
@override final  int bytesDownloaded;

/// Create a copy of UserBandwidthPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserBandwidthPointCopyWith<_UserBandwidthPoint> get copyWith => __$UserBandwidthPointCopyWithImpl<_UserBandwidthPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserBandwidthPointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserBandwidthPoint&&(identical(other.date, date) || other.date == date)&&(identical(other.bytesDownloaded, bytesDownloaded) || other.bytesDownloaded == bytesDownloaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,bytesDownloaded);

@override
String toString() {
  return 'UserBandwidthPoint(date: $date, bytesDownloaded: $bytesDownloaded)';
}


}

/// @nodoc
abstract mixin class _$UserBandwidthPointCopyWith<$Res> implements $UserBandwidthPointCopyWith<$Res> {
  factory _$UserBandwidthPointCopyWith(_UserBandwidthPoint value, $Res Function(_UserBandwidthPoint) _then) = __$UserBandwidthPointCopyWithImpl;
@override @useResult
$Res call({
 String date, int bytesDownloaded
});




}
/// @nodoc
class __$UserBandwidthPointCopyWithImpl<$Res>
    implements _$UserBandwidthPointCopyWith<$Res> {
  __$UserBandwidthPointCopyWithImpl(this._self, this._then);

  final _UserBandwidthPoint _self;
  final $Res Function(_UserBandwidthPoint) _then;

/// Create a copy of UserBandwidthPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? bytesDownloaded = null,}) {
  return _then(_UserBandwidthPoint(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,bytesDownloaded: null == bytesDownloaded ? _self.bytesDownloaded : bytesDownloaded // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
