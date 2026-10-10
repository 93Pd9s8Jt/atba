import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_filter.freezed.dart';
part 'dashboard_filter.g.dart';

/// Dashboard filter flags stored in [UserSettings].
@freezed
abstract class DashboardFilter with _$DashboardFilter {
  const factory DashboardFilter({
    bool? active,
    bool? cached,
    bool? queued,
    bool? private,
    bool? borrowed,
    bool? inactive,
    bool? torrents,
    bool? uncached,
    bool? uploading,
    bool? processing,
    bool? downloading,
    @JsonKey(name: 'web_downloads') bool? webDownloads,
    @JsonKey(name: 'download_ready') bool? downloadReady,
    @JsonKey(name: 'usenet_downloads') bool? usenetDownloads,
  }) = _DashboardFilter;

  factory DashboardFilter.fromJson(Map<String, dynamic> json) =>
      _$DashboardFilterFromJson(json);
}
