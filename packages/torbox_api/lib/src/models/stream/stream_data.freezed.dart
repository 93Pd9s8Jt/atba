// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stream_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StreamData {

 int get id; int get fileId; String get authId; String get name; String get shortName; String get s3Path; int get size; String get mimetype; String get hash; String get openSubtitlesHash; String get type; String get region; String get domain; String get userToken; String get webdavUrl; StreamIntroInformation? get introInformation; bool get scrobblingEnabled; String get hlsUrl; String get presignedToken; int get subtitleIndex; int get audioIndex; int get resolutionIndex; bool get isTranscoding; bool get needsTranscoding; StreamMediaMetadata? get metadata; StreamSearchMetadata? get searchMetadata;
/// Create a copy of StreamData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamDataCopyWith<StreamData> get copyWith => _$StreamDataCopyWithImpl<StreamData>(this as StreamData, _$identity);

  /// Serializes this StreamData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamData&&(identical(other.id, id) || other.id == id)&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.authId, authId) || other.authId == authId)&&(identical(other.name, name) || other.name == name)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.s3Path, s3Path) || other.s3Path == s3Path)&&(identical(other.size, size) || other.size == size)&&(identical(other.mimetype, mimetype) || other.mimetype == mimetype)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.openSubtitlesHash, openSubtitlesHash) || other.openSubtitlesHash == openSubtitlesHash)&&(identical(other.type, type) || other.type == type)&&(identical(other.region, region) || other.region == region)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.userToken, userToken) || other.userToken == userToken)&&(identical(other.webdavUrl, webdavUrl) || other.webdavUrl == webdavUrl)&&(identical(other.introInformation, introInformation) || other.introInformation == introInformation)&&(identical(other.scrobblingEnabled, scrobblingEnabled) || other.scrobblingEnabled == scrobblingEnabled)&&(identical(other.hlsUrl, hlsUrl) || other.hlsUrl == hlsUrl)&&(identical(other.presignedToken, presignedToken) || other.presignedToken == presignedToken)&&(identical(other.subtitleIndex, subtitleIndex) || other.subtitleIndex == subtitleIndex)&&(identical(other.audioIndex, audioIndex) || other.audioIndex == audioIndex)&&(identical(other.resolutionIndex, resolutionIndex) || other.resolutionIndex == resolutionIndex)&&(identical(other.isTranscoding, isTranscoding) || other.isTranscoding == isTranscoding)&&(identical(other.needsTranscoding, needsTranscoding) || other.needsTranscoding == needsTranscoding)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.searchMetadata, searchMetadata) || other.searchMetadata == searchMetadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,fileId,authId,name,shortName,s3Path,size,mimetype,hash,openSubtitlesHash,type,region,domain,userToken,webdavUrl,introInformation,scrobblingEnabled,hlsUrl,presignedToken,subtitleIndex,audioIndex,resolutionIndex,isTranscoding,needsTranscoding,metadata,searchMetadata]);

@override
String toString() {
  return 'StreamData(id: $id, fileId: $fileId, authId: $authId, name: $name, shortName: $shortName, s3Path: $s3Path, size: $size, mimetype: $mimetype, hash: $hash, openSubtitlesHash: $openSubtitlesHash, type: $type, region: $region, domain: $domain, userToken: $userToken, webdavUrl: $webdavUrl, introInformation: $introInformation, scrobblingEnabled: $scrobblingEnabled, hlsUrl: $hlsUrl, presignedToken: $presignedToken, subtitleIndex: $subtitleIndex, audioIndex: $audioIndex, resolutionIndex: $resolutionIndex, isTranscoding: $isTranscoding, needsTranscoding: $needsTranscoding, metadata: $metadata, searchMetadata: $searchMetadata)';
}


}

/// @nodoc
abstract mixin class $StreamDataCopyWith<$Res>  {
  factory $StreamDataCopyWith(StreamData value, $Res Function(StreamData) _then) = _$StreamDataCopyWithImpl;
@useResult
$Res call({
 int id, int fileId, String authId, String name, String shortName, String s3Path, int size, String mimetype, String hash, String openSubtitlesHash, String type, String region, String domain, String userToken, String webdavUrl, StreamIntroInformation? introInformation, bool scrobblingEnabled, String hlsUrl, String presignedToken, int subtitleIndex, int audioIndex, int resolutionIndex, bool isTranscoding, bool needsTranscoding, StreamMediaMetadata? metadata, StreamSearchMetadata? searchMetadata
});


$StreamIntroInformationCopyWith<$Res>? get introInformation;$StreamMediaMetadataCopyWith<$Res>? get metadata;$StreamSearchMetadataCopyWith<$Res>? get searchMetadata;

}
/// @nodoc
class _$StreamDataCopyWithImpl<$Res>
    implements $StreamDataCopyWith<$Res> {
  _$StreamDataCopyWithImpl(this._self, this._then);

  final StreamData _self;
  final $Res Function(StreamData) _then;

/// Create a copy of StreamData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fileId = null,Object? authId = null,Object? name = null,Object? shortName = null,Object? s3Path = null,Object? size = null,Object? mimetype = null,Object? hash = null,Object? openSubtitlesHash = null,Object? type = null,Object? region = null,Object? domain = null,Object? userToken = null,Object? webdavUrl = null,Object? introInformation = freezed,Object? scrobblingEnabled = null,Object? hlsUrl = null,Object? presignedToken = null,Object? subtitleIndex = null,Object? audioIndex = null,Object? resolutionIndex = null,Object? isTranscoding = null,Object? needsTranscoding = null,Object? metadata = freezed,Object? searchMetadata = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as int,authId: null == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,shortName: null == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String,s3Path: null == s3Path ? _self.s3Path : s3Path // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,mimetype: null == mimetype ? _self.mimetype : mimetype // ignore: cast_nullable_to_non_nullable
as String,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,openSubtitlesHash: null == openSubtitlesHash ? _self.openSubtitlesHash : openSubtitlesHash // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,userToken: null == userToken ? _self.userToken : userToken // ignore: cast_nullable_to_non_nullable
as String,webdavUrl: null == webdavUrl ? _self.webdavUrl : webdavUrl // ignore: cast_nullable_to_non_nullable
as String,introInformation: freezed == introInformation ? _self.introInformation : introInformation // ignore: cast_nullable_to_non_nullable
as StreamIntroInformation?,scrobblingEnabled: null == scrobblingEnabled ? _self.scrobblingEnabled : scrobblingEnabled // ignore: cast_nullable_to_non_nullable
as bool,hlsUrl: null == hlsUrl ? _self.hlsUrl : hlsUrl // ignore: cast_nullable_to_non_nullable
as String,presignedToken: null == presignedToken ? _self.presignedToken : presignedToken // ignore: cast_nullable_to_non_nullable
as String,subtitleIndex: null == subtitleIndex ? _self.subtitleIndex : subtitleIndex // ignore: cast_nullable_to_non_nullable
as int,audioIndex: null == audioIndex ? _self.audioIndex : audioIndex // ignore: cast_nullable_to_non_nullable
as int,resolutionIndex: null == resolutionIndex ? _self.resolutionIndex : resolutionIndex // ignore: cast_nullable_to_non_nullable
as int,isTranscoding: null == isTranscoding ? _self.isTranscoding : isTranscoding // ignore: cast_nullable_to_non_nullable
as bool,needsTranscoding: null == needsTranscoding ? _self.needsTranscoding : needsTranscoding // ignore: cast_nullable_to_non_nullable
as bool,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as StreamMediaMetadata?,searchMetadata: freezed == searchMetadata ? _self.searchMetadata : searchMetadata // ignore: cast_nullable_to_non_nullable
as StreamSearchMetadata?,
  ));
}
/// Create a copy of StreamData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreamIntroInformationCopyWith<$Res>? get introInformation {
    if (_self.introInformation == null) {
    return null;
  }

  return $StreamIntroInformationCopyWith<$Res>(_self.introInformation!, (value) {
    return _then(_self.copyWith(introInformation: value));
  });
}/// Create a copy of StreamData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreamMediaMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $StreamMediaMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}/// Create a copy of StreamData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreamSearchMetadataCopyWith<$Res>? get searchMetadata {
    if (_self.searchMetadata == null) {
    return null;
  }

  return $StreamSearchMetadataCopyWith<$Res>(_self.searchMetadata!, (value) {
    return _then(_self.copyWith(searchMetadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [StreamData].
extension StreamDataPatterns on StreamData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreamData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreamData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreamData value)  $default,){
final _that = this;
switch (_that) {
case _StreamData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreamData value)?  $default,){
final _that = this;
switch (_that) {
case _StreamData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int fileId,  String authId,  String name,  String shortName,  String s3Path,  int size,  String mimetype,  String hash,  String openSubtitlesHash,  String type,  String region,  String domain,  String userToken,  String webdavUrl,  StreamIntroInformation? introInformation,  bool scrobblingEnabled,  String hlsUrl,  String presignedToken,  int subtitleIndex,  int audioIndex,  int resolutionIndex,  bool isTranscoding,  bool needsTranscoding,  StreamMediaMetadata? metadata,  StreamSearchMetadata? searchMetadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StreamData() when $default != null:
return $default(_that.id,_that.fileId,_that.authId,_that.name,_that.shortName,_that.s3Path,_that.size,_that.mimetype,_that.hash,_that.openSubtitlesHash,_that.type,_that.region,_that.domain,_that.userToken,_that.webdavUrl,_that.introInformation,_that.scrobblingEnabled,_that.hlsUrl,_that.presignedToken,_that.subtitleIndex,_that.audioIndex,_that.resolutionIndex,_that.isTranscoding,_that.needsTranscoding,_that.metadata,_that.searchMetadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int fileId,  String authId,  String name,  String shortName,  String s3Path,  int size,  String mimetype,  String hash,  String openSubtitlesHash,  String type,  String region,  String domain,  String userToken,  String webdavUrl,  StreamIntroInformation? introInformation,  bool scrobblingEnabled,  String hlsUrl,  String presignedToken,  int subtitleIndex,  int audioIndex,  int resolutionIndex,  bool isTranscoding,  bool needsTranscoding,  StreamMediaMetadata? metadata,  StreamSearchMetadata? searchMetadata)  $default,) {final _that = this;
switch (_that) {
case _StreamData():
return $default(_that.id,_that.fileId,_that.authId,_that.name,_that.shortName,_that.s3Path,_that.size,_that.mimetype,_that.hash,_that.openSubtitlesHash,_that.type,_that.region,_that.domain,_that.userToken,_that.webdavUrl,_that.introInformation,_that.scrobblingEnabled,_that.hlsUrl,_that.presignedToken,_that.subtitleIndex,_that.audioIndex,_that.resolutionIndex,_that.isTranscoding,_that.needsTranscoding,_that.metadata,_that.searchMetadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int fileId,  String authId,  String name,  String shortName,  String s3Path,  int size,  String mimetype,  String hash,  String openSubtitlesHash,  String type,  String region,  String domain,  String userToken,  String webdavUrl,  StreamIntroInformation? introInformation,  bool scrobblingEnabled,  String hlsUrl,  String presignedToken,  int subtitleIndex,  int audioIndex,  int resolutionIndex,  bool isTranscoding,  bool needsTranscoding,  StreamMediaMetadata? metadata,  StreamSearchMetadata? searchMetadata)?  $default,) {final _that = this;
switch (_that) {
case _StreamData() when $default != null:
return $default(_that.id,_that.fileId,_that.authId,_that.name,_that.shortName,_that.s3Path,_that.size,_that.mimetype,_that.hash,_that.openSubtitlesHash,_that.type,_that.region,_that.domain,_that.userToken,_that.webdavUrl,_that.introInformation,_that.scrobblingEnabled,_that.hlsUrl,_that.presignedToken,_that.subtitleIndex,_that.audioIndex,_that.resolutionIndex,_that.isTranscoding,_that.needsTranscoding,_that.metadata,_that.searchMetadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StreamData implements StreamData {
  const _StreamData({required this.id, required this.fileId, required this.authId, required this.name, required this.shortName, required this.s3Path, required this.size, required this.mimetype, required this.hash, required this.openSubtitlesHash, required this.type, required this.region, required this.domain, required this.userToken, required this.webdavUrl, this.introInformation, required this.scrobblingEnabled, required this.hlsUrl, required this.presignedToken, required this.subtitleIndex, required this.audioIndex, required this.resolutionIndex, required this.isTranscoding, required this.needsTranscoding, this.metadata, this.searchMetadata});
  factory _StreamData.fromJson(Map<String, dynamic> json) => _$StreamDataFromJson(json);

@override final  int id;
@override final  int fileId;
@override final  String authId;
@override final  String name;
@override final  String shortName;
@override final  String s3Path;
@override final  int size;
@override final  String mimetype;
@override final  String hash;
@override final  String openSubtitlesHash;
@override final  String type;
@override final  String region;
@override final  String domain;
@override final  String userToken;
@override final  String webdavUrl;
@override final  StreamIntroInformation? introInformation;
@override final  bool scrobblingEnabled;
@override final  String hlsUrl;
@override final  String presignedToken;
@override final  int subtitleIndex;
@override final  int audioIndex;
@override final  int resolutionIndex;
@override final  bool isTranscoding;
@override final  bool needsTranscoding;
@override final  StreamMediaMetadata? metadata;
@override final  StreamSearchMetadata? searchMetadata;

/// Create a copy of StreamData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreamDataCopyWith<_StreamData> get copyWith => __$StreamDataCopyWithImpl<_StreamData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreamData&&(identical(other.id, id) || other.id == id)&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.authId, authId) || other.authId == authId)&&(identical(other.name, name) || other.name == name)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.s3Path, s3Path) || other.s3Path == s3Path)&&(identical(other.size, size) || other.size == size)&&(identical(other.mimetype, mimetype) || other.mimetype == mimetype)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.openSubtitlesHash, openSubtitlesHash) || other.openSubtitlesHash == openSubtitlesHash)&&(identical(other.type, type) || other.type == type)&&(identical(other.region, region) || other.region == region)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.userToken, userToken) || other.userToken == userToken)&&(identical(other.webdavUrl, webdavUrl) || other.webdavUrl == webdavUrl)&&(identical(other.introInformation, introInformation) || other.introInformation == introInformation)&&(identical(other.scrobblingEnabled, scrobblingEnabled) || other.scrobblingEnabled == scrobblingEnabled)&&(identical(other.hlsUrl, hlsUrl) || other.hlsUrl == hlsUrl)&&(identical(other.presignedToken, presignedToken) || other.presignedToken == presignedToken)&&(identical(other.subtitleIndex, subtitleIndex) || other.subtitleIndex == subtitleIndex)&&(identical(other.audioIndex, audioIndex) || other.audioIndex == audioIndex)&&(identical(other.resolutionIndex, resolutionIndex) || other.resolutionIndex == resolutionIndex)&&(identical(other.isTranscoding, isTranscoding) || other.isTranscoding == isTranscoding)&&(identical(other.needsTranscoding, needsTranscoding) || other.needsTranscoding == needsTranscoding)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.searchMetadata, searchMetadata) || other.searchMetadata == searchMetadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,fileId,authId,name,shortName,s3Path,size,mimetype,hash,openSubtitlesHash,type,region,domain,userToken,webdavUrl,introInformation,scrobblingEnabled,hlsUrl,presignedToken,subtitleIndex,audioIndex,resolutionIndex,isTranscoding,needsTranscoding,metadata,searchMetadata]);

@override
String toString() {
  return 'StreamData(id: $id, fileId: $fileId, authId: $authId, name: $name, shortName: $shortName, s3Path: $s3Path, size: $size, mimetype: $mimetype, hash: $hash, openSubtitlesHash: $openSubtitlesHash, type: $type, region: $region, domain: $domain, userToken: $userToken, webdavUrl: $webdavUrl, introInformation: $introInformation, scrobblingEnabled: $scrobblingEnabled, hlsUrl: $hlsUrl, presignedToken: $presignedToken, subtitleIndex: $subtitleIndex, audioIndex: $audioIndex, resolutionIndex: $resolutionIndex, isTranscoding: $isTranscoding, needsTranscoding: $needsTranscoding, metadata: $metadata, searchMetadata: $searchMetadata)';
}


}

/// @nodoc
abstract mixin class _$StreamDataCopyWith<$Res> implements $StreamDataCopyWith<$Res> {
  factory _$StreamDataCopyWith(_StreamData value, $Res Function(_StreamData) _then) = __$StreamDataCopyWithImpl;
@override @useResult
$Res call({
 int id, int fileId, String authId, String name, String shortName, String s3Path, int size, String mimetype, String hash, String openSubtitlesHash, String type, String region, String domain, String userToken, String webdavUrl, StreamIntroInformation? introInformation, bool scrobblingEnabled, String hlsUrl, String presignedToken, int subtitleIndex, int audioIndex, int resolutionIndex, bool isTranscoding, bool needsTranscoding, StreamMediaMetadata? metadata, StreamSearchMetadata? searchMetadata
});


@override $StreamIntroInformationCopyWith<$Res>? get introInformation;@override $StreamMediaMetadataCopyWith<$Res>? get metadata;@override $StreamSearchMetadataCopyWith<$Res>? get searchMetadata;

}
/// @nodoc
class __$StreamDataCopyWithImpl<$Res>
    implements _$StreamDataCopyWith<$Res> {
  __$StreamDataCopyWithImpl(this._self, this._then);

  final _StreamData _self;
  final $Res Function(_StreamData) _then;

/// Create a copy of StreamData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fileId = null,Object? authId = null,Object? name = null,Object? shortName = null,Object? s3Path = null,Object? size = null,Object? mimetype = null,Object? hash = null,Object? openSubtitlesHash = null,Object? type = null,Object? region = null,Object? domain = null,Object? userToken = null,Object? webdavUrl = null,Object? introInformation = freezed,Object? scrobblingEnabled = null,Object? hlsUrl = null,Object? presignedToken = null,Object? subtitleIndex = null,Object? audioIndex = null,Object? resolutionIndex = null,Object? isTranscoding = null,Object? needsTranscoding = null,Object? metadata = freezed,Object? searchMetadata = freezed,}) {
  return _then(_StreamData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as int,authId: null == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,shortName: null == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String,s3Path: null == s3Path ? _self.s3Path : s3Path // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,mimetype: null == mimetype ? _self.mimetype : mimetype // ignore: cast_nullable_to_non_nullable
as String,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,openSubtitlesHash: null == openSubtitlesHash ? _self.openSubtitlesHash : openSubtitlesHash // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,userToken: null == userToken ? _self.userToken : userToken // ignore: cast_nullable_to_non_nullable
as String,webdavUrl: null == webdavUrl ? _self.webdavUrl : webdavUrl // ignore: cast_nullable_to_non_nullable
as String,introInformation: freezed == introInformation ? _self.introInformation : introInformation // ignore: cast_nullable_to_non_nullable
as StreamIntroInformation?,scrobblingEnabled: null == scrobblingEnabled ? _self.scrobblingEnabled : scrobblingEnabled // ignore: cast_nullable_to_non_nullable
as bool,hlsUrl: null == hlsUrl ? _self.hlsUrl : hlsUrl // ignore: cast_nullable_to_non_nullable
as String,presignedToken: null == presignedToken ? _self.presignedToken : presignedToken // ignore: cast_nullable_to_non_nullable
as String,subtitleIndex: null == subtitleIndex ? _self.subtitleIndex : subtitleIndex // ignore: cast_nullable_to_non_nullable
as int,audioIndex: null == audioIndex ? _self.audioIndex : audioIndex // ignore: cast_nullable_to_non_nullable
as int,resolutionIndex: null == resolutionIndex ? _self.resolutionIndex : resolutionIndex // ignore: cast_nullable_to_non_nullable
as int,isTranscoding: null == isTranscoding ? _self.isTranscoding : isTranscoding // ignore: cast_nullable_to_non_nullable
as bool,needsTranscoding: null == needsTranscoding ? _self.needsTranscoding : needsTranscoding // ignore: cast_nullable_to_non_nullable
as bool,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as StreamMediaMetadata?,searchMetadata: freezed == searchMetadata ? _self.searchMetadata : searchMetadata // ignore: cast_nullable_to_non_nullable
as StreamSearchMetadata?,
  ));
}

/// Create a copy of StreamData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreamIntroInformationCopyWith<$Res>? get introInformation {
    if (_self.introInformation == null) {
    return null;
  }

  return $StreamIntroInformationCopyWith<$Res>(_self.introInformation!, (value) {
    return _then(_self.copyWith(introInformation: value));
  });
}/// Create a copy of StreamData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreamMediaMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $StreamMediaMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}/// Create a copy of StreamData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreamSearchMetadataCopyWith<$Res>? get searchMetadata {
    if (_self.searchMetadata == null) {
    return null;
  }

  return $StreamSearchMetadataCopyWith<$Res>(_self.searchMetadata!, (value) {
    return _then(_self.copyWith(searchMetadata: value));
  });
}
}


/// @nodoc
mixin _$StreamIntroInformation {

 int? get startTime; int? get endTime; String? get title;
/// Create a copy of StreamIntroInformation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamIntroInformationCopyWith<StreamIntroInformation> get copyWith => _$StreamIntroInformationCopyWithImpl<StreamIntroInformation>(this as StreamIntroInformation, _$identity);

  /// Serializes this StreamIntroInformation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamIntroInformation&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startTime,endTime,title);

@override
String toString() {
  return 'StreamIntroInformation(startTime: $startTime, endTime: $endTime, title: $title)';
}


}

/// @nodoc
abstract mixin class $StreamIntroInformationCopyWith<$Res>  {
  factory $StreamIntroInformationCopyWith(StreamIntroInformation value, $Res Function(StreamIntroInformation) _then) = _$StreamIntroInformationCopyWithImpl;
@useResult
$Res call({
 int? startTime, int? endTime, String? title
});




}
/// @nodoc
class _$StreamIntroInformationCopyWithImpl<$Res>
    implements $StreamIntroInformationCopyWith<$Res> {
  _$StreamIntroInformationCopyWithImpl(this._self, this._then);

  final StreamIntroInformation _self;
  final $Res Function(StreamIntroInformation) _then;

/// Create a copy of StreamIntroInformation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startTime = freezed,Object? endTime = freezed,Object? title = freezed,}) {
  return _then(_self.copyWith(
startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as int?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StreamIntroInformation].
extension StreamIntroInformationPatterns on StreamIntroInformation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreamIntroInformation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreamIntroInformation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreamIntroInformation value)  $default,){
final _that = this;
switch (_that) {
case _StreamIntroInformation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreamIntroInformation value)?  $default,){
final _that = this;
switch (_that) {
case _StreamIntroInformation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? startTime,  int? endTime,  String? title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StreamIntroInformation() when $default != null:
return $default(_that.startTime,_that.endTime,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? startTime,  int? endTime,  String? title)  $default,) {final _that = this;
switch (_that) {
case _StreamIntroInformation():
return $default(_that.startTime,_that.endTime,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? startTime,  int? endTime,  String? title)?  $default,) {final _that = this;
switch (_that) {
case _StreamIntroInformation() when $default != null:
return $default(_that.startTime,_that.endTime,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StreamIntroInformation implements StreamIntroInformation {
  const _StreamIntroInformation({this.startTime, this.endTime, this.title});
  factory _StreamIntroInformation.fromJson(Map<String, dynamic> json) => _$StreamIntroInformationFromJson(json);

@override final  int? startTime;
@override final  int? endTime;
@override final  String? title;

/// Create a copy of StreamIntroInformation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreamIntroInformationCopyWith<_StreamIntroInformation> get copyWith => __$StreamIntroInformationCopyWithImpl<_StreamIntroInformation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamIntroInformationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreamIntroInformation&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startTime,endTime,title);

@override
String toString() {
  return 'StreamIntroInformation(startTime: $startTime, endTime: $endTime, title: $title)';
}


}

/// @nodoc
abstract mixin class _$StreamIntroInformationCopyWith<$Res> implements $StreamIntroInformationCopyWith<$Res> {
  factory _$StreamIntroInformationCopyWith(_StreamIntroInformation value, $Res Function(_StreamIntroInformation) _then) = __$StreamIntroInformationCopyWithImpl;
@override @useResult
$Res call({
 int? startTime, int? endTime, String? title
});




}
/// @nodoc
class __$StreamIntroInformationCopyWithImpl<$Res>
    implements _$StreamIntroInformationCopyWith<$Res> {
  __$StreamIntroInformationCopyWithImpl(this._self, this._then);

  final _StreamIntroInformation _self;
  final $Res Function(_StreamIntroInformation) _then;

/// Create a copy of StreamIntroInformation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startTime = freezed,Object? endTime = freezed,Object? title = freezed,}) {
  return _then(_StreamIntroInformation(
startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as int?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
