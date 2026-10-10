// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_search_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StreamSearchMetadata _$StreamSearchMetadataFromJson(
  Map<String, dynamic> json,
) => _StreamSearchMetadata(
  title: json['title'] as String?,
  titles: (json['titles'] as List<dynamic>?)?.map((e) => e as String).toList(),
  keywords: (json['keywords'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  genres: (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
  actors: (json['actors'] as List<dynamic>?)?.map((e) => e as String).toList(),
  releaseYears: json['releaseYears'] as String?,
  mediaType: json['mediaType'] as String?,
  characters: (json['characters'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  globalId: json['globalID'] as String?,
  id: json['id'] as String?,
  link: json['link'] as String?,
  description: json['description'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  languages: (json['languages'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  contentRating: json['contentRating'] as String?,
  trailer: json['trailer'] as Map<String, dynamic>?,
  image: json['image'] as String?,
  isAdult: json['isAdult'] as bool?,
  type: json['type'] as String?,
  releasedDate: json['releasedDate'] as String?,
  episodesNumber: (json['episodesNumber'] as num?)?.toInt(),
  runtime: json['runtime'] as String?,
  titlesFull: (json['titles_full'] as List<dynamic>?)
      ?.map((e) => StreamTitleTranslation.fromJson(e as Map<String, dynamic>))
      .toList(),
  backdrop: json['backdrop'] as String?,
);

Map<String, dynamic> _$StreamSearchMetadataToJson(
  _StreamSearchMetadata instance,
) => <String, dynamic>{
  'title': instance.title,
  'titles': instance.titles,
  'keywords': instance.keywords,
  'genres': instance.genres,
  'actors': instance.actors,
  'releaseYears': instance.releaseYears,
  'mediaType': instance.mediaType,
  'characters': instance.characters,
  'globalID': instance.globalId,
  'id': instance.id,
  'link': instance.link,
  'description': instance.description,
  'rating': instance.rating,
  'languages': instance.languages,
  'contentRating': instance.contentRating,
  'trailer': instance.trailer,
  'image': instance.image,
  'isAdult': instance.isAdult,
  'type': instance.type,
  'releasedDate': instance.releasedDate,
  'episodesNumber': instance.episodesNumber,
  'runtime': instance.runtime,
  'titles_full': instance.titlesFull?.map((e) => e.toJson()).toList(),
  'backdrop': instance.backdrop,
};

_StreamTitleTranslation _$StreamTitleTranslationFromJson(
  Map<String, dynamic> json,
) => _StreamTitleTranslation(
  language: json['language'] as String?,
  title: json['title'] as String?,
);

Map<String, dynamic> _$StreamTitleTranslationToJson(
  _StreamTitleTranslation instance,
) => <String, dynamic>{'language': instance.language, 'title': instance.title};
