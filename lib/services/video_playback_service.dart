import 'dart:io';

import 'package:atba/config/constants.dart';
import 'package:atba/screens/video_player_screen/video_player_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:android_intent_plus/android_intent.dart';

class VideoPlaybackService {
  static void playURL(BuildContext context, String? url) {
    if (url == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to load stream data')),
      );
      return;
    }

    final useInternalPlayer =
        Settings.getValue<bool>(Constants.useInternalVideoPlayer) ??
        (kIsWeb || !Platform.isAndroid);

    if (useInternalPlayer) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VideoPlayerScreen(url: url)),
      );
    } else {
      _launchIntent(url);
    }
  }

  static void _launchIntent(String url) async {
    AndroidIntent intent = AndroidIntent(
      action: 'action_view',
      type: "video/*",
      data: url,
    );
    intent.launch();
  }
}
