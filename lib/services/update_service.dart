import 'dart:async';
import 'dart:math';
import 'package:atba/models/downloadable_item.dart';
import 'package:atba/models/torrent.dart';
import 'package:atba/models/usenet.dart';
import 'package:atba/models/webdownload.dart';
import 'package:atba/services/torbox_service.dart';

/// A service dedicated to providing real-time streams of item updates.
class UpdateService {
  final TorboxAPI _apiService;
  UpdateService(this._apiService);

  /// Returns a stream of updates for a specific downloadable item.
  ///
  /// The stream will periodically fetch the item's status from the API,
  /// emit the updated item, and automatically close when the item is
  /// no longer active (e.g., download completes) or if an error occurs.
  Stream<Map<String, dynamic>> monitorItem<T extends DownloadableItem>(int itemId) async* {
    while (true) {
      try {
        yield {"type": "updating"}; // Emit updating status
        final response = await (() async {
          
          // Determine which API endpoint to call based on the generic type T
          switch (T) {
            case const (Torrent):
              return _apiService.getTorrentsList(torrentId: itemId, bypassCache: true);
            case const (WebDownload):
              return _apiService.getWebDownloadsList(webId: itemId, bypassCache: true);
            case const (Usenet):
              return _apiService.getUsenetDownloadsList(usenetId: itemId, bypassCache: true);
            default:
              throw Exception("Unsupported type for monitoring: $T");
          }
        })();

        if (!response.success || response.data == null) {
          break; // Stop the stream on API error
        }

        // Create the specific item type from the response
        final updatedItem = (() {
          switch (T) {
            case const (Torrent):
              return Torrent.fromJson(response.data) as T;
            case const (WebDownload):
              return WebDownload.fromJson(response.data) as T;
            case const (Usenet):
              return Usenet.fromJson(response.data) as T;
            default:
              throw Exception("Cannot create fromJson for type: $T");
          }
        })();

        yield {"type": "updated", "updatedItem": updatedItem}; // Emit the latest version of the item.

        // If the item is done, break the loop to close the stream.
        if (updatedItem.progress >= 1 || !updatedItem.active) {
          break;
        }

        // Use your exponential backoff logic for the delay
        final age = DateTime.now().difference(updatedItem.updatedAt);
        final int seconds =
            max(5, min(60, 5 + 55 * (1 - exp(-age.inSeconds / 5945)).floor()));
        
        await Future.delayed(Duration(seconds: seconds));

      } catch (e) {
        break; // On any exception, stop the stream.
      }
    }
  }
}
