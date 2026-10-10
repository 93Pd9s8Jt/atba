// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rss_feed_item_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RssFeedItemData {

 int get id; String get createdAt; String get rssName; String get rssUrl; bool get ignored; bool get downloaded; String get link; String get name; String get status; String get statusMessage; int get seedTorrents; String get type;
/// Create a copy of RssFeedItemData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RssFeedItemDataCopyWith<RssFeedItemData> get copyWith => _$RssFeedItemDataCopyWithImpl<RssFeedItemData>(this as RssFeedItemData, _$identity);

  /// Serializes this RssFeedItemData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RssFeedItemData&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.rssName, rssName) || other.rssName == rssName)&&(identical(other.rssUrl, rssUrl) || other.rssUrl == rssUrl)&&(identical(other.ignored, ignored) || other.ignored == ignored)&&(identical(other.downloaded, downloaded) || other.downloaded == downloaded)&&(identical(other.link, link) || other.link == link)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&(identical(other.seedTorrents, seedTorrents) || other.seedTorrents == seedTorrents)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,rssName,rssUrl,ignored,downloaded,link,name,status,statusMessage,seedTorrents,type);

@override
String toString() {
  return 'RssFeedItemData(id: $id, createdAt: $createdAt, rssName: $rssName, rssUrl: $rssUrl, ignored: $ignored, downloaded: $downloaded, link: $link, name: $name, status: $status, statusMessage: $statusMessage, seedTorrents: $seedTorrents, type: $type)';
}


}

/// @nodoc
abstract mixin class $RssFeedItemDataCopyWith<$Res>  {
  factory $RssFeedItemDataCopyWith(RssFeedItemData value, $Res Function(RssFeedItemData) _then) = _$RssFeedItemDataCopyWithImpl;
@useResult
$Res call({
 int id, String createdAt, String rssName, String rssUrl, bool ignored, bool downloaded, String link, String name, String status, String statusMessage, int seedTorrents, String type
});




}
/// @nodoc
class _$RssFeedItemDataCopyWithImpl<$Res>
    implements $RssFeedItemDataCopyWith<$Res> {
  _$RssFeedItemDataCopyWithImpl(this._self, this._then);

  final RssFeedItemData _self;
  final $Res Function(RssFeedItemData) _then;

/// Create a copy of RssFeedItemData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? rssName = null,Object? rssUrl = null,Object? ignored = null,Object? downloaded = null,Object? link = null,Object? name = null,Object? status = null,Object? statusMessage = null,Object? seedTorrents = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,rssName: null == rssName ? _self.rssName : rssName // ignore: cast_nullable_to_non_nullable
as String,rssUrl: null == rssUrl ? _self.rssUrl : rssUrl // ignore: cast_nullable_to_non_nullable
as String,ignored: null == ignored ? _self.ignored : ignored // ignore: cast_nullable_to_non_nullable
as bool,downloaded: null == downloaded ? _self.downloaded : downloaded // ignore: cast_nullable_to_non_nullable
as bool,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusMessage: null == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String,seedTorrents: null == seedTorrents ? _self.seedTorrents : seedTorrents // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RssFeedItemData].
extension RssFeedItemDataPatterns on RssFeedItemData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RssFeedItemData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RssFeedItemData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RssFeedItemData value)  $default,){
final _that = this;
switch (_that) {
case _RssFeedItemData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RssFeedItemData value)?  $default,){
final _that = this;
switch (_that) {
case _RssFeedItemData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String createdAt,  String rssName,  String rssUrl,  bool ignored,  bool downloaded,  String link,  String name,  String status,  String statusMessage,  int seedTorrents,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RssFeedItemData() when $default != null:
return $default(_that.id,_that.createdAt,_that.rssName,_that.rssUrl,_that.ignored,_that.downloaded,_that.link,_that.name,_that.status,_that.statusMessage,_that.seedTorrents,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String createdAt,  String rssName,  String rssUrl,  bool ignored,  bool downloaded,  String link,  String name,  String status,  String statusMessage,  int seedTorrents,  String type)  $default,) {final _that = this;
switch (_that) {
case _RssFeedItemData():
return $default(_that.id,_that.createdAt,_that.rssName,_that.rssUrl,_that.ignored,_that.downloaded,_that.link,_that.name,_that.status,_that.statusMessage,_that.seedTorrents,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String createdAt,  String rssName,  String rssUrl,  bool ignored,  bool downloaded,  String link,  String name,  String status,  String statusMessage,  int seedTorrents,  String type)?  $default,) {final _that = this;
switch (_that) {
case _RssFeedItemData() when $default != null:
return $default(_that.id,_that.createdAt,_that.rssName,_that.rssUrl,_that.ignored,_that.downloaded,_that.link,_that.name,_that.status,_that.statusMessage,_that.seedTorrents,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RssFeedItemData implements RssFeedItemData {
  const _RssFeedItemData({required this.id, required this.createdAt, required this.rssName, required this.rssUrl, required this.ignored, required this.downloaded, required this.link, required this.name, required this.status, required this.statusMessage, required this.seedTorrents, required this.type});
  factory _RssFeedItemData.fromJson(Map<String, dynamic> json) => _$RssFeedItemDataFromJson(json);

@override final  int id;
@override final  String createdAt;
@override final  String rssName;
@override final  String rssUrl;
@override final  bool ignored;
@override final  bool downloaded;
@override final  String link;
@override final  String name;
@override final  String status;
@override final  String statusMessage;
@override final  int seedTorrents;
@override final  String type;

/// Create a copy of RssFeedItemData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RssFeedItemDataCopyWith<_RssFeedItemData> get copyWith => __$RssFeedItemDataCopyWithImpl<_RssFeedItemData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RssFeedItemDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RssFeedItemData&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.rssName, rssName) || other.rssName == rssName)&&(identical(other.rssUrl, rssUrl) || other.rssUrl == rssUrl)&&(identical(other.ignored, ignored) || other.ignored == ignored)&&(identical(other.downloaded, downloaded) || other.downloaded == downloaded)&&(identical(other.link, link) || other.link == link)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&(identical(other.seedTorrents, seedTorrents) || other.seedTorrents == seedTorrents)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,rssName,rssUrl,ignored,downloaded,link,name,status,statusMessage,seedTorrents,type);

@override
String toString() {
  return 'RssFeedItemData(id: $id, createdAt: $createdAt, rssName: $rssName, rssUrl: $rssUrl, ignored: $ignored, downloaded: $downloaded, link: $link, name: $name, status: $status, statusMessage: $statusMessage, seedTorrents: $seedTorrents, type: $type)';
}


}

/// @nodoc
abstract mixin class _$RssFeedItemDataCopyWith<$Res> implements $RssFeedItemDataCopyWith<$Res> {
  factory _$RssFeedItemDataCopyWith(_RssFeedItemData value, $Res Function(_RssFeedItemData) _then) = __$RssFeedItemDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String createdAt, String rssName, String rssUrl, bool ignored, bool downloaded, String link, String name, String status, String statusMessage, int seedTorrents, String type
});




}
/// @nodoc
class __$RssFeedItemDataCopyWithImpl<$Res>
    implements _$RssFeedItemDataCopyWith<$Res> {
  __$RssFeedItemDataCopyWithImpl(this._self, this._then);

  final _RssFeedItemData _self;
  final $Res Function(_RssFeedItemData) _then;

/// Create a copy of RssFeedItemData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? rssName = null,Object? rssUrl = null,Object? ignored = null,Object? downloaded = null,Object? link = null,Object? name = null,Object? status = null,Object? statusMessage = null,Object? seedTorrents = null,Object? type = null,}) {
  return _then(_RssFeedItemData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,rssName: null == rssName ? _self.rssName : rssName // ignore: cast_nullable_to_non_nullable
as String,rssUrl: null == rssUrl ? _self.rssUrl : rssUrl // ignore: cast_nullable_to_non_nullable
as String,ignored: null == ignored ? _self.ignored : ignored // ignore: cast_nullable_to_non_nullable
as bool,downloaded: null == downloaded ? _self.downloaded : downloaded // ignore: cast_nullable_to_non_nullable
as bool,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusMessage: null == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String,seedTorrents: null == seedTorrents ? _self.seedTorrents : seedTorrents // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
