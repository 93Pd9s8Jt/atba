import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'secure_storage_service.dart';
import 'torrentio_config.dart';

class TorrentioAPI with ChangeNotifier {
  final SecureStorageService secureStorageService;
  String? apiKey;
  String? url;

  bool isLoading = false;
  Map<String, dynamic> streamData = {};
  Map<String, Map<String, dynamic>> selectedStreams = {};

  TorrentioAPI(this.secureStorageService) {
    _init();
  }

  Future<void> _init() async {
    apiKey = await secureStorageService.read('api_key');
  }

  String _constructBaseUrl() {
    return 'https://torrentio.strem.fun/providers=${TorrentioConfig.CSPROVIDERS}%7Csort=${TorrentioConfig.SORTBY}%7Clanguage=${TorrentioConfig.CSLANGUAGES}%7Cqualityfilter=${TorrentioConfig.CSQUALITIES}%7climit=${TorrentioConfig.NUMBERPERQUALITYLIMIT}%7Csizefilter=${TorrentioConfig.SIZELIMIT}%7Ctorbox=$apiKey';
  }

  void setStream(String id, Map<String, dynamic> stream) {
    selectedStreams[id] = stream;
    notifyListeners();
  }

  Future<void> fetchStreamData(String id, SearchType type) async {
    apiKey ??= await secureStorageService.read('api_key');
    if (apiKey == null) throw Exception('API key not found');

    isLoading = true;
    try {
      final response = await http.get(
        Uri.parse(
          "${_constructBaseUrl()}/stream/${type.name}/$id.json",
        ),
      );

      if (response.statusCode == 200) {
        streamData = jsonDecode(response.body);
        selectedStreams[id] = streamData['streams']?.first;
      } else {
        throw Exception('Failed to load stream data: ${response.statusCode}');
      }
    } catch (e) {
      throw("Error fetching stream data: $e");
      streamData = {}; // Clear data on error
    } finally {
      url = selectedStreams[id]?['url'];
      isLoading = false;
      notifyListeners();
    }
  }
}
