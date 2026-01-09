import 'dart:io';

import 'package:atba/screens/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import 'permission_screen.dart';

import 'package:atba/services/torbox_service.dart';

class ApiKeyScreen extends StatelessWidget {
  final TextEditingController _apiKeyController = TextEditingController();

  final _storage = const FlutterSecureStorage();

  ApiKeyScreen({super.key});

  Future<void> saveApiKey(String apiKey) async {
    await _storage.write(key: 'api_key', value: apiKey);
  }

  @override
  Widget build(BuildContext context) {
    final apiService = Provider.of<TorboxAPI>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Please provide your API key to continue.'),
            const SizedBox(height: 20),
            TextField(
              controller: _apiKeyController,
              decoration: const InputDecoration(
                labelText: 'API Key',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final apiKey = _apiKeyController.text.trim();
                await apiService.saveApiKey(apiKey);
                final response = await apiService.getUserData();
                if (apiKey.isNotEmpty && response.success) {
                  await apiService.saveApiKey(apiKey);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => !kIsWeb && Platform.isAndroid
                          ? const PermissionScreen()
                          : const HomeScreen(),
                    ),
                  );
                } else {
                  apiService.deleteApiKey();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        apiKey.isNotEmpty
                            ? (response.detailOrUnknown)
                            : 'API Key is required!',
                      ),
                    ),
                  );
                }
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
