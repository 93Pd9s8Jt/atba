import 'package:atba/models/library_items/downloadable_item.dart';
import 'package:atba/models/torbox_api_response.dart';
import 'package:atba/services/torbox_service.dart';

abstract class LibraryItem {
  static late TorboxAPI apiService;

  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int size;
  final bool active;
  final String authId;
  final String downloadState;
  final double progress;
  final int? downloadSpeed;
  final int? uploadSpeed;
  final int eta;
  final bool? torrentFile;
  final DateTime? expiresAt;
  final bool downloadPresent;
  final bool downloadFinished;
  final int? inactiveCheck;
  final num? availability;
  // not part of the API response, but used in the UI
  DownloadableItemStatus? itemStatus;
  String? errorMessage;

  LibraryItem({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.size,
    required this.active,
    required this.authId,
    required this.downloadState,
    required this.progress,
    required this.downloadSpeed,
    required this.uploadSpeed,
    required this.eta,
    required this.torrentFile,
    required this.expiresAt,
    required this.downloadPresent,
    required this.downloadFinished,
    required this.inactiveCheck,
    required this.availability,
    this.itemStatus,
    this.errorMessage,
  });

  static void initApiService(TorboxAPI apiServicee) {
    apiService = apiServicee;
  }

  Future<TorboxAPIResponse> delete();
  Future<TorboxAPIResponse?> stop() async => null;
  Future<TorboxAPIResponse?> resume() async => null;
  Future<TorboxAPIResponse?> start() async => null;
  Future<TorboxAPIResponse?> reannounce() async => null;

  Map<String, dynamic> toJsonGenerated();
}
