// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stream_info_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StreamInfoData {

 String get hlsUrl; String get domain; String get presignedToken; int get subtitleIndex; int get audioIndex; int get resolutionIndex; String get fileToken; String get token; bool get isTranscoding; bool get needsTranscoding; StreamMediaMetadata? get metadata; StreamSearchMetadata? get searchMetadata;
/// Create a copy of StreamInfoData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamInfoDataCopyWith<StreamInfoData> get copyWith => _$StreamInfoDataCopyWithImpl<StreamInfoData>(this as StreamInfoData, _$identity);

  /// Serializes this StreamInfoData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamInfoData&&(identical(other.hlsUrl, hlsUrl) || other.hlsUrl == hlsUrl)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.presignedToken, presignedToken) || other.presignedToken == presignedToken)&&(identical(other.subtitleIndex, subtitleIndex) || other.subtitleIndex == subtitleIndex)&&(identical(other.audioIndex, audioIndex) || other.audioIndex == audioIndex)&&(identical(other.resolutionIndex, resolutionIndex) || other.resolutionIndex == resolutionIndex)&&(identical(other.fileToken, fileToken) || other.fileToken == fileToken)&&(identical(other.token, token) || other.token == token)&&(identical(other.isTranscoding, isTranscoding) || other.isTranscoding == isTranscoding)&&(identical(other.needsTranscoding, needsTranscoding) || other.needsTranscoding == needsTranscoding)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.searchMetadata, searchMetadata) || other.searchMetadata == searchMetadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hlsUrl,domain,presignedToken,subtitleIndex,audioIndex,resolutionIndex,fileToken,token,isTranscoding,needsTranscoding,metadata,searchMetadata);

@override
String toString() {
  return 'StreamInfoData(hlsUrl: $hlsUrl, domain: $domain, presignedToken: $presignedToken, subtitleIndex: $subtitleIndex, audioIndex: $audioIndex, resolutionIndex: $resolutionIndex, fileToken: $fileToken, token: $token, isTranscoding: $isTranscoding, needsTranscoding: $needsTranscoding, metadata: $metadata, searchMetadata: $searchMetadata)';
}


}

/// @nodoc
abstract mixin class $StreamInfoDataCopyWith<$Res>  {
  factory $StreamInfoDataCopyWith(StreamInfoData value, $Res Function(StreamInfoData) _then) = _$StreamInfoDataCopyWithImpl;
@useResult
$Res call({
 String hlsUrl, String domain, String presignedToken, int subtitleIndex, int audioIndex, int resolutionIndex, String fileToken, String token, bool isTranscoding, bool needsTranscoding, StreamMediaMetadata? metadata, StreamSearchMetadata? searchMetadata
});


$StreamMediaMetadataCopyWith<$Res>? get metadata;$StreamSearchMetadataCopyWith<$Res>? get searchMetadata;

}
/// @nodoc
class _$StreamInfoDataCopyWithImpl<$Res>
    implements $StreamInfoDataCopyWith<$Res> {
  _$StreamInfoDataCopyWithImpl(this._self, this._then);

  final StreamInfoData _self;
  final $Res Function(StreamInfoData) _then;

/// Create a copy of StreamInfoData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hlsUrl = null,Object? domain = null,Object? presignedToken = null,Object? subtitleIndex = null,Object? audioIndex = null,Object? resolutionIndex = null,Object? fileToken = null,Object? token = null,Object? isTranscoding = null,Object? needsTranscoding = null,Object? metadata = freezed,Object? searchMetadata = freezed,}) {
  return _then(_self.copyWith(
hlsUrl: null == hlsUrl ? _self.hlsUrl : hlsUrl // ignore: cast_nullable_to_non_nullable
as String,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,presignedToken: null == presignedToken ? _self.presignedToken : presignedToken // ignore: cast_nullable_to_non_nullable
as String,subtitleIndex: null == subtitleIndex ? _self.subtitleIndex : subtitleIndex // ignore: cast_nullable_to_non_nullable
as int,audioIndex: null == audioIndex ? _self.audioIndex : audioIndex // ignore: cast_nullable_to_non_nullable
as int,resolutionIndex: null == resolutionIndex ? _self.resolutionIndex : resolutionIndex // ignore: cast_nullable_to_non_nullable
as int,fileToken: null == fileToken ? _self.fileToken : fileToken // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,isTranscoding: null == isTranscoding ? _self.isTranscoding : isTranscoding // ignore: cast_nullable_to_non_nullable
as bool,needsTranscoding: null == needsTranscoding ? _self.needsTranscoding : needsTranscoding // ignore: cast_nullable_to_non_nullable
as bool,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as StreamMediaMetadata?,searchMetadata: freezed == searchMetadata ? _self.searchMetadata : searchMetadata // ignore: cast_nullable_to_non_nullable
as StreamSearchMetadata?,
  ));
}
/// Create a copy of StreamInfoData
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
}/// Create a copy of StreamInfoData
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


/// Adds pattern-matching-related methods to [StreamInfoData].
extension StreamInfoDataPatterns on StreamInfoData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreamInfoData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreamInfoData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreamInfoData value)  $default,){
final _that = this;
switch (_that) {
case _StreamInfoData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreamInfoData value)?  $default,){
final _that = this;
switch (_that) {
case _StreamInfoData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String hlsUrl,  String domain,  String presignedToken,  int subtitleIndex,  int audioIndex,  int resolutionIndex,  String fileToken,  String token,  bool isTranscoding,  bool needsTranscoding,  StreamMediaMetadata? metadata,  StreamSearchMetadata? searchMetadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StreamInfoData() when $default != null:
return $default(_that.hlsUrl,_that.domain,_that.presignedToken,_that.subtitleIndex,_that.audioIndex,_that.resolutionIndex,_that.fileToken,_that.token,_that.isTranscoding,_that.needsTranscoding,_that.metadata,_that.searchMetadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String hlsUrl,  String domain,  String presignedToken,  int subtitleIndex,  int audioIndex,  int resolutionIndex,  String fileToken,  String token,  bool isTranscoding,  bool needsTranscoding,  StreamMediaMetadata? metadata,  StreamSearchMetadata? searchMetadata)  $default,) {final _that = this;
switch (_that) {
case _StreamInfoData():
return $default(_that.hlsUrl,_that.domain,_that.presignedToken,_that.subtitleIndex,_that.audioIndex,_that.resolutionIndex,_that.fileToken,_that.token,_that.isTranscoding,_that.needsTranscoding,_that.metadata,_that.searchMetadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String hlsUrl,  String domain,  String presignedToken,  int subtitleIndex,  int audioIndex,  int resolutionIndex,  String fileToken,  String token,  bool isTranscoding,  bool needsTranscoding,  StreamMediaMetadata? metadata,  StreamSearchMetadata? searchMetadata)?  $default,) {final _that = this;
switch (_that) {
case _StreamInfoData() when $default != null:
return $default(_that.hlsUrl,_that.domain,_that.presignedToken,_that.subtitleIndex,_that.audioIndex,_that.resolutionIndex,_that.fileToken,_that.token,_that.isTranscoding,_that.needsTranscoding,_that.metadata,_that.searchMetadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StreamInfoData implements StreamInfoData {
  const _StreamInfoData({required this.hlsUrl, required this.domain, required this.presignedToken, required this.subtitleIndex, required this.audioIndex, required this.resolutionIndex, required this.fileToken, required this.token, required this.isTranscoding, required this.needsTranscoding, this.metadata, this.searchMetadata});
  factory _StreamInfoData.fromJson(Map<String, dynamic> json) => _$StreamInfoDataFromJson(json);

@override final  String hlsUrl;
@override final  String domain;
@override final  String presignedToken;
@override final  int subtitleIndex;
@override final  int audioIndex;
@override final  int resolutionIndex;
@override final  String fileToken;
@override final  String token;
@override final  bool isTranscoding;
@override final  bool needsTranscoding;
@override final  StreamMediaMetadata? metadata;
@override final  StreamSearchMetadata? searchMetadata;

/// Create a copy of StreamInfoData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreamInfoDataCopyWith<_StreamInfoData> get copyWith => __$StreamInfoDataCopyWithImpl<_StreamInfoData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamInfoDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreamInfoData&&(identical(other.hlsUrl, hlsUrl) || other.hlsUrl == hlsUrl)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.presignedToken, presignedToken) || other.presignedToken == presignedToken)&&(identical(other.subtitleIndex, subtitleIndex) || other.subtitleIndex == subtitleIndex)&&(identical(other.audioIndex, audioIndex) || other.audioIndex == audioIndex)&&(identical(other.resolutionIndex, resolutionIndex) || other.resolutionIndex == resolutionIndex)&&(identical(other.fileToken, fileToken) || other.fileToken == fileToken)&&(identical(other.token, token) || other.token == token)&&(identical(other.isTranscoding, isTranscoding) || other.isTranscoding == isTranscoding)&&(identical(other.needsTranscoding, needsTranscoding) || other.needsTranscoding == needsTranscoding)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.searchMetadata, searchMetadata) || other.searchMetadata == searchMetadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hlsUrl,domain,presignedToken,subtitleIndex,audioIndex,resolutionIndex,fileToken,token,isTranscoding,needsTranscoding,metadata,searchMetadata);

@override
String toString() {
  return 'StreamInfoData(hlsUrl: $hlsUrl, domain: $domain, presignedToken: $presignedToken, subtitleIndex: $subtitleIndex, audioIndex: $audioIndex, resolutionIndex: $resolutionIndex, fileToken: $fileToken, token: $token, isTranscoding: $isTranscoding, needsTranscoding: $needsTranscoding, metadata: $metadata, searchMetadata: $searchMetadata)';
}


}

/// @nodoc
abstract mixin class _$StreamInfoDataCopyWith<$Res> implements $StreamInfoDataCopyWith<$Res> {
  factory _$StreamInfoDataCopyWith(_StreamInfoData value, $Res Function(_StreamInfoData) _then) = __$StreamInfoDataCopyWithImpl;
@override @useResult
$Res call({
 String hlsUrl, String domain, String presignedToken, int subtitleIndex, int audioIndex, int resolutionIndex, String fileToken, String token, bool isTranscoding, bool needsTranscoding, StreamMediaMetadata? metadata, StreamSearchMetadata? searchMetadata
});


@override $StreamMediaMetadataCopyWith<$Res>? get metadata;@override $StreamSearchMetadataCopyWith<$Res>? get searchMetadata;

}
/// @nodoc
class __$StreamInfoDataCopyWithImpl<$Res>
    implements _$StreamInfoDataCopyWith<$Res> {
  __$StreamInfoDataCopyWithImpl(this._self, this._then);

  final _StreamInfoData _self;
  final $Res Function(_StreamInfoData) _then;

/// Create a copy of StreamInfoData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hlsUrl = null,Object? domain = null,Object? presignedToken = null,Object? subtitleIndex = null,Object? audioIndex = null,Object? resolutionIndex = null,Object? fileToken = null,Object? token = null,Object? isTranscoding = null,Object? needsTranscoding = null,Object? metadata = freezed,Object? searchMetadata = freezed,}) {
  return _then(_StreamInfoData(
hlsUrl: null == hlsUrl ? _self.hlsUrl : hlsUrl // ignore: cast_nullable_to_non_nullable
as String,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,presignedToken: null == presignedToken ? _self.presignedToken : presignedToken // ignore: cast_nullable_to_non_nullable
as String,subtitleIndex: null == subtitleIndex ? _self.subtitleIndex : subtitleIndex // ignore: cast_nullable_to_non_nullable
as int,audioIndex: null == audioIndex ? _self.audioIndex : audioIndex // ignore: cast_nullable_to_non_nullable
as int,resolutionIndex: null == resolutionIndex ? _self.resolutionIndex : resolutionIndex // ignore: cast_nullable_to_non_nullable
as int,fileToken: null == fileToken ? _self.fileToken : fileToken // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,isTranscoding: null == isTranscoding ? _self.isTranscoding : isTranscoding // ignore: cast_nullable_to_non_nullable
as bool,needsTranscoding: null == needsTranscoding ? _self.needsTranscoding : needsTranscoding // ignore: cast_nullable_to_non_nullable
as bool,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as StreamMediaMetadata?,searchMetadata: freezed == searchMetadata ? _self.searchMetadata : searchMetadata // ignore: cast_nullable_to_non_nullable
as StreamSearchMetadata?,
  ));
}

/// Create a copy of StreamInfoData
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
}/// Create a copy of StreamInfoData
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

// dart format on
