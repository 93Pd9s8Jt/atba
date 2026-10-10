import '../models/common/torbox_response.dart';
import '../models/stream/stream_data.dart';
import '../models/stream/stream_info_data.dart';
import '../net/torbox_client.dart';

/// Stream service.
///
/// Wraps the `/v1/api/stream/*` endpoints used for direct streaming
/// playback. Accessed via [TorboxApi.stream].
class StreamService {
  final TorboxClient _client;

  StreamService(this._client);

  /// Create a stream for a download.
  Future<TorBoxResponse<StreamData>> createStream({
    required int id,
    int? fileId,
    String? type,
    int? chosenSubtitleIndex,
    int? chosenAudioIndex,
    int? chosenResolutionIndex,
    bool? scrobblingEnabled,
  }) async {
    final response = await _client.get(
      'api/stream/createstream',
      queryParams: {
        'id': id,
        'file_id': fileId,
        'type': type,
        'chosen_subtitle_index': chosenSubtitleIndex,
        'chosen_audio_index': chosenAudioIndex,
        'chosen_resolution_index': chosenResolutionIndex,
        'scrobbling_enabled': scrobblingEnabled,
      },
    );
    return streamDataResponseFromJson(response);
  }

  /// Get the playback data (HLS URL, tokens, indexes) for a stream.
  Future<TorBoxResponse<StreamInfoData>> getStreamData({
    required String token,
    required String presignedToken,
    int? chosenSubtitleIndex,
    int? chosenAudioIndex,
    int? chosenResolutionIndex,
  }) async {
    final response = await _client.get(
      'api/stream/getstreamdata',
      queryParams: {
        'token': token,
        'presigned_token': presignedToken,
        'chosen_subtitle_index': chosenSubtitleIndex,
        'chosen_audio_index': chosenAudioIndex,
        'chosen_resolution_index': chosenResolutionIndex,
      },
    );
    return streamInfoResponseFromJson(response);
  }
}
