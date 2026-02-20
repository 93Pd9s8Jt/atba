import 'dart:async';
import 'dart:convert';
import 'package:atba/config/constants.dart';
import 'package:atba/services/stremio_addons/stremio_addon_service.dart';
import 'package:atba/services/stremio_addons/torbox_addon_service.dart';
import 'package:atba/services/stremio_addons/torrentio_service.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../torrentio_config.dart';

class MultiStremioAddonAPI with ChangeNotifier {
  String? apiKey;

  bool isLoading = false;
  List<Map<String, dynamic>> streams = [];
  Map<String, Map<String, dynamic>> selectedStreams = {};
  StreamSubscription<http.Response>? _responseStreamController;

  late List<StremioAddonAPI> _addons;

  MultiStremioAddonAPI(String? apiKey) {
    bool torboxEnabled = Settings.getValue<bool>(
      Constants.torboxAddonEnabled,
      defaultValue: true,
    )!;
    bool torrentioEnabled = Settings.getValue<bool>(
      Constants.torrentioEnabled,
      defaultValue: true,
    )!;
    _addons = [];
    if (torboxEnabled) _addons.add(TorboxAddonAPI(apiKey));
    if (torrentioEnabled) _addons.add(TorrentioAPI(apiKey));
  }

  void setStream(String id, Map<String, dynamic> stream) {
    selectedStreams[id] = stream;
    notifyListeners();
  }

  List<Map<String, dynamic>> _parseStreams(String body) {
    Map<String, dynamic> json = jsonDecode(body);
    List<Map<String, dynamic>> foundStreams = json["streams"]
        .cast<Map<String, dynamic>>();
    return foundStreams;
  }

  void _handleStream(http.Response res, String id) {
    bool streamsWereEmpty = streams.isEmpty;
    List<Map<String, dynamic>> foundStreams = _parseStreams(res.body);
    streams.addAll(foundStreams);
    if (streamsWereEmpty && streams.isNotEmpty) {
      setStream(
        id,
        streams.first,
      ); // first load of results so we need to set a selected stream
    }
  }

  void _handleDone() {
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchStreamData(String id, SearchType type) async {
    // reset data
    streams = [];
    isLoading = true;
    notifyListeners();
    final requests = _addons.map(
      (addon) async => http.get(
        Uri.parse("${addon.constructBaseUrl()}/stream/${type.name}/$id.json"),
      ),
    );

    final Stream<http.Response> responseStream = Stream.fromFutures(
      requests,
    ).where((res) => res.statusCode >= 200 && res.statusCode < 300);

    bool firstReceived = false;
    final firstValueCompleter = Completer<http.Response?>();

    _responseStreamController = responseStream.listen(
      (res) {
        // Handle first matching event
        if (!firstReceived && _parseStreams(res.body).isNotEmpty) {
          firstReceived = true;
          // You can complete a Completer or notify the caller here
          firstValueCompleter.complete(res);
        }

        _handleStream(res, id); // handle all events
      },
      onError: (e) => print('Error: $e'),
      onDone: () {
        if (!firstValueCompleter.isCompleted) {
          firstValueCompleter.complete(null);
        }
        _handleDone();
      },
    );

    // Create a Completer to await the first matching value

    await firstValueCompleter.future;
    return;
  }

  @override
  void dispose() {
    _responseStreamController?.cancel();
    super.dispose();
  }
}
