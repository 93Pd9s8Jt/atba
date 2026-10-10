// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardFilter {

 bool? get active; bool? get cached; bool? get queued; bool? get private; bool? get borrowed; bool? get inactive; bool? get torrents; bool? get uncached; bool? get uploading; bool? get processing; bool? get downloading;@JsonKey(name: 'web_downloads') bool? get webDownloads;@JsonKey(name: 'download_ready') bool? get downloadReady;@JsonKey(name: 'usenet_downloads') bool? get usenetDownloads;
/// Create a copy of DashboardFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardFilterCopyWith<DashboardFilter> get copyWith => _$DashboardFilterCopyWithImpl<DashboardFilter>(this as DashboardFilter, _$identity);

  /// Serializes this DashboardFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardFilter&&(identical(other.active, active) || other.active == active)&&(identical(other.cached, cached) || other.cached == cached)&&(identical(other.queued, queued) || other.queued == queued)&&(identical(other.private, private) || other.private == private)&&(identical(other.borrowed, borrowed) || other.borrowed == borrowed)&&(identical(other.inactive, inactive) || other.inactive == inactive)&&(identical(other.torrents, torrents) || other.torrents == torrents)&&(identical(other.uncached, uncached) || other.uncached == uncached)&&(identical(other.uploading, uploading) || other.uploading == uploading)&&(identical(other.processing, processing) || other.processing == processing)&&(identical(other.downloading, downloading) || other.downloading == downloading)&&(identical(other.webDownloads, webDownloads) || other.webDownloads == webDownloads)&&(identical(other.downloadReady, downloadReady) || other.downloadReady == downloadReady)&&(identical(other.usenetDownloads, usenetDownloads) || other.usenetDownloads == usenetDownloads));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,active,cached,queued,private,borrowed,inactive,torrents,uncached,uploading,processing,downloading,webDownloads,downloadReady,usenetDownloads);

@override
String toString() {
  return 'DashboardFilter(active: $active, cached: $cached, queued: $queued, private: $private, borrowed: $borrowed, inactive: $inactive, torrents: $torrents, uncached: $uncached, uploading: $uploading, processing: $processing, downloading: $downloading, webDownloads: $webDownloads, downloadReady: $downloadReady, usenetDownloads: $usenetDownloads)';
}


}

/// @nodoc
abstract mixin class $DashboardFilterCopyWith<$Res>  {
  factory $DashboardFilterCopyWith(DashboardFilter value, $Res Function(DashboardFilter) _then) = _$DashboardFilterCopyWithImpl;
@useResult
$Res call({
 bool? active, bool? cached, bool? queued, bool? private, bool? borrowed, bool? inactive, bool? torrents, bool? uncached, bool? uploading, bool? processing, bool? downloading,@JsonKey(name: 'web_downloads') bool? webDownloads,@JsonKey(name: 'download_ready') bool? downloadReady,@JsonKey(name: 'usenet_downloads') bool? usenetDownloads
});




}
/// @nodoc
class _$DashboardFilterCopyWithImpl<$Res>
    implements $DashboardFilterCopyWith<$Res> {
  _$DashboardFilterCopyWithImpl(this._self, this._then);

  final DashboardFilter _self;
  final $Res Function(DashboardFilter) _then;

/// Create a copy of DashboardFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? active = freezed,Object? cached = freezed,Object? queued = freezed,Object? private = freezed,Object? borrowed = freezed,Object? inactive = freezed,Object? torrents = freezed,Object? uncached = freezed,Object? uploading = freezed,Object? processing = freezed,Object? downloading = freezed,Object? webDownloads = freezed,Object? downloadReady = freezed,Object? usenetDownloads = freezed,}) {
  return _then(_self.copyWith(
active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,cached: freezed == cached ? _self.cached : cached // ignore: cast_nullable_to_non_nullable
as bool?,queued: freezed == queued ? _self.queued : queued // ignore: cast_nullable_to_non_nullable
as bool?,private: freezed == private ? _self.private : private // ignore: cast_nullable_to_non_nullable
as bool?,borrowed: freezed == borrowed ? _self.borrowed : borrowed // ignore: cast_nullable_to_non_nullable
as bool?,inactive: freezed == inactive ? _self.inactive : inactive // ignore: cast_nullable_to_non_nullable
as bool?,torrents: freezed == torrents ? _self.torrents : torrents // ignore: cast_nullable_to_non_nullable
as bool?,uncached: freezed == uncached ? _self.uncached : uncached // ignore: cast_nullable_to_non_nullable
as bool?,uploading: freezed == uploading ? _self.uploading : uploading // ignore: cast_nullable_to_non_nullable
as bool?,processing: freezed == processing ? _self.processing : processing // ignore: cast_nullable_to_non_nullable
as bool?,downloading: freezed == downloading ? _self.downloading : downloading // ignore: cast_nullable_to_non_nullable
as bool?,webDownloads: freezed == webDownloads ? _self.webDownloads : webDownloads // ignore: cast_nullable_to_non_nullable
as bool?,downloadReady: freezed == downloadReady ? _self.downloadReady : downloadReady // ignore: cast_nullable_to_non_nullable
as bool?,usenetDownloads: freezed == usenetDownloads ? _self.usenetDownloads : usenetDownloads // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardFilter].
extension DashboardFilterPatterns on DashboardFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardFilter value)  $default,){
final _that = this;
switch (_that) {
case _DashboardFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardFilter value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? active,  bool? cached,  bool? queued,  bool? private,  bool? borrowed,  bool? inactive,  bool? torrents,  bool? uncached,  bool? uploading,  bool? processing,  bool? downloading, @JsonKey(name: 'web_downloads')  bool? webDownloads, @JsonKey(name: 'download_ready')  bool? downloadReady, @JsonKey(name: 'usenet_downloads')  bool? usenetDownloads)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardFilter() when $default != null:
return $default(_that.active,_that.cached,_that.queued,_that.private,_that.borrowed,_that.inactive,_that.torrents,_that.uncached,_that.uploading,_that.processing,_that.downloading,_that.webDownloads,_that.downloadReady,_that.usenetDownloads);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? active,  bool? cached,  bool? queued,  bool? private,  bool? borrowed,  bool? inactive,  bool? torrents,  bool? uncached,  bool? uploading,  bool? processing,  bool? downloading, @JsonKey(name: 'web_downloads')  bool? webDownloads, @JsonKey(name: 'download_ready')  bool? downloadReady, @JsonKey(name: 'usenet_downloads')  bool? usenetDownloads)  $default,) {final _that = this;
switch (_that) {
case _DashboardFilter():
return $default(_that.active,_that.cached,_that.queued,_that.private,_that.borrowed,_that.inactive,_that.torrents,_that.uncached,_that.uploading,_that.processing,_that.downloading,_that.webDownloads,_that.downloadReady,_that.usenetDownloads);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? active,  bool? cached,  bool? queued,  bool? private,  bool? borrowed,  bool? inactive,  bool? torrents,  bool? uncached,  bool? uploading,  bool? processing,  bool? downloading, @JsonKey(name: 'web_downloads')  bool? webDownloads, @JsonKey(name: 'download_ready')  bool? downloadReady, @JsonKey(name: 'usenet_downloads')  bool? usenetDownloads)?  $default,) {final _that = this;
switch (_that) {
case _DashboardFilter() when $default != null:
return $default(_that.active,_that.cached,_that.queued,_that.private,_that.borrowed,_that.inactive,_that.torrents,_that.uncached,_that.uploading,_that.processing,_that.downloading,_that.webDownloads,_that.downloadReady,_that.usenetDownloads);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardFilter implements DashboardFilter {
  const _DashboardFilter({this.active, this.cached, this.queued, this.private, this.borrowed, this.inactive, this.torrents, this.uncached, this.uploading, this.processing, this.downloading, @JsonKey(name: 'web_downloads') this.webDownloads, @JsonKey(name: 'download_ready') this.downloadReady, @JsonKey(name: 'usenet_downloads') this.usenetDownloads});
  factory _DashboardFilter.fromJson(Map<String, dynamic> json) => _$DashboardFilterFromJson(json);

@override final  bool? active;
@override final  bool? cached;
@override final  bool? queued;
@override final  bool? private;
@override final  bool? borrowed;
@override final  bool? inactive;
@override final  bool? torrents;
@override final  bool? uncached;
@override final  bool? uploading;
@override final  bool? processing;
@override final  bool? downloading;
@override@JsonKey(name: 'web_downloads') final  bool? webDownloads;
@override@JsonKey(name: 'download_ready') final  bool? downloadReady;
@override@JsonKey(name: 'usenet_downloads') final  bool? usenetDownloads;

/// Create a copy of DashboardFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardFilterCopyWith<_DashboardFilter> get copyWith => __$DashboardFilterCopyWithImpl<_DashboardFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardFilter&&(identical(other.active, active) || other.active == active)&&(identical(other.cached, cached) || other.cached == cached)&&(identical(other.queued, queued) || other.queued == queued)&&(identical(other.private, private) || other.private == private)&&(identical(other.borrowed, borrowed) || other.borrowed == borrowed)&&(identical(other.inactive, inactive) || other.inactive == inactive)&&(identical(other.torrents, torrents) || other.torrents == torrents)&&(identical(other.uncached, uncached) || other.uncached == uncached)&&(identical(other.uploading, uploading) || other.uploading == uploading)&&(identical(other.processing, processing) || other.processing == processing)&&(identical(other.downloading, downloading) || other.downloading == downloading)&&(identical(other.webDownloads, webDownloads) || other.webDownloads == webDownloads)&&(identical(other.downloadReady, downloadReady) || other.downloadReady == downloadReady)&&(identical(other.usenetDownloads, usenetDownloads) || other.usenetDownloads == usenetDownloads));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,active,cached,queued,private,borrowed,inactive,torrents,uncached,uploading,processing,downloading,webDownloads,downloadReady,usenetDownloads);

@override
String toString() {
  return 'DashboardFilter(active: $active, cached: $cached, queued: $queued, private: $private, borrowed: $borrowed, inactive: $inactive, torrents: $torrents, uncached: $uncached, uploading: $uploading, processing: $processing, downloading: $downloading, webDownloads: $webDownloads, downloadReady: $downloadReady, usenetDownloads: $usenetDownloads)';
}


}

/// @nodoc
abstract mixin class _$DashboardFilterCopyWith<$Res> implements $DashboardFilterCopyWith<$Res> {
  factory _$DashboardFilterCopyWith(_DashboardFilter value, $Res Function(_DashboardFilter) _then) = __$DashboardFilterCopyWithImpl;
@override @useResult
$Res call({
 bool? active, bool? cached, bool? queued, bool? private, bool? borrowed, bool? inactive, bool? torrents, bool? uncached, bool? uploading, bool? processing, bool? downloading,@JsonKey(name: 'web_downloads') bool? webDownloads,@JsonKey(name: 'download_ready') bool? downloadReady,@JsonKey(name: 'usenet_downloads') bool? usenetDownloads
});




}
/// @nodoc
class __$DashboardFilterCopyWithImpl<$Res>
    implements _$DashboardFilterCopyWith<$Res> {
  __$DashboardFilterCopyWithImpl(this._self, this._then);

  final _DashboardFilter _self;
  final $Res Function(_DashboardFilter) _then;

/// Create a copy of DashboardFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? active = freezed,Object? cached = freezed,Object? queued = freezed,Object? private = freezed,Object? borrowed = freezed,Object? inactive = freezed,Object? torrents = freezed,Object? uncached = freezed,Object? uploading = freezed,Object? processing = freezed,Object? downloading = freezed,Object? webDownloads = freezed,Object? downloadReady = freezed,Object? usenetDownloads = freezed,}) {
  return _then(_DashboardFilter(
active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,cached: freezed == cached ? _self.cached : cached // ignore: cast_nullable_to_non_nullable
as bool?,queued: freezed == queued ? _self.queued : queued // ignore: cast_nullable_to_non_nullable
as bool?,private: freezed == private ? _self.private : private // ignore: cast_nullable_to_non_nullable
as bool?,borrowed: freezed == borrowed ? _self.borrowed : borrowed // ignore: cast_nullable_to_non_nullable
as bool?,inactive: freezed == inactive ? _self.inactive : inactive // ignore: cast_nullable_to_non_nullable
as bool?,torrents: freezed == torrents ? _self.torrents : torrents // ignore: cast_nullable_to_non_nullable
as bool?,uncached: freezed == uncached ? _self.uncached : uncached // ignore: cast_nullable_to_non_nullable
as bool?,uploading: freezed == uploading ? _self.uploading : uploading // ignore: cast_nullable_to_non_nullable
as bool?,processing: freezed == processing ? _self.processing : processing // ignore: cast_nullable_to_non_nullable
as bool?,downloading: freezed == downloading ? _self.downloading : downloading // ignore: cast_nullable_to_non_nullable
as bool?,webDownloads: freezed == webDownloads ? _self.webDownloads : webDownloads // ignore: cast_nullable_to_non_nullable
as bool?,downloadReady: freezed == downloadReady ? _self.downloadReady : downloadReady // ignore: cast_nullable_to_non_nullable
as bool?,usenetDownloads: freezed == usenetDownloads ? _self.usenetDownloads : usenetDownloads // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
