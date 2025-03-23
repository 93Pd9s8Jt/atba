// import 'dart:io';

// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';

// import 'package:torbox/services/secure_storage_service.dart';


// class TorboxAPI {
//   final api_base = 'https://api.torbox.app';
//   final api_version = 'v1';
//   final secureStorageService = Provider.of<SecureStorageService>()
//   final apiKey = await secureStorageService.read('api_key');
//   Future<http.Response> get(String apiKey) {
//     return http.get(Uri.parse('$api_base/$api_version/api/user/me?settings=true'),
//         headers: {
//           HttpHeaders.authorizationHeader: 'Bearer $apiKey',
//         });
//   }
// }
