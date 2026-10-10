import '../models/common/torbox_request_validation_exception.dart';
import '../models/common/torbox_response.dart';
import '../models/queued/queued_download_data.dart';
import '../net/torbox_client.dart';

/// Queued downloads service.
///
/// Wraps all `/v1/api/queued/*` endpoints. Accessed via [TorboxApi.queued].
class QueuedService {
  final TorboxClient _client;

  QueuedService(this._client);

  /// Get the user's queued downloads.
  Future<TorBoxResponse<List<QueuedDownloadData>>> getQueuedDownloads({
    bool? bypassCache,
    int? id,
    int? offset,
    int? limit,
    String? type,
  }) async {
    final response = await _client.get(
      'api/queued/getqueued',
      queryParams: {
        'bypass_cache': bypassCache,
        'id': id,
        'offset': offset,
        'limit': limit,
        'type': type,
      },
    );
    return queuedDownloadListResponseFromJson(response);
  }

  /// Control a queued download (start or delete).
  ///
  /// Either [queuedId] or [all] must be provided.
  Future<TorBoxResponse<Null>> controlQueuedDownload({
    required String operation,
    int? queuedId,
    bool? all,
  }) async {
    if (queuedId == null && all == null) {
      throw TorboxRequestValidationException(
        'Either queuedId or all must be provided.',
      );
    }
    final response = await _client.post(
      'api/queued/controlqueued',
      body: {'operation': operation, 'queued_id': queuedId, 'all': all},
    );
    return nullResponseFromJson(response);
  }
}
