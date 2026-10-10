import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';

part 'changelog_entry.freezed.dart';
part 'changelog_entry.g.dart';

/// A changelog entry returned by `GET /v1/api/changelogs/json`.
@freezed
abstract class ChangelogEntry with _$ChangelogEntry {
  const factory ChangelogEntry({
    required String name,
    required String html,
    required String markdown,
    required String link,
    required String createdAt,
    required String id,
  }) = _ChangelogEntry;

  factory ChangelogEntry.fromJson(Map<String, dynamic> json) =>
      _$ChangelogEntryFromJson(json);
}

/// Parses a full API envelope for `GET /v1/api/changelogs/json`, whose
/// `data` is a list of changelog entries.
TorBoxResponse<List<ChangelogEntry>> changelogListResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => (data as List<dynamic>)
      .map((e) => ChangelogEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
);
