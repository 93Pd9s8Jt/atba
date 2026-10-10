// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stream_media_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StreamMediaMetadata {

 StreamVideoMetadata? get video; List<StreamAudioMetadata>? get audios;/// Subtitle track metadata. The API does not document this shape; only
/// the fields below are mapped and unknown keys are ignored.
 List<StreamSubtitleMetadata>? get subtitles; String? get thumbnail; String? get chapters;
/// Create a copy of StreamMediaMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamMediaMetadataCopyWith<StreamMediaMetadata> get copyWith => _$StreamMediaMetadataCopyWithImpl<StreamMediaMetadata>(this as StreamMediaMetadata, _$identity);

  /// Serializes this StreamMediaMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamMediaMetadata&&(identical(other.video, video) || other.video == video)&&const DeepCollectionEquality().equals(other.audios, audios)&&const DeepCollectionEquality().equals(other.subtitles, subtitles)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.chapters, chapters) || other.chapters == chapters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,video,const DeepCollectionEquality().hash(audios),const DeepCollectionEquality().hash(subtitles),thumbnail,chapters);

@override
String toString() {
  return 'StreamMediaMetadata(video: $video, audios: $audios, subtitles: $subtitles, thumbnail: $thumbnail, chapters: $chapters)';
}


}

/// @nodoc
abstract mixin class $StreamMediaMetadataCopyWith<$Res>  {
  factory $StreamMediaMetadataCopyWith(StreamMediaMetadata value, $Res Function(StreamMediaMetadata) _then) = _$StreamMediaMetadataCopyWithImpl;
@useResult
$Res call({
 StreamVideoMetadata? video, List<StreamAudioMetadata>? audios, List<StreamSubtitleMetadata>? subtitles, String? thumbnail, String? chapters
});


$StreamVideoMetadataCopyWith<$Res>? get video;

}
/// @nodoc
class _$StreamMediaMetadataCopyWithImpl<$Res>
    implements $StreamMediaMetadataCopyWith<$Res> {
  _$StreamMediaMetadataCopyWithImpl(this._self, this._then);

  final StreamMediaMetadata _self;
  final $Res Function(StreamMediaMetadata) _then;

/// Create a copy of StreamMediaMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? video = freezed,Object? audios = freezed,Object? subtitles = freezed,Object? thumbnail = freezed,Object? chapters = freezed,}) {
  return _then(_self.copyWith(
video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as StreamVideoMetadata?,audios: freezed == audios ? _self.audios : audios // ignore: cast_nullable_to_non_nullable
as List<StreamAudioMetadata>?,subtitles: freezed == subtitles ? _self.subtitles : subtitles // ignore: cast_nullable_to_non_nullable
as List<StreamSubtitleMetadata>?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,chapters: freezed == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of StreamMediaMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreamVideoMetadataCopyWith<$Res>? get video {
    if (_self.video == null) {
    return null;
  }

  return $StreamVideoMetadataCopyWith<$Res>(_self.video!, (value) {
    return _then(_self.copyWith(video: value));
  });
}
}


/// Adds pattern-matching-related methods to [StreamMediaMetadata].
extension StreamMediaMetadataPatterns on StreamMediaMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreamMediaMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreamMediaMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreamMediaMetadata value)  $default,){
final _that = this;
switch (_that) {
case _StreamMediaMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreamMediaMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _StreamMediaMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StreamVideoMetadata? video,  List<StreamAudioMetadata>? audios,  List<StreamSubtitleMetadata>? subtitles,  String? thumbnail,  String? chapters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StreamMediaMetadata() when $default != null:
return $default(_that.video,_that.audios,_that.subtitles,_that.thumbnail,_that.chapters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StreamVideoMetadata? video,  List<StreamAudioMetadata>? audios,  List<StreamSubtitleMetadata>? subtitles,  String? thumbnail,  String? chapters)  $default,) {final _that = this;
switch (_that) {
case _StreamMediaMetadata():
return $default(_that.video,_that.audios,_that.subtitles,_that.thumbnail,_that.chapters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StreamVideoMetadata? video,  List<StreamAudioMetadata>? audios,  List<StreamSubtitleMetadata>? subtitles,  String? thumbnail,  String? chapters)?  $default,) {final _that = this;
switch (_that) {
case _StreamMediaMetadata() when $default != null:
return $default(_that.video,_that.audios,_that.subtitles,_that.thumbnail,_that.chapters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StreamMediaMetadata implements StreamMediaMetadata {
  const _StreamMediaMetadata({this.video, final  List<StreamAudioMetadata>? audios, final  List<StreamSubtitleMetadata>? subtitles, this.thumbnail, this.chapters}): _audios = audios,_subtitles = subtitles;
  factory _StreamMediaMetadata.fromJson(Map<String, dynamic> json) => _$StreamMediaMetadataFromJson(json);

@override final  StreamVideoMetadata? video;
 final  List<StreamAudioMetadata>? _audios;
@override List<StreamAudioMetadata>? get audios {
  final value = _audios;
  if (value == null) return null;
  if (_audios is EqualUnmodifiableListView) return _audios;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Subtitle track metadata. The API does not document this shape; only
/// the fields below are mapped and unknown keys are ignored.
 final  List<StreamSubtitleMetadata>? _subtitles;
/// Subtitle track metadata. The API does not document this shape; only
/// the fields below are mapped and unknown keys are ignored.
@override List<StreamSubtitleMetadata>? get subtitles {
  final value = _subtitles;
  if (value == null) return null;
  if (_subtitles is EqualUnmodifiableListView) return _subtitles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? thumbnail;
@override final  String? chapters;

/// Create a copy of StreamMediaMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreamMediaMetadataCopyWith<_StreamMediaMetadata> get copyWith => __$StreamMediaMetadataCopyWithImpl<_StreamMediaMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamMediaMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreamMediaMetadata&&(identical(other.video, video) || other.video == video)&&const DeepCollectionEquality().equals(other._audios, _audios)&&const DeepCollectionEquality().equals(other._subtitles, _subtitles)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.chapters, chapters) || other.chapters == chapters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,video,const DeepCollectionEquality().hash(_audios),const DeepCollectionEquality().hash(_subtitles),thumbnail,chapters);

@override
String toString() {
  return 'StreamMediaMetadata(video: $video, audios: $audios, subtitles: $subtitles, thumbnail: $thumbnail, chapters: $chapters)';
}


}

/// @nodoc
abstract mixin class _$StreamMediaMetadataCopyWith<$Res> implements $StreamMediaMetadataCopyWith<$Res> {
  factory _$StreamMediaMetadataCopyWith(_StreamMediaMetadata value, $Res Function(_StreamMediaMetadata) _then) = __$StreamMediaMetadataCopyWithImpl;
@override @useResult
$Res call({
 StreamVideoMetadata? video, List<StreamAudioMetadata>? audios, List<StreamSubtitleMetadata>? subtitles, String? thumbnail, String? chapters
});


@override $StreamVideoMetadataCopyWith<$Res>? get video;

}
/// @nodoc
class __$StreamMediaMetadataCopyWithImpl<$Res>
    implements _$StreamMediaMetadataCopyWith<$Res> {
  __$StreamMediaMetadataCopyWithImpl(this._self, this._then);

  final _StreamMediaMetadata _self;
  final $Res Function(_StreamMediaMetadata) _then;

/// Create a copy of StreamMediaMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? video = freezed,Object? audios = freezed,Object? subtitles = freezed,Object? thumbnail = freezed,Object? chapters = freezed,}) {
  return _then(_StreamMediaMetadata(
video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as StreamVideoMetadata?,audios: freezed == audios ? _self._audios : audios // ignore: cast_nullable_to_non_nullable
as List<StreamAudioMetadata>?,subtitles: freezed == subtitles ? _self._subtitles : subtitles // ignore: cast_nullable_to_non_nullable
as List<StreamSubtitleMetadata>?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,chapters: freezed == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of StreamMediaMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreamVideoMetadataCopyWith<$Res>? get video {
    if (_self.video == null) {
    return null;
  }

  return $StreamVideoMetadataCopyWith<$Res>(_self.video!, (value) {
    return _then(_self.copyWith(video: value));
  });
}
}


/// @nodoc
mixin _$StreamVideoMetadata {

 int? get index; String? get codecType; String? get codec; int? get width; int? get height; String? get frameRate; String? get pixelFormat; String? get bitrate; String? get duration; int? get totalChunks; String? get fileName; String? get opensubtitlesHash; int? get size; String? get title; Map<String, dynamic>? get titleData;
/// Create a copy of StreamVideoMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamVideoMetadataCopyWith<StreamVideoMetadata> get copyWith => _$StreamVideoMetadataCopyWithImpl<StreamVideoMetadata>(this as StreamVideoMetadata, _$identity);

  /// Serializes this StreamVideoMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamVideoMetadata&&(identical(other.index, index) || other.index == index)&&(identical(other.codecType, codecType) || other.codecType == codecType)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.frameRate, frameRate) || other.frameRate == frameRate)&&(identical(other.pixelFormat, pixelFormat) || other.pixelFormat == pixelFormat)&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.totalChunks, totalChunks) || other.totalChunks == totalChunks)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.opensubtitlesHash, opensubtitlesHash) || other.opensubtitlesHash == opensubtitlesHash)&&(identical(other.size, size) || other.size == size)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.titleData, titleData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,codecType,codec,width,height,frameRate,pixelFormat,bitrate,duration,totalChunks,fileName,opensubtitlesHash,size,title,const DeepCollectionEquality().hash(titleData));

@override
String toString() {
  return 'StreamVideoMetadata(index: $index, codecType: $codecType, codec: $codec, width: $width, height: $height, frameRate: $frameRate, pixelFormat: $pixelFormat, bitrate: $bitrate, duration: $duration, totalChunks: $totalChunks, fileName: $fileName, opensubtitlesHash: $opensubtitlesHash, size: $size, title: $title, titleData: $titleData)';
}


}

/// @nodoc
abstract mixin class $StreamVideoMetadataCopyWith<$Res>  {
  factory $StreamVideoMetadataCopyWith(StreamVideoMetadata value, $Res Function(StreamVideoMetadata) _then) = _$StreamVideoMetadataCopyWithImpl;
@useResult
$Res call({
 int? index, String? codecType, String? codec, int? width, int? height, String? frameRate, String? pixelFormat, String? bitrate, String? duration, int? totalChunks, String? fileName, String? opensubtitlesHash, int? size, String? title, Map<String, dynamic>? titleData
});




}
/// @nodoc
class _$StreamVideoMetadataCopyWithImpl<$Res>
    implements $StreamVideoMetadataCopyWith<$Res> {
  _$StreamVideoMetadataCopyWithImpl(this._self, this._then);

  final StreamVideoMetadata _self;
  final $Res Function(StreamVideoMetadata) _then;

/// Create a copy of StreamVideoMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = freezed,Object? codecType = freezed,Object? codec = freezed,Object? width = freezed,Object? height = freezed,Object? frameRate = freezed,Object? pixelFormat = freezed,Object? bitrate = freezed,Object? duration = freezed,Object? totalChunks = freezed,Object? fileName = freezed,Object? opensubtitlesHash = freezed,Object? size = freezed,Object? title = freezed,Object? titleData = freezed,}) {
  return _then(_self.copyWith(
index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,codecType: freezed == codecType ? _self.codecType : codecType // ignore: cast_nullable_to_non_nullable
as String?,codec: freezed == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,frameRate: freezed == frameRate ? _self.frameRate : frameRate // ignore: cast_nullable_to_non_nullable
as String?,pixelFormat: freezed == pixelFormat ? _self.pixelFormat : pixelFormat // ignore: cast_nullable_to_non_nullable
as String?,bitrate: freezed == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,totalChunks: freezed == totalChunks ? _self.totalChunks : totalChunks // ignore: cast_nullable_to_non_nullable
as int?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,opensubtitlesHash: freezed == opensubtitlesHash ? _self.opensubtitlesHash : opensubtitlesHash // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titleData: freezed == titleData ? _self.titleData : titleData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [StreamVideoMetadata].
extension StreamVideoMetadataPatterns on StreamVideoMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreamVideoMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreamVideoMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreamVideoMetadata value)  $default,){
final _that = this;
switch (_that) {
case _StreamVideoMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreamVideoMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _StreamVideoMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? index,  String? codecType,  String? codec,  int? width,  int? height,  String? frameRate,  String? pixelFormat,  String? bitrate,  String? duration,  int? totalChunks,  String? fileName,  String? opensubtitlesHash,  int? size,  String? title,  Map<String, dynamic>? titleData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StreamVideoMetadata() when $default != null:
return $default(_that.index,_that.codecType,_that.codec,_that.width,_that.height,_that.frameRate,_that.pixelFormat,_that.bitrate,_that.duration,_that.totalChunks,_that.fileName,_that.opensubtitlesHash,_that.size,_that.title,_that.titleData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? index,  String? codecType,  String? codec,  int? width,  int? height,  String? frameRate,  String? pixelFormat,  String? bitrate,  String? duration,  int? totalChunks,  String? fileName,  String? opensubtitlesHash,  int? size,  String? title,  Map<String, dynamic>? titleData)  $default,) {final _that = this;
switch (_that) {
case _StreamVideoMetadata():
return $default(_that.index,_that.codecType,_that.codec,_that.width,_that.height,_that.frameRate,_that.pixelFormat,_that.bitrate,_that.duration,_that.totalChunks,_that.fileName,_that.opensubtitlesHash,_that.size,_that.title,_that.titleData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? index,  String? codecType,  String? codec,  int? width,  int? height,  String? frameRate,  String? pixelFormat,  String? bitrate,  String? duration,  int? totalChunks,  String? fileName,  String? opensubtitlesHash,  int? size,  String? title,  Map<String, dynamic>? titleData)?  $default,) {final _that = this;
switch (_that) {
case _StreamVideoMetadata() when $default != null:
return $default(_that.index,_that.codecType,_that.codec,_that.width,_that.height,_that.frameRate,_that.pixelFormat,_that.bitrate,_that.duration,_that.totalChunks,_that.fileName,_that.opensubtitlesHash,_that.size,_that.title,_that.titleData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StreamVideoMetadata implements StreamVideoMetadata {
  const _StreamVideoMetadata({this.index, this.codecType, this.codec, this.width, this.height, this.frameRate, this.pixelFormat, this.bitrate, this.duration, this.totalChunks, this.fileName, this.opensubtitlesHash, this.size, this.title, final  Map<String, dynamic>? titleData}): _titleData = titleData;
  factory _StreamVideoMetadata.fromJson(Map<String, dynamic> json) => _$StreamVideoMetadataFromJson(json);

@override final  int? index;
@override final  String? codecType;
@override final  String? codec;
@override final  int? width;
@override final  int? height;
@override final  String? frameRate;
@override final  String? pixelFormat;
@override final  String? bitrate;
@override final  String? duration;
@override final  int? totalChunks;
@override final  String? fileName;
@override final  String? opensubtitlesHash;
@override final  int? size;
@override final  String? title;
 final  Map<String, dynamic>? _titleData;
@override Map<String, dynamic>? get titleData {
  final value = _titleData;
  if (value == null) return null;
  if (_titleData is EqualUnmodifiableMapView) return _titleData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of StreamVideoMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreamVideoMetadataCopyWith<_StreamVideoMetadata> get copyWith => __$StreamVideoMetadataCopyWithImpl<_StreamVideoMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamVideoMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreamVideoMetadata&&(identical(other.index, index) || other.index == index)&&(identical(other.codecType, codecType) || other.codecType == codecType)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.frameRate, frameRate) || other.frameRate == frameRate)&&(identical(other.pixelFormat, pixelFormat) || other.pixelFormat == pixelFormat)&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.totalChunks, totalChunks) || other.totalChunks == totalChunks)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.opensubtitlesHash, opensubtitlesHash) || other.opensubtitlesHash == opensubtitlesHash)&&(identical(other.size, size) || other.size == size)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._titleData, _titleData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,codecType,codec,width,height,frameRate,pixelFormat,bitrate,duration,totalChunks,fileName,opensubtitlesHash,size,title,const DeepCollectionEquality().hash(_titleData));

@override
String toString() {
  return 'StreamVideoMetadata(index: $index, codecType: $codecType, codec: $codec, width: $width, height: $height, frameRate: $frameRate, pixelFormat: $pixelFormat, bitrate: $bitrate, duration: $duration, totalChunks: $totalChunks, fileName: $fileName, opensubtitlesHash: $opensubtitlesHash, size: $size, title: $title, titleData: $titleData)';
}


}

/// @nodoc
abstract mixin class _$StreamVideoMetadataCopyWith<$Res> implements $StreamVideoMetadataCopyWith<$Res> {
  factory _$StreamVideoMetadataCopyWith(_StreamVideoMetadata value, $Res Function(_StreamVideoMetadata) _then) = __$StreamVideoMetadataCopyWithImpl;
@override @useResult
$Res call({
 int? index, String? codecType, String? codec, int? width, int? height, String? frameRate, String? pixelFormat, String? bitrate, String? duration, int? totalChunks, String? fileName, String? opensubtitlesHash, int? size, String? title, Map<String, dynamic>? titleData
});




}
/// @nodoc
class __$StreamVideoMetadataCopyWithImpl<$Res>
    implements _$StreamVideoMetadataCopyWith<$Res> {
  __$StreamVideoMetadataCopyWithImpl(this._self, this._then);

  final _StreamVideoMetadata _self;
  final $Res Function(_StreamVideoMetadata) _then;

/// Create a copy of StreamVideoMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = freezed,Object? codecType = freezed,Object? codec = freezed,Object? width = freezed,Object? height = freezed,Object? frameRate = freezed,Object? pixelFormat = freezed,Object? bitrate = freezed,Object? duration = freezed,Object? totalChunks = freezed,Object? fileName = freezed,Object? opensubtitlesHash = freezed,Object? size = freezed,Object? title = freezed,Object? titleData = freezed,}) {
  return _then(_StreamVideoMetadata(
index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,codecType: freezed == codecType ? _self.codecType : codecType // ignore: cast_nullable_to_non_nullable
as String?,codec: freezed == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,frameRate: freezed == frameRate ? _self.frameRate : frameRate // ignore: cast_nullable_to_non_nullable
as String?,pixelFormat: freezed == pixelFormat ? _self.pixelFormat : pixelFormat // ignore: cast_nullable_to_non_nullable
as String?,bitrate: freezed == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,totalChunks: freezed == totalChunks ? _self.totalChunks : totalChunks // ignore: cast_nullable_to_non_nullable
as int?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,opensubtitlesHash: freezed == opensubtitlesHash ? _self.opensubtitlesHash : opensubtitlesHash // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titleData: freezed == titleData ? _self._titleData : titleData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$StreamAudioMetadata {

 int? get index; String? get codecType; String? get codec;@JsonKey(name: 'default') bool? get isDefault; String? get sampleRate; int? get channels; String? get channelLayout; String? get language; String? get languageFull; String? get title;
/// Create a copy of StreamAudioMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamAudioMetadataCopyWith<StreamAudioMetadata> get copyWith => _$StreamAudioMetadataCopyWithImpl<StreamAudioMetadata>(this as StreamAudioMetadata, _$identity);

  /// Serializes this StreamAudioMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamAudioMetadata&&(identical(other.index, index) || other.index == index)&&(identical(other.codecType, codecType) || other.codecType == codecType)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.sampleRate, sampleRate) || other.sampleRate == sampleRate)&&(identical(other.channels, channels) || other.channels == channels)&&(identical(other.channelLayout, channelLayout) || other.channelLayout == channelLayout)&&(identical(other.language, language) || other.language == language)&&(identical(other.languageFull, languageFull) || other.languageFull == languageFull)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,codecType,codec,isDefault,sampleRate,channels,channelLayout,language,languageFull,title);

@override
String toString() {
  return 'StreamAudioMetadata(index: $index, codecType: $codecType, codec: $codec, isDefault: $isDefault, sampleRate: $sampleRate, channels: $channels, channelLayout: $channelLayout, language: $language, languageFull: $languageFull, title: $title)';
}


}

/// @nodoc
abstract mixin class $StreamAudioMetadataCopyWith<$Res>  {
  factory $StreamAudioMetadataCopyWith(StreamAudioMetadata value, $Res Function(StreamAudioMetadata) _then) = _$StreamAudioMetadataCopyWithImpl;
@useResult
$Res call({
 int? index, String? codecType, String? codec,@JsonKey(name: 'default') bool? isDefault, String? sampleRate, int? channels, String? channelLayout, String? language, String? languageFull, String? title
});




}
/// @nodoc
class _$StreamAudioMetadataCopyWithImpl<$Res>
    implements $StreamAudioMetadataCopyWith<$Res> {
  _$StreamAudioMetadataCopyWithImpl(this._self, this._then);

  final StreamAudioMetadata _self;
  final $Res Function(StreamAudioMetadata) _then;

/// Create a copy of StreamAudioMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = freezed,Object? codecType = freezed,Object? codec = freezed,Object? isDefault = freezed,Object? sampleRate = freezed,Object? channels = freezed,Object? channelLayout = freezed,Object? language = freezed,Object? languageFull = freezed,Object? title = freezed,}) {
  return _then(_self.copyWith(
index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,codecType: freezed == codecType ? _self.codecType : codecType // ignore: cast_nullable_to_non_nullable
as String?,codec: freezed == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String?,isDefault: freezed == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool?,sampleRate: freezed == sampleRate ? _self.sampleRate : sampleRate // ignore: cast_nullable_to_non_nullable
as String?,channels: freezed == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as int?,channelLayout: freezed == channelLayout ? _self.channelLayout : channelLayout // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,languageFull: freezed == languageFull ? _self.languageFull : languageFull // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StreamAudioMetadata].
extension StreamAudioMetadataPatterns on StreamAudioMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreamAudioMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreamAudioMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreamAudioMetadata value)  $default,){
final _that = this;
switch (_that) {
case _StreamAudioMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreamAudioMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _StreamAudioMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? index,  String? codecType,  String? codec, @JsonKey(name: 'default')  bool? isDefault,  String? sampleRate,  int? channels,  String? channelLayout,  String? language,  String? languageFull,  String? title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StreamAudioMetadata() when $default != null:
return $default(_that.index,_that.codecType,_that.codec,_that.isDefault,_that.sampleRate,_that.channels,_that.channelLayout,_that.language,_that.languageFull,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? index,  String? codecType,  String? codec, @JsonKey(name: 'default')  bool? isDefault,  String? sampleRate,  int? channels,  String? channelLayout,  String? language,  String? languageFull,  String? title)  $default,) {final _that = this;
switch (_that) {
case _StreamAudioMetadata():
return $default(_that.index,_that.codecType,_that.codec,_that.isDefault,_that.sampleRate,_that.channels,_that.channelLayout,_that.language,_that.languageFull,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? index,  String? codecType,  String? codec, @JsonKey(name: 'default')  bool? isDefault,  String? sampleRate,  int? channels,  String? channelLayout,  String? language,  String? languageFull,  String? title)?  $default,) {final _that = this;
switch (_that) {
case _StreamAudioMetadata() when $default != null:
return $default(_that.index,_that.codecType,_that.codec,_that.isDefault,_that.sampleRate,_that.channels,_that.channelLayout,_that.language,_that.languageFull,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StreamAudioMetadata implements StreamAudioMetadata {
  const _StreamAudioMetadata({this.index, this.codecType, this.codec, @JsonKey(name: 'default') this.isDefault, this.sampleRate, this.channels, this.channelLayout, this.language, this.languageFull, this.title});
  factory _StreamAudioMetadata.fromJson(Map<String, dynamic> json) => _$StreamAudioMetadataFromJson(json);

@override final  int? index;
@override final  String? codecType;
@override final  String? codec;
@override@JsonKey(name: 'default') final  bool? isDefault;
@override final  String? sampleRate;
@override final  int? channels;
@override final  String? channelLayout;
@override final  String? language;
@override final  String? languageFull;
@override final  String? title;

/// Create a copy of StreamAudioMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreamAudioMetadataCopyWith<_StreamAudioMetadata> get copyWith => __$StreamAudioMetadataCopyWithImpl<_StreamAudioMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamAudioMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreamAudioMetadata&&(identical(other.index, index) || other.index == index)&&(identical(other.codecType, codecType) || other.codecType == codecType)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.sampleRate, sampleRate) || other.sampleRate == sampleRate)&&(identical(other.channels, channels) || other.channels == channels)&&(identical(other.channelLayout, channelLayout) || other.channelLayout == channelLayout)&&(identical(other.language, language) || other.language == language)&&(identical(other.languageFull, languageFull) || other.languageFull == languageFull)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,codecType,codec,isDefault,sampleRate,channels,channelLayout,language,languageFull,title);

@override
String toString() {
  return 'StreamAudioMetadata(index: $index, codecType: $codecType, codec: $codec, isDefault: $isDefault, sampleRate: $sampleRate, channels: $channels, channelLayout: $channelLayout, language: $language, languageFull: $languageFull, title: $title)';
}


}

/// @nodoc
abstract mixin class _$StreamAudioMetadataCopyWith<$Res> implements $StreamAudioMetadataCopyWith<$Res> {
  factory _$StreamAudioMetadataCopyWith(_StreamAudioMetadata value, $Res Function(_StreamAudioMetadata) _then) = __$StreamAudioMetadataCopyWithImpl;
@override @useResult
$Res call({
 int? index, String? codecType, String? codec,@JsonKey(name: 'default') bool? isDefault, String? sampleRate, int? channels, String? channelLayout, String? language, String? languageFull, String? title
});




}
/// @nodoc
class __$StreamAudioMetadataCopyWithImpl<$Res>
    implements _$StreamAudioMetadataCopyWith<$Res> {
  __$StreamAudioMetadataCopyWithImpl(this._self, this._then);

  final _StreamAudioMetadata _self;
  final $Res Function(_StreamAudioMetadata) _then;

/// Create a copy of StreamAudioMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = freezed,Object? codecType = freezed,Object? codec = freezed,Object? isDefault = freezed,Object? sampleRate = freezed,Object? channels = freezed,Object? channelLayout = freezed,Object? language = freezed,Object? languageFull = freezed,Object? title = freezed,}) {
  return _then(_StreamAudioMetadata(
index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,codecType: freezed == codecType ? _self.codecType : codecType // ignore: cast_nullable_to_non_nullable
as String?,codec: freezed == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String?,isDefault: freezed == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool?,sampleRate: freezed == sampleRate ? _self.sampleRate : sampleRate // ignore: cast_nullable_to_non_nullable
as String?,channels: freezed == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as int?,channelLayout: freezed == channelLayout ? _self.channelLayout : channelLayout // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,languageFull: freezed == languageFull ? _self.languageFull : languageFull // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StreamSubtitleMetadata {

 int? get index; String? get codecType; String? get codec;@JsonKey(name: 'default') bool? get isDefault; String? get language; String? get languageFull; String? get title;
/// Create a copy of StreamSubtitleMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamSubtitleMetadataCopyWith<StreamSubtitleMetadata> get copyWith => _$StreamSubtitleMetadataCopyWithImpl<StreamSubtitleMetadata>(this as StreamSubtitleMetadata, _$identity);

  /// Serializes this StreamSubtitleMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamSubtitleMetadata&&(identical(other.index, index) || other.index == index)&&(identical(other.codecType, codecType) || other.codecType == codecType)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.language, language) || other.language == language)&&(identical(other.languageFull, languageFull) || other.languageFull == languageFull)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,codecType,codec,isDefault,language,languageFull,title);

@override
String toString() {
  return 'StreamSubtitleMetadata(index: $index, codecType: $codecType, codec: $codec, isDefault: $isDefault, language: $language, languageFull: $languageFull, title: $title)';
}


}

/// @nodoc
abstract mixin class $StreamSubtitleMetadataCopyWith<$Res>  {
  factory $StreamSubtitleMetadataCopyWith(StreamSubtitleMetadata value, $Res Function(StreamSubtitleMetadata) _then) = _$StreamSubtitleMetadataCopyWithImpl;
@useResult
$Res call({
 int? index, String? codecType, String? codec,@JsonKey(name: 'default') bool? isDefault, String? language, String? languageFull, String? title
});




}
/// @nodoc
class _$StreamSubtitleMetadataCopyWithImpl<$Res>
    implements $StreamSubtitleMetadataCopyWith<$Res> {
  _$StreamSubtitleMetadataCopyWithImpl(this._self, this._then);

  final StreamSubtitleMetadata _self;
  final $Res Function(StreamSubtitleMetadata) _then;

/// Create a copy of StreamSubtitleMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = freezed,Object? codecType = freezed,Object? codec = freezed,Object? isDefault = freezed,Object? language = freezed,Object? languageFull = freezed,Object? title = freezed,}) {
  return _then(_self.copyWith(
index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,codecType: freezed == codecType ? _self.codecType : codecType // ignore: cast_nullable_to_non_nullable
as String?,codec: freezed == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String?,isDefault: freezed == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,languageFull: freezed == languageFull ? _self.languageFull : languageFull // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StreamSubtitleMetadata].
extension StreamSubtitleMetadataPatterns on StreamSubtitleMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreamSubtitleMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreamSubtitleMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreamSubtitleMetadata value)  $default,){
final _that = this;
switch (_that) {
case _StreamSubtitleMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreamSubtitleMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _StreamSubtitleMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? index,  String? codecType,  String? codec, @JsonKey(name: 'default')  bool? isDefault,  String? language,  String? languageFull,  String? title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StreamSubtitleMetadata() when $default != null:
return $default(_that.index,_that.codecType,_that.codec,_that.isDefault,_that.language,_that.languageFull,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? index,  String? codecType,  String? codec, @JsonKey(name: 'default')  bool? isDefault,  String? language,  String? languageFull,  String? title)  $default,) {final _that = this;
switch (_that) {
case _StreamSubtitleMetadata():
return $default(_that.index,_that.codecType,_that.codec,_that.isDefault,_that.language,_that.languageFull,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? index,  String? codecType,  String? codec, @JsonKey(name: 'default')  bool? isDefault,  String? language,  String? languageFull,  String? title)?  $default,) {final _that = this;
switch (_that) {
case _StreamSubtitleMetadata() when $default != null:
return $default(_that.index,_that.codecType,_that.codec,_that.isDefault,_that.language,_that.languageFull,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StreamSubtitleMetadata implements StreamSubtitleMetadata {
  const _StreamSubtitleMetadata({this.index, this.codecType, this.codec, @JsonKey(name: 'default') this.isDefault, this.language, this.languageFull, this.title});
  factory _StreamSubtitleMetadata.fromJson(Map<String, dynamic> json) => _$StreamSubtitleMetadataFromJson(json);

@override final  int? index;
@override final  String? codecType;
@override final  String? codec;
@override@JsonKey(name: 'default') final  bool? isDefault;
@override final  String? language;
@override final  String? languageFull;
@override final  String? title;

/// Create a copy of StreamSubtitleMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreamSubtitleMetadataCopyWith<_StreamSubtitleMetadata> get copyWith => __$StreamSubtitleMetadataCopyWithImpl<_StreamSubtitleMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamSubtitleMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreamSubtitleMetadata&&(identical(other.index, index) || other.index == index)&&(identical(other.codecType, codecType) || other.codecType == codecType)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.language, language) || other.language == language)&&(identical(other.languageFull, languageFull) || other.languageFull == languageFull)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,codecType,codec,isDefault,language,languageFull,title);

@override
String toString() {
  return 'StreamSubtitleMetadata(index: $index, codecType: $codecType, codec: $codec, isDefault: $isDefault, language: $language, languageFull: $languageFull, title: $title)';
}


}

/// @nodoc
abstract mixin class _$StreamSubtitleMetadataCopyWith<$Res> implements $StreamSubtitleMetadataCopyWith<$Res> {
  factory _$StreamSubtitleMetadataCopyWith(_StreamSubtitleMetadata value, $Res Function(_StreamSubtitleMetadata) _then) = __$StreamSubtitleMetadataCopyWithImpl;
@override @useResult
$Res call({
 int? index, String? codecType, String? codec,@JsonKey(name: 'default') bool? isDefault, String? language, String? languageFull, String? title
});




}
/// @nodoc
class __$StreamSubtitleMetadataCopyWithImpl<$Res>
    implements _$StreamSubtitleMetadataCopyWith<$Res> {
  __$StreamSubtitleMetadataCopyWithImpl(this._self, this._then);

  final _StreamSubtitleMetadata _self;
  final $Res Function(_StreamSubtitleMetadata) _then;

/// Create a copy of StreamSubtitleMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = freezed,Object? codecType = freezed,Object? codec = freezed,Object? isDefault = freezed,Object? language = freezed,Object? languageFull = freezed,Object? title = freezed,}) {
  return _then(_StreamSubtitleMetadata(
index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,codecType: freezed == codecType ? _self.codecType : codecType // ignore: cast_nullable_to_non_nullable
as String?,codec: freezed == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String?,isDefault: freezed == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,languageFull: freezed == languageFull ? _self.languageFull : languageFull // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
