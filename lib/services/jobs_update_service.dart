import 'dart:async';
import 'dart:math';
import 'package:atba/models/torbox_api_response.dart';
import 'package:atba/services/torbox_service.dart';

/// A service dedicated to providing real-time streams of item updates.
class JobsUpdateService {
  final TorboxAPI _apiService;
  static const doneStatuses = {JobQueueStatus.completed, JobQueueStatus.failed};
  JobsUpdateService(this._apiService);

  /// Returns a stream of updates for a specific downloadable item.
  ///
  /// The stream will periodically fetch the item's status from the API,
  /// emit the updated item, and automatically close when the item is
  /// no longer active (e.g., download completes) or if an error occurs.
  Stream<Map<String, dynamic>> monitorJob(int jobId) async* {
    while (true) {
      try {
        yield {"type": "updating"}; // Emit updating status
        final response = await _apiService.getJobStatusById(jobId);

        if (!response.success || response.data == null) {
          break; // Stop the stream on API error
        }

        final updatedItem = JobQueueStatusResponse.fromJson(response.data);

        yield {
          "type": "updated",
          "updatedItem": updatedItem,
        }; // Emit the latest version of the item.

        if (doneStatuses.contains(updatedItem.status)) {
          break;
        }

        // Use your exponential backoff logic for the delay
        final age = DateTime.now().difference(updatedItem.updatedAt);
        final int seconds = max(
          5,
          min(60, 5 + 55 * (1 - exp(-age.inSeconds / 5945)).floor()),
        );

        await Future.delayed(Duration(seconds: seconds));
      } catch (e) {
        break; // On any exception, stop the stream.
      }
    }
  }
}
