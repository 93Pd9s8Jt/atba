import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../secure_storage_service.dart';
import '../torrentio_config.dart';

abstract class StremioAddonAPI with ChangeNotifier {
  late final SecureStorageService secureStorageService;
  String? apiKey;
  String? url;

  bool isLoading = false;
  Map<String, dynamic> streamData = {};
  Map<String, Map<String, dynamic>> selectedStreams = {};

  StremioAddonAPI(this.apiKey);

  Future<void> init() async {
    secureStorageService = SecureStorageService();
    apiKey = await secureStorageService.read('api_key');
  }

  @mustBeOverridden
  String constructBaseUrl();

  void setStream(String id, Map<String, dynamic> stream) {
    selectedStreams[id] = stream;
    notifyListeners();
  }

  Future<void> loadApiKey() async {
    apiKey ??= await secureStorageService.read('api_key');
    if (apiKey == null) throw Exception('API key not found');
  }

  Future<void> fetchStreamData(String id, SearchType type) async {
    isLoading = true;
    try {
      final response = await http.get(
        Uri.parse("${constructBaseUrl()}/stream/${type.name}/$id.json"),
      );

      if (response.statusCode == 200) {
        streamData = jsonDecode(response.body);
        selectedStreams[id] = streamData['streams']?.first;
      } else {
        throw Exception('Failed to load stream data: ${response.statusCode}');
      }
    } catch (e) {
      throw ("Error fetching stream data: $e");
    } finally {
      url = selectedStreams[id]?['url'];
      isLoading = false;
      notifyListeners();
    }
  }
}
