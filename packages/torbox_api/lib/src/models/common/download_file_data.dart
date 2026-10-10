import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_file_data.freezed.dart';
part 'download_file_data.g.dart';

/// A file belonging to a torrent, Usenet download, or web download item in
/// the `/mylist` endpoints.
///
/// All three download types share the same file structure.
@freezed
abstract class DownloadFileData with _$DownloadFileData {
  const factory DownloadFileData({
    required int id,
    String? md5,
    String? hash,
    required String name,
    required int size,
    @JsonKey(name: 'zipped') bool? zipped,
    String? s3Path,
    bool? infected,
    String? mimetype,
    String? shortName,
    String? absolutePath,
    String? opensubtitlesHash,
  }) = _DownloadFileData;

  factory DownloadFileData.fromJson(Map<String, dynamic> json) =>
      _$DownloadFileDataFromJson(json);
}
