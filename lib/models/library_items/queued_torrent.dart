import 'package:atba/models/library_items/downloadable_item.dart';
import 'package:atba/models/library_items/library_item.dart';
import 'package:atba/models/library_items/torrent.dart';
import 'package:atba/models/torbox_api_response.dart';
import 'package:atba/services/torbox_service.dart';
import 'package:json_annotation/json_annotation.dart';
part 'queued_torrent.g.dart';

@JsonSerializable()
class QueuedTorrent extends LibraryItem {
  // Technically not downloadable though
  final String? magnet;
  final String? torrentFileLink;
  final String hash;
  final String? type;
  TorrentStatus status = TorrentStatus.idle;

  QueuedTorrent({
    required super.id,
    required super.name,
    required super.createdAt,
    this.magnet,
    this.torrentFileLink,
    required this.hash,
    this.type,
  }) : super(
         updatedAt: createdAt,
         size: 0,
         active: false,
         authId: '',
         downloadState: '',
         progress: 0,
         downloadSpeed: 0,
         uploadSpeed: 0,
         eta: 0,
         torrentFile: null,
         expiresAt: null,
         downloadPresent: false,
         downloadFinished: false,
         inactiveCheck: null,
         availability: null,
       );

  factory QueuedTorrent.fromJson(Map<String, dynamic> json) {
    return QueuedTorrent(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      magnet: json['magnet'] as String?,
      torrentFileLink: json['torrent_file'] as String?,
      hash: json['hash'] as String,
      name: json['name'] as String,
      type: json['type'] as String?,
    );
  }

  factory QueuedTorrent.fromJsonStub(Map<String, dynamic> json) {
    // e.g. when created
    return QueuedTorrent(
      id: json['queued_id'] as int,
      hash: json['hash'] as String,
      name: json['name'] as String,
      createdAt: DateTime.now(),
    );
  }

  factory QueuedTorrent.fromJsonGenerated(Map<String, dynamic> json) =>
      _$QueuedTorrentFromJson(json);
  @override
  Map<String, dynamic> toJsonGenerated() => _$QueuedTorrentToJson(this);

  @override
  Future<TorboxAPIResponse> delete() async {
    status = TorrentStatus.loading;
    final response = await LibraryItem.apiService.controlQueuedItem(
      QueuedItemOperation.delete,
      queuedId: id,
    );
    if (response.success) {
      status = TorrentStatus.success;
    } else {
      status = TorrentStatus.error;
      errorMessage = response.detail;
    }
    return response;
  }

  @override
  Future<TorboxAPIResponse> resume() async {
    status = TorrentStatus.loading;
    final response = await LibraryItem.apiService.controlQueuedItem(
      QueuedItemOperation.start,
      queuedId: id,
    );
    if (response.success) {
      status = TorrentStatus.success;
    } else {
      status = TorrentStatus.error;
      errorMessage = response.detail;
    }
    return response;
  }
}
