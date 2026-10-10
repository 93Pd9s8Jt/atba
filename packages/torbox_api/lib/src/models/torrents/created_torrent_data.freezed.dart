// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'created_torrent_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatedTorrentData {

 String get hash;@JsonKey(name: 'torrent_id') int get torrentId; String get authId;@JsonKey(name: 'active_limit') int? get activeLimit;@JsonKey(name: 'current_active_downloads') int? get currentActiveDownloads;@JsonKey(name: 'queued_id') int? get queuedId;
/// Create a copy of CreatedTorrentData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatedTorrentDataCopyWith<CreatedTorrentData> get copyWith => _$CreatedTorrentDataCopyWithImpl<CreatedTorrentData>(this as CreatedTorrentData, _$identity);

  /// Serializes this CreatedTorrentData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatedTorrentData&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.torrentId, torrentId) || other.torrentId == torrentId)&&(identical(other.authId, authId) || other.authId == authId)&&(identical(other.activeLimit, activeLimit) || other.activeLimit == activeLimit)&&(identical(other.currentActiveDownloads, currentActiveDownloads) || other.currentActiveDownloads == currentActiveDownloads)&&(identical(other.queuedId, queuedId) || other.queuedId == queuedId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hash,torrentId,authId,activeLimit,currentActiveDownloads,queuedId);

@override
String toString() {
  return 'CreatedTorrentData(hash: $hash, torrentId: $torrentId, authId: $authId, activeLimit: $activeLimit, currentActiveDownloads: $currentActiveDownloads, queuedId: $queuedId)';
}


}

/// @nodoc
abstract mixin class $CreatedTorrentDataCopyWith<$Res>  {
  factory $CreatedTorrentDataCopyWith(CreatedTorrentData value, $Res Function(CreatedTorrentData) _then) = _$CreatedTorrentDataCopyWithImpl;
@useResult
$Res call({
 String hash,@JsonKey(name: 'torrent_id') int torrentId, String authId,@JsonKey(name: 'active_limit') int? activeLimit,@JsonKey(name: 'current_active_downloads') int? currentActiveDownloads,@JsonKey(name: 'queued_id') int? queuedId
});




}
/// @nodoc
class _$CreatedTorrentDataCopyWithImpl<$Res>
    implements $CreatedTorrentDataCopyWith<$Res> {
  _$CreatedTorrentDataCopyWithImpl(this._self, this._then);

  final CreatedTorrentData _self;
  final $Res Function(CreatedTorrentData) _then;

/// Create a copy of CreatedTorrentData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hash = null,Object? torrentId = null,Object? authId = null,Object? activeLimit = freezed,Object? currentActiveDownloads = freezed,Object? queuedId = freezed,}) {
  return _then(_self.copyWith(
hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,torrentId: null == torrentId ? _self.torrentId : torrentId // ignore: cast_nullable_to_non_nullable
as int,authId: null == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String,activeLimit: freezed == activeLimit ? _self.activeLimit : activeLimit // ignore: cast_nullable_to_non_nullable
as int?,currentActiveDownloads: freezed == currentActiveDownloads ? _self.currentActiveDownloads : currentActiveDownloads // ignore: cast_nullable_to_non_nullable
as int?,queuedId: freezed == queuedId ? _self.queuedId : queuedId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatedTorrentData].
extension CreatedTorrentDataPatterns on CreatedTorrentData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatedTorrentData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatedTorrentData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatedTorrentData value)  $default,){
final _that = this;
switch (_that) {
case _CreatedTorrentData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatedTorrentData value)?  $default,){
final _that = this;
switch (_that) {
case _CreatedTorrentData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String hash, @JsonKey(name: 'torrent_id')  int torrentId,  String authId, @JsonKey(name: 'active_limit')  int? activeLimit, @JsonKey(name: 'current_active_downloads')  int? currentActiveDownloads, @JsonKey(name: 'queued_id')  int? queuedId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatedTorrentData() when $default != null:
return $default(_that.hash,_that.torrentId,_that.authId,_that.activeLimit,_that.currentActiveDownloads,_that.queuedId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String hash, @JsonKey(name: 'torrent_id')  int torrentId,  String authId, @JsonKey(name: 'active_limit')  int? activeLimit, @JsonKey(name: 'current_active_downloads')  int? currentActiveDownloads, @JsonKey(name: 'queued_id')  int? queuedId)  $default,) {final _that = this;
switch (_that) {
case _CreatedTorrentData():
return $default(_that.hash,_that.torrentId,_that.authId,_that.activeLimit,_that.currentActiveDownloads,_that.queuedId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String hash, @JsonKey(name: 'torrent_id')  int torrentId,  String authId, @JsonKey(name: 'active_limit')  int? activeLimit, @JsonKey(name: 'current_active_downloads')  int? currentActiveDownloads, @JsonKey(name: 'queued_id')  int? queuedId)?  $default,) {final _that = this;
switch (_that) {
case _CreatedTorrentData() when $default != null:
return $default(_that.hash,_that.torrentId,_that.authId,_that.activeLimit,_that.currentActiveDownloads,_that.queuedId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatedTorrentData implements CreatedTorrentData {
  const _CreatedTorrentData({required this.hash, @JsonKey(name: 'torrent_id') required this.torrentId, required this.authId, @JsonKey(name: 'active_limit') this.activeLimit, @JsonKey(name: 'current_active_downloads') this.currentActiveDownloads, @JsonKey(name: 'queued_id') this.queuedId});
  factory _CreatedTorrentData.fromJson(Map<String, dynamic> json) => _$CreatedTorrentDataFromJson(json);

@override final  String hash;
@override@JsonKey(name: 'torrent_id') final  int torrentId;
@override final  String authId;
@override@JsonKey(name: 'active_limit') final  int? activeLimit;
@override@JsonKey(name: 'current_active_downloads') final  int? currentActiveDownloads;
@override@JsonKey(name: 'queued_id') final  int? queuedId;

/// Create a copy of CreatedTorrentData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatedTorrentDataCopyWith<_CreatedTorrentData> get copyWith => __$CreatedTorrentDataCopyWithImpl<_CreatedTorrentData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatedTorrentDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatedTorrentData&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.torrentId, torrentId) || other.torrentId == torrentId)&&(identical(other.authId, authId) || other.authId == authId)&&(identical(other.activeLimit, activeLimit) || other.activeLimit == activeLimit)&&(identical(other.currentActiveDownloads, currentActiveDownloads) || other.currentActiveDownloads == currentActiveDownloads)&&(identical(other.queuedId, queuedId) || other.queuedId == queuedId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hash,torrentId,authId,activeLimit,currentActiveDownloads,queuedId);

@override
String toString() {
  return 'CreatedTorrentData(hash: $hash, torrentId: $torrentId, authId: $authId, activeLimit: $activeLimit, currentActiveDownloads: $currentActiveDownloads, queuedId: $queuedId)';
}


}

/// @nodoc
abstract mixin class _$CreatedTorrentDataCopyWith<$Res> implements $CreatedTorrentDataCopyWith<$Res> {
  factory _$CreatedTorrentDataCopyWith(_CreatedTorrentData value, $Res Function(_CreatedTorrentData) _then) = __$CreatedTorrentDataCopyWithImpl;
@override @useResult
$Res call({
 String hash,@JsonKey(name: 'torrent_id') int torrentId, String authId,@JsonKey(name: 'active_limit') int? activeLimit,@JsonKey(name: 'current_active_downloads') int? currentActiveDownloads,@JsonKey(name: 'queued_id') int? queuedId
});




}
/// @nodoc
class __$CreatedTorrentDataCopyWithImpl<$Res>
    implements _$CreatedTorrentDataCopyWith<$Res> {
  __$CreatedTorrentDataCopyWithImpl(this._self, this._then);

  final _CreatedTorrentData _self;
  final $Res Function(_CreatedTorrentData) _then;

/// Create a copy of CreatedTorrentData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hash = null,Object? torrentId = null,Object? authId = null,Object? activeLimit = freezed,Object? currentActiveDownloads = freezed,Object? queuedId = freezed,}) {
  return _then(_CreatedTorrentData(
hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,torrentId: null == torrentId ? _self.torrentId : torrentId // ignore: cast_nullable_to_non_nullable
as int,authId: null == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String,activeLimit: freezed == activeLimit ? _self.activeLimit : activeLimit // ignore: cast_nullable_to_non_nullable
as int?,currentActiveDownloads: freezed == currentActiveDownloads ? _self.currentActiveDownloads : currentActiveDownloads // ignore: cast_nullable_to_non_nullable
as int?,queuedId: freezed == queuedId ? _self.queuedId : queuedId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
