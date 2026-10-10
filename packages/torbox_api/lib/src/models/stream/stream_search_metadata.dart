import 'package:freezed_annotation/freezed_annotation.dart';

part 'stream_search_metadata.freezed.dart';
part 'stream_search_metadata.g.dart';

/// Media search metadata attached to a stream, used by the Stremio addon
/// for scrobbling and description building.
///
/// This data is derived from media recognition and may be partial or
/// absent for unrecognized files; all fields are therefore nullable.
@freezed
abstract class StreamSearchMetadata with _$StreamSearchMetadata {
  const factory StreamSearchMetadata({
    String? title,
    List<String>? titles,
    List<String>? keywords,
    List<String>? genres,
    List<String>? actors,

    /// Year range, e.g. `20XX-20XX`.
    @JsonKey(name: 'releaseYears') String? releaseYears,
    @JsonKey(name: 'mediaType') String? mediaType,
    List<String>? characters,
    @JsonKey(name: 'globalID') String? globalId,
    String? id,
    String? link,
    String? description,
    double? rating,
    List<String>? languages,
    @JsonKey(name: 'contentRating') String? contentRating,
    Map<String, dynamic>? trailer,
    String? image,
    @JsonKey(name: 'isAdult') bool? isAdult,
    String? type,
    @JsonKey(name: 'releasedDate') String? releasedDate,
    @JsonKey(name: 'episodesNumber') int? episodesNumber,
    String? runtime,
    List<StreamTitleTranslation>? titlesFull,
    String? backdrop,
  }) = _StreamSearchMetadata;

  factory StreamSearchMetadata.fromJson(Map<String, dynamic> json) =>
      _$StreamSearchMetadataFromJson(json);
}

/// A localized title variant.
@freezed
abstract class StreamTitleTranslation with _$StreamTitleTranslation {
  const factory StreamTitleTranslation({String? language, String? title}) =
      _StreamTitleTranslation;

  factory StreamTitleTranslation.fromJson(Map<String, dynamic> json) =>
      _$StreamTitleTranslationFromJson(json);
}
