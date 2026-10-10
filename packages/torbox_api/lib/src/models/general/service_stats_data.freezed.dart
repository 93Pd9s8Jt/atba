// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_stats_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceStatsData {

@JsonKey(name: 'active_torrents') int? get activeTorrents;@JsonKey(name: 'total_users') int get totalUsers;@JsonKey(name: 'total_servers') int get totalServers;@JsonKey(name: 'total_downloads') int? get totalDownloads;@JsonKey(name: 'download_speed') int? get downloadSpeed;@JsonKey(name: 'upload_speed') int? get uploadSpeed;@JsonKey(name: 'total_playbacks') int? get totalPlaybacks;@JsonKey(name: 'total_streams') int? get totalStreams;@JsonKey(name: 'total_fetches') int? get totalFetches;@JsonKey(name: 'p95_fetch_time') int? get p95FetchTime;@JsonKey(name: 'p95_stream_time') int? get p95StreamTime;
/// Create a copy of ServiceStatsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceStatsDataCopyWith<ServiceStatsData> get copyWith => _$ServiceStatsDataCopyWithImpl<ServiceStatsData>(this as ServiceStatsData, _$identity);

  /// Serializes this ServiceStatsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceStatsData&&(identical(other.activeTorrents, activeTorrents) || other.activeTorrents == activeTorrents)&&(identical(other.totalUsers, totalUsers) || other.totalUsers == totalUsers)&&(identical(other.totalServers, totalServers) || other.totalServers == totalServers)&&(identical(other.totalDownloads, totalDownloads) || other.totalDownloads == totalDownloads)&&(identical(other.downloadSpeed, downloadSpeed) || other.downloadSpeed == downloadSpeed)&&(identical(other.uploadSpeed, uploadSpeed) || other.uploadSpeed == uploadSpeed)&&(identical(other.totalPlaybacks, totalPlaybacks) || other.totalPlaybacks == totalPlaybacks)&&(identical(other.totalStreams, totalStreams) || other.totalStreams == totalStreams)&&(identical(other.totalFetches, totalFetches) || other.totalFetches == totalFetches)&&(identical(other.p95FetchTime, p95FetchTime) || other.p95FetchTime == p95FetchTime)&&(identical(other.p95StreamTime, p95StreamTime) || other.p95StreamTime == p95StreamTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeTorrents,totalUsers,totalServers,totalDownloads,downloadSpeed,uploadSpeed,totalPlaybacks,totalStreams,totalFetches,p95FetchTime,p95StreamTime);

@override
String toString() {
  return 'ServiceStatsData(activeTorrents: $activeTorrents, totalUsers: $totalUsers, totalServers: $totalServers, totalDownloads: $totalDownloads, downloadSpeed: $downloadSpeed, uploadSpeed: $uploadSpeed, totalPlaybacks: $totalPlaybacks, totalStreams: $totalStreams, totalFetches: $totalFetches, p95FetchTime: $p95FetchTime, p95StreamTime: $p95StreamTime)';
}


}

/// @nodoc
abstract mixin class $ServiceStatsDataCopyWith<$Res>  {
  factory $ServiceStatsDataCopyWith(ServiceStatsData value, $Res Function(ServiceStatsData) _then) = _$ServiceStatsDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'active_torrents') int? activeTorrents,@JsonKey(name: 'total_users') int totalUsers,@JsonKey(name: 'total_servers') int totalServers,@JsonKey(name: 'total_downloads') int? totalDownloads,@JsonKey(name: 'download_speed') int? downloadSpeed,@JsonKey(name: 'upload_speed') int? uploadSpeed,@JsonKey(name: 'total_playbacks') int? totalPlaybacks,@JsonKey(name: 'total_streams') int? totalStreams,@JsonKey(name: 'total_fetches') int? totalFetches,@JsonKey(name: 'p95_fetch_time') int? p95FetchTime,@JsonKey(name: 'p95_stream_time') int? p95StreamTime
});




}
/// @nodoc
class _$ServiceStatsDataCopyWithImpl<$Res>
    implements $ServiceStatsDataCopyWith<$Res> {
  _$ServiceStatsDataCopyWithImpl(this._self, this._then);

  final ServiceStatsData _self;
  final $Res Function(ServiceStatsData) _then;

/// Create a copy of ServiceStatsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeTorrents = freezed,Object? totalUsers = null,Object? totalServers = null,Object? totalDownloads = freezed,Object? downloadSpeed = freezed,Object? uploadSpeed = freezed,Object? totalPlaybacks = freezed,Object? totalStreams = freezed,Object? totalFetches = freezed,Object? p95FetchTime = freezed,Object? p95StreamTime = freezed,}) {
  return _then(_self.copyWith(
activeTorrents: freezed == activeTorrents ? _self.activeTorrents : activeTorrents // ignore: cast_nullable_to_non_nullable
as int?,totalUsers: null == totalUsers ? _self.totalUsers : totalUsers // ignore: cast_nullable_to_non_nullable
as int,totalServers: null == totalServers ? _self.totalServers : totalServers // ignore: cast_nullable_to_non_nullable
as int,totalDownloads: freezed == totalDownloads ? _self.totalDownloads : totalDownloads // ignore: cast_nullable_to_non_nullable
as int?,downloadSpeed: freezed == downloadSpeed ? _self.downloadSpeed : downloadSpeed // ignore: cast_nullable_to_non_nullable
as int?,uploadSpeed: freezed == uploadSpeed ? _self.uploadSpeed : uploadSpeed // ignore: cast_nullable_to_non_nullable
as int?,totalPlaybacks: freezed == totalPlaybacks ? _self.totalPlaybacks : totalPlaybacks // ignore: cast_nullable_to_non_nullable
as int?,totalStreams: freezed == totalStreams ? _self.totalStreams : totalStreams // ignore: cast_nullable_to_non_nullable
as int?,totalFetches: freezed == totalFetches ? _self.totalFetches : totalFetches // ignore: cast_nullable_to_non_nullable
as int?,p95FetchTime: freezed == p95FetchTime ? _self.p95FetchTime : p95FetchTime // ignore: cast_nullable_to_non_nullable
as int?,p95StreamTime: freezed == p95StreamTime ? _self.p95StreamTime : p95StreamTime // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceStatsData].
extension ServiceStatsDataPatterns on ServiceStatsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceStatsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceStatsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceStatsData value)  $default,){
final _that = this;
switch (_that) {
case _ServiceStatsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceStatsData value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceStatsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'active_torrents')  int? activeTorrents, @JsonKey(name: 'total_users')  int totalUsers, @JsonKey(name: 'total_servers')  int totalServers, @JsonKey(name: 'total_downloads')  int? totalDownloads, @JsonKey(name: 'download_speed')  int? downloadSpeed, @JsonKey(name: 'upload_speed')  int? uploadSpeed, @JsonKey(name: 'total_playbacks')  int? totalPlaybacks, @JsonKey(name: 'total_streams')  int? totalStreams, @JsonKey(name: 'total_fetches')  int? totalFetches, @JsonKey(name: 'p95_fetch_time')  int? p95FetchTime, @JsonKey(name: 'p95_stream_time')  int? p95StreamTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceStatsData() when $default != null:
return $default(_that.activeTorrents,_that.totalUsers,_that.totalServers,_that.totalDownloads,_that.downloadSpeed,_that.uploadSpeed,_that.totalPlaybacks,_that.totalStreams,_that.totalFetches,_that.p95FetchTime,_that.p95StreamTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'active_torrents')  int? activeTorrents, @JsonKey(name: 'total_users')  int totalUsers, @JsonKey(name: 'total_servers')  int totalServers, @JsonKey(name: 'total_downloads')  int? totalDownloads, @JsonKey(name: 'download_speed')  int? downloadSpeed, @JsonKey(name: 'upload_speed')  int? uploadSpeed, @JsonKey(name: 'total_playbacks')  int? totalPlaybacks, @JsonKey(name: 'total_streams')  int? totalStreams, @JsonKey(name: 'total_fetches')  int? totalFetches, @JsonKey(name: 'p95_fetch_time')  int? p95FetchTime, @JsonKey(name: 'p95_stream_time')  int? p95StreamTime)  $default,) {final _that = this;
switch (_that) {
case _ServiceStatsData():
return $default(_that.activeTorrents,_that.totalUsers,_that.totalServers,_that.totalDownloads,_that.downloadSpeed,_that.uploadSpeed,_that.totalPlaybacks,_that.totalStreams,_that.totalFetches,_that.p95FetchTime,_that.p95StreamTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'active_torrents')  int? activeTorrents, @JsonKey(name: 'total_users')  int totalUsers, @JsonKey(name: 'total_servers')  int totalServers, @JsonKey(name: 'total_downloads')  int? totalDownloads, @JsonKey(name: 'download_speed')  int? downloadSpeed, @JsonKey(name: 'upload_speed')  int? uploadSpeed, @JsonKey(name: 'total_playbacks')  int? totalPlaybacks, @JsonKey(name: 'total_streams')  int? totalStreams, @JsonKey(name: 'total_fetches')  int? totalFetches, @JsonKey(name: 'p95_fetch_time')  int? p95FetchTime, @JsonKey(name: 'p95_stream_time')  int? p95StreamTime)?  $default,) {final _that = this;
switch (_that) {
case _ServiceStatsData() when $default != null:
return $default(_that.activeTorrents,_that.totalUsers,_that.totalServers,_that.totalDownloads,_that.downloadSpeed,_that.uploadSpeed,_that.totalPlaybacks,_that.totalStreams,_that.totalFetches,_that.p95FetchTime,_that.p95StreamTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceStatsData implements ServiceStatsData {
  const _ServiceStatsData({@JsonKey(name: 'active_torrents') this.activeTorrents, @JsonKey(name: 'total_users') required this.totalUsers, @JsonKey(name: 'total_servers') required this.totalServers, @JsonKey(name: 'total_downloads') this.totalDownloads, @JsonKey(name: 'download_speed') this.downloadSpeed, @JsonKey(name: 'upload_speed') this.uploadSpeed, @JsonKey(name: 'total_playbacks') this.totalPlaybacks, @JsonKey(name: 'total_streams') this.totalStreams, @JsonKey(name: 'total_fetches') this.totalFetches, @JsonKey(name: 'p95_fetch_time') this.p95FetchTime, @JsonKey(name: 'p95_stream_time') this.p95StreamTime});
  factory _ServiceStatsData.fromJson(Map<String, dynamic> json) => _$ServiceStatsDataFromJson(json);

@override@JsonKey(name: 'active_torrents') final  int? activeTorrents;
@override@JsonKey(name: 'total_users') final  int totalUsers;
@override@JsonKey(name: 'total_servers') final  int totalServers;
@override@JsonKey(name: 'total_downloads') final  int? totalDownloads;
@override@JsonKey(name: 'download_speed') final  int? downloadSpeed;
@override@JsonKey(name: 'upload_speed') final  int? uploadSpeed;
@override@JsonKey(name: 'total_playbacks') final  int? totalPlaybacks;
@override@JsonKey(name: 'total_streams') final  int? totalStreams;
@override@JsonKey(name: 'total_fetches') final  int? totalFetches;
@override@JsonKey(name: 'p95_fetch_time') final  int? p95FetchTime;
@override@JsonKey(name: 'p95_stream_time') final  int? p95StreamTime;

/// Create a copy of ServiceStatsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceStatsDataCopyWith<_ServiceStatsData> get copyWith => __$ServiceStatsDataCopyWithImpl<_ServiceStatsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceStatsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceStatsData&&(identical(other.activeTorrents, activeTorrents) || other.activeTorrents == activeTorrents)&&(identical(other.totalUsers, totalUsers) || other.totalUsers == totalUsers)&&(identical(other.totalServers, totalServers) || other.totalServers == totalServers)&&(identical(other.totalDownloads, totalDownloads) || other.totalDownloads == totalDownloads)&&(identical(other.downloadSpeed, downloadSpeed) || other.downloadSpeed == downloadSpeed)&&(identical(other.uploadSpeed, uploadSpeed) || other.uploadSpeed == uploadSpeed)&&(identical(other.totalPlaybacks, totalPlaybacks) || other.totalPlaybacks == totalPlaybacks)&&(identical(other.totalStreams, totalStreams) || other.totalStreams == totalStreams)&&(identical(other.totalFetches, totalFetches) || other.totalFetches == totalFetches)&&(identical(other.p95FetchTime, p95FetchTime) || other.p95FetchTime == p95FetchTime)&&(identical(other.p95StreamTime, p95StreamTime) || other.p95StreamTime == p95StreamTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeTorrents,totalUsers,totalServers,totalDownloads,downloadSpeed,uploadSpeed,totalPlaybacks,totalStreams,totalFetches,p95FetchTime,p95StreamTime);

@override
String toString() {
  return 'ServiceStatsData(activeTorrents: $activeTorrents, totalUsers: $totalUsers, totalServers: $totalServers, totalDownloads: $totalDownloads, downloadSpeed: $downloadSpeed, uploadSpeed: $uploadSpeed, totalPlaybacks: $totalPlaybacks, totalStreams: $totalStreams, totalFetches: $totalFetches, p95FetchTime: $p95FetchTime, p95StreamTime: $p95StreamTime)';
}


}

/// @nodoc
abstract mixin class _$ServiceStatsDataCopyWith<$Res> implements $ServiceStatsDataCopyWith<$Res> {
  factory _$ServiceStatsDataCopyWith(_ServiceStatsData value, $Res Function(_ServiceStatsData) _then) = __$ServiceStatsDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'active_torrents') int? activeTorrents,@JsonKey(name: 'total_users') int totalUsers,@JsonKey(name: 'total_servers') int totalServers,@JsonKey(name: 'total_downloads') int? totalDownloads,@JsonKey(name: 'download_speed') int? downloadSpeed,@JsonKey(name: 'upload_speed') int? uploadSpeed,@JsonKey(name: 'total_playbacks') int? totalPlaybacks,@JsonKey(name: 'total_streams') int? totalStreams,@JsonKey(name: 'total_fetches') int? totalFetches,@JsonKey(name: 'p95_fetch_time') int? p95FetchTime,@JsonKey(name: 'p95_stream_time') int? p95StreamTime
});




}
/// @nodoc
class __$ServiceStatsDataCopyWithImpl<$Res>
    implements _$ServiceStatsDataCopyWith<$Res> {
  __$ServiceStatsDataCopyWithImpl(this._self, this._then);

  final _ServiceStatsData _self;
  final $Res Function(_ServiceStatsData) _then;

/// Create a copy of ServiceStatsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeTorrents = freezed,Object? totalUsers = null,Object? totalServers = null,Object? totalDownloads = freezed,Object? downloadSpeed = freezed,Object? uploadSpeed = freezed,Object? totalPlaybacks = freezed,Object? totalStreams = freezed,Object? totalFetches = freezed,Object? p95FetchTime = freezed,Object? p95StreamTime = freezed,}) {
  return _then(_ServiceStatsData(
activeTorrents: freezed == activeTorrents ? _self.activeTorrents : activeTorrents // ignore: cast_nullable_to_non_nullable
as int?,totalUsers: null == totalUsers ? _self.totalUsers : totalUsers // ignore: cast_nullable_to_non_nullable
as int,totalServers: null == totalServers ? _self.totalServers : totalServers // ignore: cast_nullable_to_non_nullable
as int,totalDownloads: freezed == totalDownloads ? _self.totalDownloads : totalDownloads // ignore: cast_nullable_to_non_nullable
as int?,downloadSpeed: freezed == downloadSpeed ? _self.downloadSpeed : downloadSpeed // ignore: cast_nullable_to_non_nullable
as int?,uploadSpeed: freezed == uploadSpeed ? _self.uploadSpeed : uploadSpeed // ignore: cast_nullable_to_non_nullable
as int?,totalPlaybacks: freezed == totalPlaybacks ? _self.totalPlaybacks : totalPlaybacks // ignore: cast_nullable_to_non_nullable
as int?,totalStreams: freezed == totalStreams ? _self.totalStreams : totalStreams // ignore: cast_nullable_to_non_nullable
as int?,totalFetches: freezed == totalFetches ? _self.totalFetches : totalFetches // ignore: cast_nullable_to_non_nullable
as int?,p95FetchTime: freezed == p95FetchTime ? _self.p95FetchTime : p95FetchTime // ignore: cast_nullable_to_non_nullable
as int?,p95StreamTime: freezed == p95StreamTime ? _self.p95StreamTime : p95StreamTime // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
