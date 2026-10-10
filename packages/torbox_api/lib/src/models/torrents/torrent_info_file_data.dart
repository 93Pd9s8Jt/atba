import 'package:freezed_annotation/freezed_annotation.dart';

part 'torrent_info_file_data.freezed.dart';
part 'torrent_info_file_data.g.dart';

/// A file within [TorrentInfoData].
@freezed
abstract class TorrentInfoFileData with _$TorrentInfoFileData {
  const factory TorrentInfoFileData({required String name, required int size}) =
      _TorrentInfoFileData;

  factory TorrentInfoFileData.fromJson(Map<String, dynamic> json) =>
      _$TorrentInfoFileDataFromJson(json);
}
