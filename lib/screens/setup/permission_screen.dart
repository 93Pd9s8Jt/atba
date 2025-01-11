import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:atba/screens/home_page.dart';


// TODO: skip if notification permission is already granted

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({super.key});

  Future<PermissionStatus> requestNotificationPermission() async {
    return await Permission.notification.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification Permission')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications, size: 64, color:  Theme.of(context).colorScheme.primary),
            const SizedBox(height: 20),
            const Text(
              'Enable Notifications?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Get notified about important updates. You can enable or disable this later in settings.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                PermissionStatus status = await requestNotificationPermission();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text('Enable Notifications'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text('Skip'),
            ),
          ],
        ),
      ),
    );
  }
}
