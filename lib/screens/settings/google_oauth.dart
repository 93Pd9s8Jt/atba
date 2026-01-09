import 'package:atba/services/torbox_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleDriveIntegrationSection extends StatefulWidget {
  final TorboxAPI apiService;
  final TextEditingController googleTokenController;

  const GoogleDriveIntegrationSection({
    super.key,
    required this.apiService,
    required this.googleTokenController,
  });

  @override
  State<GoogleDriveIntegrationSection> createState() =>
      _GoogleDriveIntegrationSectionState();
}

class _GoogleDriveIntegrationSectionState
    extends State<GoogleDriveIntegrationSection> {
  String? googleToken;

  @override
  void initState() {
    googleToken = widget.apiService.googleToken ?? "";
    super.initState();
  }

  void _onTokenChanged(String token) {
    setState(() {
      googleToken = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableSettingsTile(
      title: "Google Drive",
      leading: Icon(Icons.drive_file_move),
      subtitle: (googleToken == null || googleToken!.isEmpty)
          ? "Not connected"
          : "Connected",
      children: [
        if (!kIsWeb) ...[
          ListTile(
            title: Text(
              (googleToken == null || googleToken!.isEmpty)
                  ? "Connect Google Drive"
                  : "Reconnect Google Drive",
            ),
            leading: const Icon(Icons.drive_file_move),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(title: const Text("Google Drive OAuth")),
                      body: InAppWebView(
                        initialSettings: InAppWebViewSettings(
                          userAgent:
                              Theme.of(context).platform ==
                                  TargetPlatform.android
                              ? "Mozilla/5.0 (Linux; Android 10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36"
                              : null,
                          incognito: true,
                        ),
                        initialUrlRequest: URLRequest(
                          url: WebUri(
                            'https://api.torbox.app/v1/api/integration/oauth/google',
                          ),
                        ), // TODO: store in apiService as a const
                        onUpdateVisitedHistory:
                            (controller, url, isReload) async {
                              if (url == null) return;
                              if (url.host == "torbox.app" &&
                                  url.path == "/oauth/google/success") {
                                final token = url.queryParameters['token'];
                                final expiryDate =
                                    url.queryParameters['expires_at'] ?? "";
                                _onTokenChanged(token ?? "");
                                if (token != null) {
                                  await widget.apiService.saveGoogleToken(
                                    token,
                                    expiryDate,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Google Drive token saved'),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Failed to get token'),
                                    ),
                                  );
                                }
                                Navigator.pop(context);
                              }
                            },
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Manual token',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: widget.googleTokenController,
                decoration: const InputDecoration(
                  labelText: 'Paste Google token here',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) async {
                  if (value.isNotEmpty) {
                    await widget.apiService.saveGoogleToken(value, "");
                    _onTokenChanged(value);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Token saved")),
                    );
                  }
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  final controller = widget.googleTokenController;
                  final value = controller.text.trim();
                  if (value.isNotEmpty) {
                    controller.clear();
                    await widget.apiService.saveGoogleToken(value, "");
                    _onTokenChanged(value);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Token saved")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Token cannot be empty")),
                    );
                  }
                },
                child: const Text('Save token'),
              ),
            ],
          ),
        ),
        ListTile(
          title: const Text("Get token manually"),
          subtitle: const Text(
            "Opens the authentication page in your browser. After authenticating, you will be redirected to a success page. Copy the token from the URL and paste it in the field above.",
          ),
          onTap: () async {
            final url = Uri.parse(
              'https://api.torbox.app/v1/api/integration/oauth/google',
            );
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Could not open browser")),
              );
            }
          },
        ),
        if (googleToken != null && googleToken!.isNotEmpty) ...[
          ListTile(
            title: const Text("Copy token"),
            leading: const Icon(Icons.copy),
            onTap: () async {
              await Clipboard.setData(
                ClipboardData(text: googleToken as String),
              );
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Token copied to clipboard')),
                );
              }
            },
          ),
          ListTile(
            title: const Text("Delete token"),
            leading: const Icon(Icons.delete),
            onTap: () async {
              await widget.apiService.deleteGoogleToken();
              _onTokenChanged("");
              if (context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Token deleted')));
              }
            },
          ),
        ],
      ],
    );
  }
}
