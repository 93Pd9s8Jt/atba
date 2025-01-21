import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import 'permission_screen.dart';
import 'package:atba/services/api_service.dart';

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
      appBar: AppBar(title: const Text('Enter API Key')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
                final response =
                    await apiService.makeRequest('api/user/me?settings=true');
                if (apiKey.isNotEmpty && response?["success"]) {
                  await apiService.saveApiKey(apiKey);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PermissionScreen()));
                } else {
                  apiService.deleteApiKey();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(apiKey.isNotEmpty
                            ? (response?["detail"] ?? "unknown error")
                            : 'API Key is required!')),
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
