import 'package:freezed_annotation/freezed_annotation.dart';

import 'torbox_response.dart';

part 'cached_availability_data.freezed.dart';
part 'cached_availability_data.g.dart';

/// A cached download entry returned by the `/checkcached` endpoints.
///
/// Depending on the `format` query parameter, these entries are returned
/// either keyed by hash (`Map<String, CachedAvailabilityData>`) or as a
/// plain list.
@freezed
abstract class CachedAvailabilityData with _$CachedAvailabilityData {
  const factory CachedAvailabilityData({
    required String name,
    required int size,
    required String hash,

    /// Only present when the request used `list_files=true`.
    List<CachedFileData>? files,
  }) = _CachedAvailabilityData;

  factory CachedAvailabilityData.fromJson(Map<String, dynamic> json) =>
      _$CachedAvailabilityDataFromJson(json);
}

/// A file within a [CachedAvailabilityData] entry.
@freezed
abstract class CachedFileData with _$CachedFileData {
  const factory CachedFileData({
    int? id,
    required String name,
    required int size,
    String? opensubtitlesHash,
    String? shortName,
    String? mimetype,
  }) = _CachedFileData;

  factory CachedFileData.fromJson(Map<String, dynamic> json) =>
      _$CachedFileDataFromJson(json);
}

/// Parses a full API envelope for the `/checkcached` endpoints with
/// `format=list`, whose `data` is a plain list of availability entries.
TorBoxResponse<List<CachedAvailabilityData>>
    cachedAvailabilityListResponseFromJson(Map<String, dynamic> json) =>
        TorBoxResponse.fromJson(
          json,
          (data) => (data as List<dynamic>)
              .map(
                (e) =>
                    CachedAvailabilityData.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        );

/// Parses a full API envelope for the `/checkcached` endpoints, whose
/// `data` maps hashes to availability entries.
TorBoxResponse<Map<String, CachedAvailabilityData>>
cachedAvailabilityResponseFromJson(Map<String, dynamic> json) =>
    TorBoxResponse.fromJson(
      json,
      (data) => (data as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          CachedAvailabilityData.fromJson(value as Map<String, dynamic>),
        ),
      ),
    );
