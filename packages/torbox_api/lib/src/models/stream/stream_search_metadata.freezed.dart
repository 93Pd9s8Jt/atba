// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stream_search_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StreamSearchMetadata {

 String? get title; List<String>? get titles; List<String>? get keywords; List<String>? get genres; List<String>? get actors;/// Year range, e.g. `20XX-20XX`.
@JsonKey(name: 'releaseYears') String? get releaseYears;@JsonKey(name: 'mediaType') String? get mediaType; List<String>? get characters;@JsonKey(name: 'globalID') String? get globalId; String? get id; String? get link; String? get description; double? get rating; List<String>? get languages;@JsonKey(name: 'contentRating') String? get contentRating; Map<String, dynamic>? get trailer; String? get image;@JsonKey(name: 'isAdult') bool? get isAdult; String? get type;@JsonKey(name: 'releasedDate') String? get releasedDate;@JsonKey(name: 'episodesNumber') int? get episodesNumber; String? get runtime; List<StreamTitleTranslation>? get titlesFull; String? get backdrop;
/// Create a copy of StreamSearchMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamSearchMetadataCopyWith<StreamSearchMetadata> get copyWith => _$StreamSearchMetadataCopyWithImpl<StreamSearchMetadata>(this as StreamSearchMetadata, _$identity);

  /// Serializes this StreamSearchMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamSearchMetadata&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.titles, titles)&&const DeepCollectionEquality().equals(other.keywords, keywords)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.actors, actors)&&(identical(other.releaseYears, releaseYears) || other.releaseYears == releaseYears)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&const DeepCollectionEquality().equals(other.characters, characters)&&(identical(other.globalId, globalId) || other.globalId == globalId)&&(identical(other.id, id) || other.id == id)&&(identical(other.link, link) || other.link == link)&&(identical(other.description, description) || other.description == description)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other.languages, languages)&&(identical(other.contentRating, contentRating) || other.contentRating == contentRating)&&const DeepCollectionEquality().equals(other.trailer, trailer)&&(identical(other.image, image) || other.image == image)&&(identical(other.isAdult, isAdult) || other.isAdult == isAdult)&&(identical(other.type, type) || other.type == type)&&(identical(other.releasedDate, releasedDate) || other.releasedDate == releasedDate)&&(identical(other.episodesNumber, episodesNumber) || other.episodesNumber == episodesNumber)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&const DeepCollectionEquality().equals(other.titlesFull, titlesFull)&&(identical(other.backdrop, backdrop) || other.backdrop == backdrop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,title,const DeepCollectionEquality().hash(titles),const DeepCollectionEquality().hash(keywords),const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(actors),releaseYears,mediaType,const DeepCollectionEquality().hash(characters),globalId,id,link,description,rating,const DeepCollectionEquality().hash(languages),contentRating,const DeepCollectionEquality().hash(trailer),image,isAdult,type,releasedDate,episodesNumber,runtime,const DeepCollectionEquality().hash(titlesFull),backdrop]);

@override
String toString() {
  return 'StreamSearchMetadata(title: $title, titles: $titles, keywords: $keywords, genres: $genres, actors: $actors, releaseYears: $releaseYears, mediaType: $mediaType, characters: $characters, globalId: $globalId, id: $id, link: $link, description: $description, rating: $rating, languages: $languages, contentRating: $contentRating, trailer: $trailer, image: $image, isAdult: $isAdult, type: $type, releasedDate: $releasedDate, episodesNumber: $episodesNumber, runtime: $runtime, titlesFull: $titlesFull, backdrop: $backdrop)';
}


}

/// @nodoc
abstract mixin class $StreamSearchMetadataCopyWith<$Res>  {
  factory $StreamSearchMetadataCopyWith(StreamSearchMetadata value, $Res Function(StreamSearchMetadata) _then) = _$StreamSearchMetadataCopyWithImpl;
@useResult
$Res call({
 String? title, List<String>? titles, List<String>? keywords, List<String>? genres, List<String>? actors,@JsonKey(name: 'releaseYears') String? releaseYears,@JsonKey(name: 'mediaType') String? mediaType, List<String>? characters,@JsonKey(name: 'globalID') String? globalId, String? id, String? link, String? description, double? rating, List<String>? languages,@JsonKey(name: 'contentRating') String? contentRating, Map<String, dynamic>? trailer, String? image,@JsonKey(name: 'isAdult') bool? isAdult, String? type,@JsonKey(name: 'releasedDate') String? releasedDate,@JsonKey(name: 'episodesNumber') int? episodesNumber, String? runtime, List<StreamTitleTranslation>? titlesFull, String? backdrop
});




}
/// @nodoc
class _$StreamSearchMetadataCopyWithImpl<$Res>
    implements $StreamSearchMetadataCopyWith<$Res> {
  _$StreamSearchMetadataCopyWithImpl(this._self, this._then);

  final StreamSearchMetadata _self;
  final $Res Function(StreamSearchMetadata) _then;

/// Create a copy of StreamSearchMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? titles = freezed,Object? keywords = freezed,Object? genres = freezed,Object? actors = freezed,Object? releaseYears = freezed,Object? mediaType = freezed,Object? characters = freezed,Object? globalId = freezed,Object? id = freezed,Object? link = freezed,Object? description = freezed,Object? rating = freezed,Object? languages = freezed,Object? contentRating = freezed,Object? trailer = freezed,Object? image = freezed,Object? isAdult = freezed,Object? type = freezed,Object? releasedDate = freezed,Object? episodesNumber = freezed,Object? runtime = freezed,Object? titlesFull = freezed,Object? backdrop = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titles: freezed == titles ? _self.titles : titles // ignore: cast_nullable_to_non_nullable
as List<String>?,keywords: freezed == keywords ? _self.keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,actors: freezed == actors ? _self.actors : actors // ignore: cast_nullable_to_non_nullable
as List<String>?,releaseYears: freezed == releaseYears ? _self.releaseYears : releaseYears // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,characters: freezed == characters ? _self.characters : characters // ignore: cast_nullable_to_non_nullable
as List<String>?,globalId: freezed == globalId ? _self.globalId : globalId // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,languages: freezed == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>?,contentRating: freezed == contentRating ? _self.contentRating : contentRating // ignore: cast_nullable_to_non_nullable
as String?,trailer: freezed == trailer ? _self.trailer : trailer // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,isAdult: freezed == isAdult ? _self.isAdult : isAdult // ignore: cast_nullable_to_non_nullable
as bool?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,releasedDate: freezed == releasedDate ? _self.releasedDate : releasedDate // ignore: cast_nullable_to_non_nullable
as String?,episodesNumber: freezed == episodesNumber ? _self.episodesNumber : episodesNumber // ignore: cast_nullable_to_non_nullable
as int?,runtime: freezed == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as String?,titlesFull: freezed == titlesFull ? _self.titlesFull : titlesFull // ignore: cast_nullable_to_non_nullable
as List<StreamTitleTranslation>?,backdrop: freezed == backdrop ? _self.backdrop : backdrop // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StreamSearchMetadata].
extension StreamSearchMetadataPatterns on StreamSearchMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreamSearchMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreamSearchMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreamSearchMetadata value)  $default,){
final _that = this;
switch (_that) {
case _StreamSearchMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreamSearchMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _StreamSearchMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  List<String>? titles,  List<String>? keywords,  List<String>? genres,  List<String>? actors, @JsonKey(name: 'releaseYears')  String? releaseYears, @JsonKey(name: 'mediaType')  String? mediaType,  List<String>? characters, @JsonKey(name: 'globalID')  String? globalId,  String? id,  String? link,  String? description,  double? rating,  List<String>? languages, @JsonKey(name: 'contentRating')  String? contentRating,  Map<String, dynamic>? trailer,  String? image, @JsonKey(name: 'isAdult')  bool? isAdult,  String? type, @JsonKey(name: 'releasedDate')  String? releasedDate, @JsonKey(name: 'episodesNumber')  int? episodesNumber,  String? runtime,  List<StreamTitleTranslation>? titlesFull,  String? backdrop)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StreamSearchMetadata() when $default != null:
return $default(_that.title,_that.titles,_that.keywords,_that.genres,_that.actors,_that.releaseYears,_that.mediaType,_that.characters,_that.globalId,_that.id,_that.link,_that.description,_that.rating,_that.languages,_that.contentRating,_that.trailer,_that.image,_that.isAdult,_that.type,_that.releasedDate,_that.episodesNumber,_that.runtime,_that.titlesFull,_that.backdrop);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  List<String>? titles,  List<String>? keywords,  List<String>? genres,  List<String>? actors, @JsonKey(name: 'releaseYears')  String? releaseYears, @JsonKey(name: 'mediaType')  String? mediaType,  List<String>? characters, @JsonKey(name: 'globalID')  String? globalId,  String? id,  String? link,  String? description,  double? rating,  List<String>? languages, @JsonKey(name: 'contentRating')  String? contentRating,  Map<String, dynamic>? trailer,  String? image, @JsonKey(name: 'isAdult')  bool? isAdult,  String? type, @JsonKey(name: 'releasedDate')  String? releasedDate, @JsonKey(name: 'episodesNumber')  int? episodesNumber,  String? runtime,  List<StreamTitleTranslation>? titlesFull,  String? backdrop)  $default,) {final _that = this;
switch (_that) {
case _StreamSearchMetadata():
return $default(_that.title,_that.titles,_that.keywords,_that.genres,_that.actors,_that.releaseYears,_that.mediaType,_that.characters,_that.globalId,_that.id,_that.link,_that.description,_that.rating,_that.languages,_that.contentRating,_that.trailer,_that.image,_that.isAdult,_that.type,_that.releasedDate,_that.episodesNumber,_that.runtime,_that.titlesFull,_that.backdrop);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  List<String>? titles,  List<String>? keywords,  List<String>? genres,  List<String>? actors, @JsonKey(name: 'releaseYears')  String? releaseYears, @JsonKey(name: 'mediaType')  String? mediaType,  List<String>? characters, @JsonKey(name: 'globalID')  String? globalId,  String? id,  String? link,  String? description,  double? rating,  List<String>? languages, @JsonKey(name: 'contentRating')  String? contentRating,  Map<String, dynamic>? trailer,  String? image, @JsonKey(name: 'isAdult')  bool? isAdult,  String? type, @JsonKey(name: 'releasedDate')  String? releasedDate, @JsonKey(name: 'episodesNumber')  int? episodesNumber,  String? runtime,  List<StreamTitleTranslation>? titlesFull,  String? backdrop)?  $default,) {final _that = this;
switch (_that) {
case _StreamSearchMetadata() when $default != null:
return $default(_that.title,_that.titles,_that.keywords,_that.genres,_that.actors,_that.releaseYears,_that.mediaType,_that.characters,_that.globalId,_that.id,_that.link,_that.description,_that.rating,_that.languages,_that.contentRating,_that.trailer,_that.image,_that.isAdult,_that.type,_that.releasedDate,_that.episodesNumber,_that.runtime,_that.titlesFull,_that.backdrop);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StreamSearchMetadata implements StreamSearchMetadata {
  const _StreamSearchMetadata({this.title, final  List<String>? titles, final  List<String>? keywords, final  List<String>? genres, final  List<String>? actors, @JsonKey(name: 'releaseYears') this.releaseYears, @JsonKey(name: 'mediaType') this.mediaType, final  List<String>? characters, @JsonKey(name: 'globalID') this.globalId, this.id, this.link, this.description, this.rating, final  List<String>? languages, @JsonKey(name: 'contentRating') this.contentRating, final  Map<String, dynamic>? trailer, this.image, @JsonKey(name: 'isAdult') this.isAdult, this.type, @JsonKey(name: 'releasedDate') this.releasedDate, @JsonKey(name: 'episodesNumber') this.episodesNumber, this.runtime, final  List<StreamTitleTranslation>? titlesFull, this.backdrop}): _titles = titles,_keywords = keywords,_genres = genres,_actors = actors,_characters = characters,_languages = languages,_trailer = trailer,_titlesFull = titlesFull;
  factory _StreamSearchMetadata.fromJson(Map<String, dynamic> json) => _$StreamSearchMetadataFromJson(json);

@override final  String? title;
 final  List<String>? _titles;
@override List<String>? get titles {
  final value = _titles;
  if (value == null) return null;
  if (_titles is EqualUnmodifiableListView) return _titles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _keywords;
@override List<String>? get keywords {
  final value = _keywords;
  if (value == null) return null;
  if (_keywords is EqualUnmodifiableListView) return _keywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _genres;
@override List<String>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _actors;
@override List<String>? get actors {
  final value = _actors;
  if (value == null) return null;
  if (_actors is EqualUnmodifiableListView) return _actors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Year range, e.g. `20XX-20XX`.
@override@JsonKey(name: 'releaseYears') final  String? releaseYears;
@override@JsonKey(name: 'mediaType') final  String? mediaType;
 final  List<String>? _characters;
@override List<String>? get characters {
  final value = _characters;
  if (value == null) return null;
  if (_characters is EqualUnmodifiableListView) return _characters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'globalID') final  String? globalId;
@override final  String? id;
@override final  String? link;
@override final  String? description;
@override final  double? rating;
 final  List<String>? _languages;
@override List<String>? get languages {
  final value = _languages;
  if (value == null) return null;
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'contentRating') final  String? contentRating;
 final  Map<String, dynamic>? _trailer;
@override Map<String, dynamic>? get trailer {
  final value = _trailer;
  if (value == null) return null;
  if (_trailer is EqualUnmodifiableMapView) return _trailer;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? image;
@override@JsonKey(name: 'isAdult') final  bool? isAdult;
@override final  String? type;
@override@JsonKey(name: 'releasedDate') final  String? releasedDate;
@override@JsonKey(name: 'episodesNumber') final  int? episodesNumber;
@override final  String? runtime;
 final  List<StreamTitleTranslation>? _titlesFull;
@override List<StreamTitleTranslation>? get titlesFull {
  final value = _titlesFull;
  if (value == null) return null;
  if (_titlesFull is EqualUnmodifiableListView) return _titlesFull;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? backdrop;

/// Create a copy of StreamSearchMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreamSearchMetadataCopyWith<_StreamSearchMetadata> get copyWith => __$StreamSearchMetadataCopyWithImpl<_StreamSearchMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamSearchMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreamSearchMetadata&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._titles, _titles)&&const DeepCollectionEquality().equals(other._keywords, _keywords)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._actors, _actors)&&(identical(other.releaseYears, releaseYears) || other.releaseYears == releaseYears)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&const DeepCollectionEquality().equals(other._characters, _characters)&&(identical(other.globalId, globalId) || other.globalId == globalId)&&(identical(other.id, id) || other.id == id)&&(identical(other.link, link) || other.link == link)&&(identical(other.description, description) || other.description == description)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other._languages, _languages)&&(identical(other.contentRating, contentRating) || other.contentRating == contentRating)&&const DeepCollectionEquality().equals(other._trailer, _trailer)&&(identical(other.image, image) || other.image == image)&&(identical(other.isAdult, isAdult) || other.isAdult == isAdult)&&(identical(other.type, type) || other.type == type)&&(identical(other.releasedDate, releasedDate) || other.releasedDate == releasedDate)&&(identical(other.episodesNumber, episodesNumber) || other.episodesNumber == episodesNumber)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&const DeepCollectionEquality().equals(other._titlesFull, _titlesFull)&&(identical(other.backdrop, backdrop) || other.backdrop == backdrop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,title,const DeepCollectionEquality().hash(_titles),const DeepCollectionEquality().hash(_keywords),const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_actors),releaseYears,mediaType,const DeepCollectionEquality().hash(_characters),globalId,id,link,description,rating,const DeepCollectionEquality().hash(_languages),contentRating,const DeepCollectionEquality().hash(_trailer),image,isAdult,type,releasedDate,episodesNumber,runtime,const DeepCollectionEquality().hash(_titlesFull),backdrop]);

@override
String toString() {
  return 'StreamSearchMetadata(title: $title, titles: $titles, keywords: $keywords, genres: $genres, actors: $actors, releaseYears: $releaseYears, mediaType: $mediaType, characters: $characters, globalId: $globalId, id: $id, link: $link, description: $description, rating: $rating, languages: $languages, contentRating: $contentRating, trailer: $trailer, image: $image, isAdult: $isAdult, type: $type, releasedDate: $releasedDate, episodesNumber: $episodesNumber, runtime: $runtime, titlesFull: $titlesFull, backdrop: $backdrop)';
}


}

/// @nodoc
abstract mixin class _$StreamSearchMetadataCopyWith<$Res> implements $StreamSearchMetadataCopyWith<$Res> {
  factory _$StreamSearchMetadataCopyWith(_StreamSearchMetadata value, $Res Function(_StreamSearchMetadata) _then) = __$StreamSearchMetadataCopyWithImpl;
@override @useResult
$Res call({
 String? title, List<String>? titles, List<String>? keywords, List<String>? genres, List<String>? actors,@JsonKey(name: 'releaseYears') String? releaseYears,@JsonKey(name: 'mediaType') String? mediaType, List<String>? characters,@JsonKey(name: 'globalID') String? globalId, String? id, String? link, String? description, double? rating, List<String>? languages,@JsonKey(name: 'contentRating') String? contentRating, Map<String, dynamic>? trailer, String? image,@JsonKey(name: 'isAdult') bool? isAdult, String? type,@JsonKey(name: 'releasedDate') String? releasedDate,@JsonKey(name: 'episodesNumber') int? episodesNumber, String? runtime, List<StreamTitleTranslation>? titlesFull, String? backdrop
});




}
/// @nodoc
class __$StreamSearchMetadataCopyWithImpl<$Res>
    implements _$StreamSearchMetadataCopyWith<$Res> {
  __$StreamSearchMetadataCopyWithImpl(this._self, this._then);

  final _StreamSearchMetadata _self;
  final $Res Function(_StreamSearchMetadata) _then;

/// Create a copy of StreamSearchMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? titles = freezed,Object? keywords = freezed,Object? genres = freezed,Object? actors = freezed,Object? releaseYears = freezed,Object? mediaType = freezed,Object? characters = freezed,Object? globalId = freezed,Object? id = freezed,Object? link = freezed,Object? description = freezed,Object? rating = freezed,Object? languages = freezed,Object? contentRating = freezed,Object? trailer = freezed,Object? image = freezed,Object? isAdult = freezed,Object? type = freezed,Object? releasedDate = freezed,Object? episodesNumber = freezed,Object? runtime = freezed,Object? titlesFull = freezed,Object? backdrop = freezed,}) {
  return _then(_StreamSearchMetadata(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titles: freezed == titles ? _self._titles : titles // ignore: cast_nullable_to_non_nullable
as List<String>?,keywords: freezed == keywords ? _self._keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,actors: freezed == actors ? _self._actors : actors // ignore: cast_nullable_to_non_nullable
as List<String>?,releaseYears: freezed == releaseYears ? _self.releaseYears : releaseYears // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,characters: freezed == characters ? _self._characters : characters // ignore: cast_nullable_to_non_nullable
as List<String>?,globalId: freezed == globalId ? _self.globalId : globalId // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,languages: freezed == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>?,contentRating: freezed == contentRating ? _self.contentRating : contentRating // ignore: cast_nullable_to_non_nullable
as String?,trailer: freezed == trailer ? _self._trailer : trailer // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,isAdult: freezed == isAdult ? _self.isAdult : isAdult // ignore: cast_nullable_to_non_nullable
as bool?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,releasedDate: freezed == releasedDate ? _self.releasedDate : releasedDate // ignore: cast_nullable_to_non_nullable
as String?,episodesNumber: freezed == episodesNumber ? _self.episodesNumber : episodesNumber // ignore: cast_nullable_to_non_nullable
as int?,runtime: freezed == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as String?,titlesFull: freezed == titlesFull ? _self._titlesFull : titlesFull // ignore: cast_nullable_to_non_nullable
as List<StreamTitleTranslation>?,backdrop: freezed == backdrop ? _self.backdrop : backdrop // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StreamTitleTranslation {

 String? get language; String? get title;
/// Create a copy of StreamTitleTranslation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamTitleTranslationCopyWith<StreamTitleTranslation> get copyWith => _$StreamTitleTranslationCopyWithImpl<StreamTitleTranslation>(this as StreamTitleTranslation, _$identity);

  /// Serializes this StreamTitleTranslation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamTitleTranslation&&(identical(other.language, language) || other.language == language)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,language,title);

@override
String toString() {
  return 'StreamTitleTranslation(language: $language, title: $title)';
}


}

/// @nodoc
abstract mixin class $StreamTitleTranslationCopyWith<$Res>  {
  factory $StreamTitleTranslationCopyWith(StreamTitleTranslation value, $Res Function(StreamTitleTranslation) _then) = _$StreamTitleTranslationCopyWithImpl;
@useResult
$Res call({
 String? language, String? title
});




}
/// @nodoc
class _$StreamTitleTranslationCopyWithImpl<$Res>
    implements $StreamTitleTranslationCopyWith<$Res> {
  _$StreamTitleTranslationCopyWithImpl(this._self, this._then);

  final StreamTitleTranslation _self;
  final $Res Function(StreamTitleTranslation) _then;

/// Create a copy of StreamTitleTranslation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? language = freezed,Object? title = freezed,}) {
  return _then(_self.copyWith(
language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StreamTitleTranslation].
extension StreamTitleTranslationPatterns on StreamTitleTranslation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreamTitleTranslation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreamTitleTranslation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreamTitleTranslation value)  $default,){
final _that = this;
switch (_that) {
case _StreamTitleTranslation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreamTitleTranslation value)?  $default,){
final _that = this;
switch (_that) {
case _StreamTitleTranslation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? language,  String? title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StreamTitleTranslation() when $default != null:
return $default(_that.language,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? language,  String? title)  $default,) {final _that = this;
switch (_that) {
case _StreamTitleTranslation():
return $default(_that.language,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? language,  String? title)?  $default,) {final _that = this;
switch (_that) {
case _StreamTitleTranslation() when $default != null:
return $default(_that.language,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StreamTitleTranslation implements StreamTitleTranslation {
  const _StreamTitleTranslation({this.language, this.title});
  factory _StreamTitleTranslation.fromJson(Map<String, dynamic> json) => _$StreamTitleTranslationFromJson(json);

@override final  String? language;
@override final  String? title;

/// Create a copy of StreamTitleTranslation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreamTitleTranslationCopyWith<_StreamTitleTranslation> get copyWith => __$StreamTitleTranslationCopyWithImpl<_StreamTitleTranslation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamTitleTranslationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreamTitleTranslation&&(identical(other.language, language) || other.language == language)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,language,title);

@override
String toString() {
  return 'StreamTitleTranslation(language: $language, title: $title)';
}


}

/// @nodoc
abstract mixin class _$StreamTitleTranslationCopyWith<$Res> implements $StreamTitleTranslationCopyWith<$Res> {
  factory _$StreamTitleTranslationCopyWith(_StreamTitleTranslation value, $Res Function(_StreamTitleTranslation) _then) = __$StreamTitleTranslationCopyWithImpl;
@override @useResult
$Res call({
 String? language, String? title
});




}
/// @nodoc
class __$StreamTitleTranslationCopyWithImpl<$Res>
    implements _$StreamTitleTranslationCopyWith<$Res> {
  __$StreamTitleTranslationCopyWithImpl(this._self, this._then);

  final _StreamTitleTranslation _self;
  final $Res Function(_StreamTitleTranslation) _then;

/// Create a copy of StreamTitleTranslation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? language = freezed,Object? title = freezed,}) {
  return _then(_StreamTitleTranslation(
language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
