// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rss_feed_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RssFeedData {

 int get id; String get createdAt; String get lastChecked; String get authId; String get name; String get url;/// The site the feed originates from.
 String? get source; String? get sourceName; String? get doRegex; String? get dontRegex; String? get status; int? get scanInterval; int? get dontOlderThan; String? get statusMessage; String? get type; int? get torrentSeeding; String? get state;
/// Create a copy of RssFeedData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RssFeedDataCopyWith<RssFeedData> get copyWith => _$RssFeedDataCopyWithImpl<RssFeedData>(this as RssFeedData, _$identity);

  /// Serializes this RssFeedData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RssFeedData&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastChecked, lastChecked) || other.lastChecked == lastChecked)&&(identical(other.authId, authId) || other.authId == authId)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.source, source) || other.source == source)&&(identical(other.sourceName, sourceName) || other.sourceName == sourceName)&&(identical(other.doRegex, doRegex) || other.doRegex == doRegex)&&(identical(other.dontRegex, dontRegex) || other.dontRegex == dontRegex)&&(identical(other.status, status) || other.status == status)&&(identical(other.scanInterval, scanInterval) || other.scanInterval == scanInterval)&&(identical(other.dontOlderThan, dontOlderThan) || other.dontOlderThan == dontOlderThan)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&(identical(other.type, type) || other.type == type)&&(identical(other.torrentSeeding, torrentSeeding) || other.torrentSeeding == torrentSeeding)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,lastChecked,authId,name,url,source,sourceName,doRegex,dontRegex,status,scanInterval,dontOlderThan,statusMessage,type,torrentSeeding,state);

@override
String toString() {
  return 'RssFeedData(id: $id, createdAt: $createdAt, lastChecked: $lastChecked, authId: $authId, name: $name, url: $url, source: $source, sourceName: $sourceName, doRegex: $doRegex, dontRegex: $dontRegex, status: $status, scanInterval: $scanInterval, dontOlderThan: $dontOlderThan, statusMessage: $statusMessage, type: $type, torrentSeeding: $torrentSeeding, state: $state)';
}


}

/// @nodoc
abstract mixin class $RssFeedDataCopyWith<$Res>  {
  factory $RssFeedDataCopyWith(RssFeedData value, $Res Function(RssFeedData) _then) = _$RssFeedDataCopyWithImpl;
@useResult
$Res call({
 int id, String createdAt, String lastChecked, String authId, String name, String url, String? source, String? sourceName, String? doRegex, String? dontRegex, String? status, int? scanInterval, int? dontOlderThan, String? statusMessage, String? type, int? torrentSeeding, String? state
});




}
/// @nodoc
class _$RssFeedDataCopyWithImpl<$Res>
    implements $RssFeedDataCopyWith<$Res> {
  _$RssFeedDataCopyWithImpl(this._self, this._then);

  final RssFeedData _self;
  final $Res Function(RssFeedData) _then;

/// Create a copy of RssFeedData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? lastChecked = null,Object? authId = null,Object? name = null,Object? url = null,Object? source = freezed,Object? sourceName = freezed,Object? doRegex = freezed,Object? dontRegex = freezed,Object? status = freezed,Object? scanInterval = freezed,Object? dontOlderThan = freezed,Object? statusMessage = freezed,Object? type = freezed,Object? torrentSeeding = freezed,Object? state = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,lastChecked: null == lastChecked ? _self.lastChecked : lastChecked // ignore: cast_nullable_to_non_nullable
as String,authId: null == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,sourceName: freezed == sourceName ? _self.sourceName : sourceName // ignore: cast_nullable_to_non_nullable
as String?,doRegex: freezed == doRegex ? _self.doRegex : doRegex // ignore: cast_nullable_to_non_nullable
as String?,dontRegex: freezed == dontRegex ? _self.dontRegex : dontRegex // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,scanInterval: freezed == scanInterval ? _self.scanInterval : scanInterval // ignore: cast_nullable_to_non_nullable
as int?,dontOlderThan: freezed == dontOlderThan ? _self.dontOlderThan : dontOlderThan // ignore: cast_nullable_to_non_nullable
as int?,statusMessage: freezed == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,torrentSeeding: freezed == torrentSeeding ? _self.torrentSeeding : torrentSeeding // ignore: cast_nullable_to_non_nullable
as int?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RssFeedData].
extension RssFeedDataPatterns on RssFeedData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RssFeedData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RssFeedData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RssFeedData value)  $default,){
final _that = this;
switch (_that) {
case _RssFeedData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RssFeedData value)?  $default,){
final _that = this;
switch (_that) {
case _RssFeedData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String createdAt,  String lastChecked,  String authId,  String name,  String url,  String? source,  String? sourceName,  String? doRegex,  String? dontRegex,  String? status,  int? scanInterval,  int? dontOlderThan,  String? statusMessage,  String? type,  int? torrentSeeding,  String? state)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RssFeedData() when $default != null:
return $default(_that.id,_that.createdAt,_that.lastChecked,_that.authId,_that.name,_that.url,_that.source,_that.sourceName,_that.doRegex,_that.dontRegex,_that.status,_that.scanInterval,_that.dontOlderThan,_that.statusMessage,_that.type,_that.torrentSeeding,_that.state);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String createdAt,  String lastChecked,  String authId,  String name,  String url,  String? source,  String? sourceName,  String? doRegex,  String? dontRegex,  String? status,  int? scanInterval,  int? dontOlderThan,  String? statusMessage,  String? type,  int? torrentSeeding,  String? state)  $default,) {final _that = this;
switch (_that) {
case _RssFeedData():
return $default(_that.id,_that.createdAt,_that.lastChecked,_that.authId,_that.name,_that.url,_that.source,_that.sourceName,_that.doRegex,_that.dontRegex,_that.status,_that.scanInterval,_that.dontOlderThan,_that.statusMessage,_that.type,_that.torrentSeeding,_that.state);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String createdAt,  String lastChecked,  String authId,  String name,  String url,  String? source,  String? sourceName,  String? doRegex,  String? dontRegex,  String? status,  int? scanInterval,  int? dontOlderThan,  String? statusMessage,  String? type,  int? torrentSeeding,  String? state)?  $default,) {final _that = this;
switch (_that) {
case _RssFeedData() when $default != null:
return $default(_that.id,_that.createdAt,_that.lastChecked,_that.authId,_that.name,_that.url,_that.source,_that.sourceName,_that.doRegex,_that.dontRegex,_that.status,_that.scanInterval,_that.dontOlderThan,_that.statusMessage,_that.type,_that.torrentSeeding,_that.state);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RssFeedData implements RssFeedData {
  const _RssFeedData({required this.id, required this.createdAt, required this.lastChecked, required this.authId, required this.name, required this.url, this.source, this.sourceName, this.doRegex, this.dontRegex, this.status, this.scanInterval, this.dontOlderThan, this.statusMessage, this.type, this.torrentSeeding, this.state});
  factory _RssFeedData.fromJson(Map<String, dynamic> json) => _$RssFeedDataFromJson(json);

@override final  int id;
@override final  String createdAt;
@override final  String lastChecked;
@override final  String authId;
@override final  String name;
@override final  String url;
/// The site the feed originates from.
@override final  String? source;
@override final  String? sourceName;
@override final  String? doRegex;
@override final  String? dontRegex;
@override final  String? status;
@override final  int? scanInterval;
@override final  int? dontOlderThan;
@override final  String? statusMessage;
@override final  String? type;
@override final  int? torrentSeeding;
@override final  String? state;

/// Create a copy of RssFeedData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RssFeedDataCopyWith<_RssFeedData> get copyWith => __$RssFeedDataCopyWithImpl<_RssFeedData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RssFeedDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RssFeedData&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastChecked, lastChecked) || other.lastChecked == lastChecked)&&(identical(other.authId, authId) || other.authId == authId)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.source, source) || other.source == source)&&(identical(other.sourceName, sourceName) || other.sourceName == sourceName)&&(identical(other.doRegex, doRegex) || other.doRegex == doRegex)&&(identical(other.dontRegex, dontRegex) || other.dontRegex == dontRegex)&&(identical(other.status, status) || other.status == status)&&(identical(other.scanInterval, scanInterval) || other.scanInterval == scanInterval)&&(identical(other.dontOlderThan, dontOlderThan) || other.dontOlderThan == dontOlderThan)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&(identical(other.type, type) || other.type == type)&&(identical(other.torrentSeeding, torrentSeeding) || other.torrentSeeding == torrentSeeding)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,lastChecked,authId,name,url,source,sourceName,doRegex,dontRegex,status,scanInterval,dontOlderThan,statusMessage,type,torrentSeeding,state);

@override
String toString() {
  return 'RssFeedData(id: $id, createdAt: $createdAt, lastChecked: $lastChecked, authId: $authId, name: $name, url: $url, source: $source, sourceName: $sourceName, doRegex: $doRegex, dontRegex: $dontRegex, status: $status, scanInterval: $scanInterval, dontOlderThan: $dontOlderThan, statusMessage: $statusMessage, type: $type, torrentSeeding: $torrentSeeding, state: $state)';
}


}

/// @nodoc
abstract mixin class _$RssFeedDataCopyWith<$Res> implements $RssFeedDataCopyWith<$Res> {
  factory _$RssFeedDataCopyWith(_RssFeedData value, $Res Function(_RssFeedData) _then) = __$RssFeedDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String createdAt, String lastChecked, String authId, String name, String url, String? source, String? sourceName, String? doRegex, String? dontRegex, String? status, int? scanInterval, int? dontOlderThan, String? statusMessage, String? type, int? torrentSeeding, String? state
});




}
/// @nodoc
class __$RssFeedDataCopyWithImpl<$Res>
    implements _$RssFeedDataCopyWith<$Res> {
  __$RssFeedDataCopyWithImpl(this._self, this._then);

  final _RssFeedData _self;
  final $Res Function(_RssFeedData) _then;

/// Create a copy of RssFeedData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? lastChecked = null,Object? authId = null,Object? name = null,Object? url = null,Object? source = freezed,Object? sourceName = freezed,Object? doRegex = freezed,Object? dontRegex = freezed,Object? status = freezed,Object? scanInterval = freezed,Object? dontOlderThan = freezed,Object? statusMessage = freezed,Object? type = freezed,Object? torrentSeeding = freezed,Object? state = freezed,}) {
  return _then(_RssFeedData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,lastChecked: null == lastChecked ? _self.lastChecked : lastChecked // ignore: cast_nullable_to_non_nullable
as String,authId: null == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,sourceName: freezed == sourceName ? _self.sourceName : sourceName // ignore: cast_nullable_to_non_nullable
as String?,doRegex: freezed == doRegex ? _self.doRegex : doRegex // ignore: cast_nullable_to_non_nullable
as String?,dontRegex: freezed == dontRegex ? _self.dontRegex : dontRegex // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,scanInterval: freezed == scanInterval ? _self.scanInterval : scanInterval // ignore: cast_nullable_to_non_nullable
as int?,dontOlderThan: freezed == dontOlderThan ? _self.dontOlderThan : dontOlderThan // ignore: cast_nullable_to_non_nullable
as int?,statusMessage: freezed == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,torrentSeeding: freezed == torrentSeeding ? _self.torrentSeeding : torrentSeeding // ignore: cast_nullable_to_non_nullable
as int?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
