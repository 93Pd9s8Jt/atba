import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'secure_storage_service.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';


class TorboxAPI {
  final SecureStorageService secureStorageService;

  static const api_base = 'https://api.torbox.app';
  static const api_version = 'v1';

  String? apiKey;

  final String baseUrl;

  TorboxAPI({
    required this.secureStorageService,
    this.baseUrl = '$api_base/$api_version',
    this.apiKey,
  });

  Future<void> init() async {
    apiKey = await secureStorageService.read('api_key');
  }

  // final secureStorageService = Provider.of<SecureStorageService>()
  // final apiKey = await secureStorageService.read('api_key');
  Future<http.Response> get() {
    return http.get(Uri.parse('$baseUrl/api/user/me?settings=true'), headers: {
      HttpHeaders.authorizationHeader: 'Bearer $apiKey',
    });
  }

  Future<Map<String, dynamic>?> makeRequest(String endpoint, {String requestType = "get", Map<String, dynamic> body = const {}}) async {
    apiKey ??= await secureStorageService.read('api_key');

    final url = Uri.parse('$baseUrl/$endpoint');

    requestType = requestType.toLowerCase();

    final http.Response response;

    switch( requestType ) {
      case 'get':
        response = await http.get(
          url,
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $apiKey',
            HttpHeaders.contentTypeHeader: 'application/json',
          }
        );
        break;
      case 'post':
        var request = http.MultipartRequest('POST', url);
        for (String? key in body.keys) {
          if (key == null || body[key] == null || body[key] == "") continue;
          if (body[key] is PlatformFile) {
            request.files.add(await http.MultipartFile.fromPath(key, body[key].path));
          } else {
            request.fields[key] = body[key];
          }
        }
        request.headers.addAll({
          HttpHeaders.authorizationHeader: 'Bearer $apiKey',
          HttpHeaders.contentTypeHeader: 'application/json',
        });
        final streamedResponse = await request.send();
        response = await http.Response.fromStream(streamedResponse);
        break;
      case 'put':
        response = await http.put(
          url,
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $apiKey',
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(body),
        );
        break;
      case 'delete':
        response = await http.delete(
          url,
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $apiKey',
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        );
        break;
      default:
        throw Exception('Invalid request type');
    }




    if (response.statusCode == 200) {
      final asciiBytes = response.bodyBytes;
      final decodedData = utf8.decode(asciiBytes);
      final responseData = jsonDecode(decodedData);
      return responseData;
    } else {
      if (true/*response.statusCode == 500*/ /*&&
          jsonDecode(response.body)['error'] == "AUTH_ERROR"*/) {
        return jsonDecode(response.body);
      }
      if (response.statusCode == 422) {
        return Future.value(jsonDecode(response.body));
      }
      // Handle errors appropriately
      throw Exception('Failed to load data: ${response.statusCode}');

    }
  }

  Future<void> saveApiKey(String apiKeyToSave) async {
    await secureStorageService.write('api_key', apiKeyToSave);
    apiKey = apiKeyToSave;
  }

  Future<void> deleteApiKey() async {
    await secureStorageService.delete('api_key');
    apiKey = null;
  }
}

enum SearchType { movie, tv }

extension SearchTypeExtension on SearchType {
  String get name {
    switch (this) {
      case SearchType.movie:
        return 'movie';
      case SearchType.tv:
        return 'series';
    }
  }
}

class TorrentioAPI with ChangeNotifier {
  final secureStorageService;
  String? apiKey;
  String? url;

    static const Map<String, String> providers = {
    // value, name
    'yts': 'YTS',
    'eztv': 'EZTV',
    'rarbg': 'RARBG',
    '1337x': '1337x',
    'thepiratebay': 'The Pirate Bay',
    'kickasstorrents': 'KickassTorrents',
    'torrentgalaxy': 'TorrentGalaxy',
    'magnetdl': 'MagnetDL',
    'horriblesubs': 'HorribleSubs',
    'nyaasi': 'NyaaSi',
    'tokyotosho': 'TokyoTosho',
    'anidex': 'Anidex',
    'rutor': '🇷🇺 Rutor',
    'rutracker': '🇷🇺 RuTracker',
    'comando': '🇵🇹 Comando',
    'bludv': '🇵🇹 BluDV',
    'torrent9': '🇫🇷 Torrent9',
    'ilcorsaronero': '🇮🇹 IlCorSaRoNeRo',
    'mejortorrent': '🇪🇸 MejorTorrent',
    'wolfmax4k': '🇪🇸 WolfMax4K',
    'cinecalidad': '🇲🇽 CineCalidad',
  };

  static const Map<String, String> languages = {
    'japanese': '🇯🇵 Japanese',
    'russian': '🇷🇺 Russian',
    'italian': '🇮🇹 Italian',
    'portuguese': '🇵🇹 Portuguese',
    'spanish': '🇪🇸 Spanish',
    'latino': '🇲🇽 Latino',
    'korean': '🇰🇷 Korean',
    'chinese': '🇨🇳 Chinese',
    'taiwanese': '🇹🇼 Taiwanese',
    'french': '🇫🇷 French',
    'german': '🇩🇪 German',
    'dutch': '🇳🇱 Dutch',
    'hindi': '🇮🇳 Hindi',
    'telugu': '🇮🇳 Telugu',
    'tamil': '🇮🇳 Tamil',
    'polish': '🇵🇱 Polish',
    'lithuanian': '🇱🇹 Lithuanian',
    'latvian': '🇱🇻 Latvian',
    'estonian': '🇪🇪 Estonian',
    'czech': '🇨🇿 Czech',
    'slovakian': '🇸🇰 Slovakian',
    'slovenian': '🇸🇮 Slovenian',
    'hungarian': '🇭🇺 Hungarian',
    'romanian': '🇷🇴 Romanian',
    'bulgarian': '🇧🇬 Bulgarian',
    'serbian': '🇷🇸 Serbian',
    'croatian': '🇭🇷 Croatian',
    'ukrainian': '🇺🇦 Ukrainian',
    'greek': '🇬🇷 Greek',
    'danish': '🇩🇰 Danish',
    'finnish': '🇫🇮 Finnish',
    'swedish': '🇸🇪 Swedish',
    'norwegian': '🇳🇴 Norwegian',
    'turkish': '🇹🇷 Turkish',
    'arabic': '🇸🇦 Arabic',
    'persian': '🇮🇷 Persian',
    'hebrew': '🇮🇱 Hebrew',
    'vietnamese': '🇻🇳 Vietnamese',
    'indonesian': '🇮🇩 Indonesian',
    'malay': '🇲🇾 Malay',
    'thai': '🇹🇭 Thai',
  };


  static const Map<String, String> qualities = { 
    'brremux': 'BluRay REMUX',
    'hdrall': 'HDR/HDR10+/Dolby Vision',
    'dolbyvision': 'Dolby Vision',
    'dolbyvisionwithhdr': 'Dolby Vision + HDR',
    'threed': '3D',
    'nonthreed': 'Non 3D (DO NOT SELECT IF NOT SURE)',
    '4k': '4K',
    '1080p': '1080p',
    '720p': '720p',
    '480p': '480p',
    'other': 'Other (DVDRip/HDRIp/BDRip...)',
    'scr': 'Screener',
    'cam': 'Cam',
    'unknown': 'Unknown',

  };

  bool isLoading = false;
  Map<String, dynamic> streamData = {};
  Map<String, Map<String, dynamic>> selectedStreams = {};
  // we can use flutter settings screens to construct the URL
  // full url looks like 
  // https://torrentio.strem.fun/providers=CSPROVIDERS%7Clanguage=CSLANGUAGES%7Cqualityfilter=CSQUALITIES%7Climit=NUMBERPERQUALITYLIMIT%7Csizefilter=SIZELIMIT%7Ctorbox=APIKEY/
  final String CSPROVIDERS = providers.keys.where((key) => Settings.getValue<bool>("key-provider-$key") ?? false).join(',');
  final String CSLANGUAGES = languages.keys.where((key) => Settings.getValue<bool>("key-language-$key") ?? false).join(',');
  final String CSQUALITIES = qualities.keys.where((key) => Settings.getValue<bool>("key-exclude-quality-$key") ?? false).join(',');
  final String SORTBY = {1: '', 2: 'qualitysize', 3: 'seeders', 4: 'size'}[Settings.getValue<int>("key-sort-by") ?? 1]!;
  final String SIZELIMIT = Settings.getValue<String>("key-video-size-limit") ?? '';
  final String NUMBERPERQUALITYLIMIT = Settings.getValue<String>("key-max-results-per-quality") ?? ''; // TODO: validate
  late String baseUrl;


  TorrentioAPI(this.secureStorageService) {
    _init();
  }

  Future<void> _init() async {

    apiKey = await secureStorageService.read('api_key');
    if (apiKey == null) {
      throw Exception('API key not found');
    }
    baseUrl = 'https://torrentio.strem.fun/providers=$CSPROVIDERS%7Csort=$SORTBY%7Clanguage=$CSLANGUAGES%7Cqualityfilter=$CSQUALITIES%7climit=$NUMBERPERQUALITYLIMIT%7Csizefilter=$SIZELIMIT%7Ctorbox=$apiKey';

  }

  void setStream(String id, Map<String, dynamic> stream) {
    selectedStreams[id] = stream;
    notifyListeners();
  }

  Future<void> fetchStreamData(String id, SearchType type) async {
    isLoading = true;
    try {
      final response = await http.get(
        Uri.parse(
          "$baseUrl/stream/${type.name}/$id.json",
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

class StremioRequests with ChangeNotifier {
  Map<String, List<Map<String, dynamic>>> searchResults = {
    "movie": [],
    "series": []
  };
  bool isLoading = false;
  bool hasSearched = false;

  StremioRequests();

  Future<void> fetchSearchResults(String query) async {
    // Set loading state
    isLoading = true;
    hasSearched = true;
    searchResults = {"movie": [], "series": []}; // Clear previous results
    notifyListeners();

    try {
      // Make the API call

      final responses = await Future.wait([
        http.get(
          Uri.parse(
            "https://v3-cinemeta.strem.io/catalog/${SearchType.movie.name}/top/search=${Uri.encodeComponent(query)}.json",
          ),
        ),
        http.get(
          Uri.parse(
            "https://v3-cinemeta.strem.io/catalog/${SearchType.tv.name}/top/search=${Uri.encodeComponent(query)}.json",
          ),
        )
      ]);

      final http.Response movieResponse = responses[0];
      final http.Response seriesResponse = responses[1];

      final movieData = jsonDecode(movieResponse.body);
      final seriesData = jsonDecode(seriesResponse.body);
      // Assuming 'results' is the key where search results are stored
      searchResults = {
        "movie": List<Map<String, dynamic>>.from(movieData['metas'] ?? []),
        "series": List<Map<String, dynamic>>.from(seriesData['metas'] ?? [])
      };
    } catch (e) {
      print("Error fetching search results: $e");
      searchResults = {"movie": [], "series": []}; // Clear results on error
    } finally {
      // Clear loading state
      isLoading = false;
      notifyListeners();
    }
  }
}
