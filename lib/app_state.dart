import 'package:flutter/material.dart';
import 'package:atba/services/api_service.dart';
import 'services/shared_prefs_service.dart';
import 'services/secure_storage_service.dart';

class AppState with ChangeNotifier {
  final SharedPrefsService sharedPrefsService;
  final SecureStorageService secureStorageService;
  final TorboxAPI apiService;

  bool isLoading = true;
  bool hasError = false;
  bool isFirstRun = true;
  String? apiKey;

  AppState({
    required this.sharedPrefsService,
    required this.secureStorageService,
    required this.apiService
  });

  Future<void> initializeApp() async {
    try {
      isFirstRun = sharedPrefsService.getString('isFirstRun') == null; // todo, make better
      apiKey = await secureStorageService.read('api_key');
    } catch (e) {
      hasError = true;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> completeOnboarding() async {
    try {
      await sharedPrefsService.setString('isFirstRun', 'false');
      isFirstRun = false;
      notifyListeners();
    } catch (e) {
      hasError = true;
      notifyListeners();
    }
  }

  Future<void> updateApiKey(String newApiKey) async {
    try {
      await secureStorageService.write('api_key', newApiKey);
      apiKey = newApiKey;
      notifyListeners();
    } catch (e) {
      hasError = true;
      notifyListeners();
    }
  }
}
