import 'dart:io';

import 'package:atba/config/constants.dart';
import 'package:atba/screens/video_player_screen/video_player_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:media_kit/media_kit.dart';

class VideoPlaybackService {
  static void playURL(
    BuildContext context,
    String? url, {
    String? filename,
  }) async {
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
      String? title = await _getTitleFromStream(url);
      if (title != null && title.isNotEmpty) {
        _launchIntent(url, "");
      } else {
        _launchIntent(url, filename);
      }
    }
  }

  static void _launchIntent(String url, String? title) async {
    final Map<String, dynamic> intentArguments = {};
    if (title != null && title.isNotEmpty) {
      intentArguments['title'] = title;
    }
    AndroidIntent intent = AndroidIntent(
      action: 'action_view',
      type: "video/*",
      data: url,
      arguments: intentArguments,
    );
    intent.launch();
  }

  /// Fetches the global container title from a video stream URL by waiting for the demuxer to complete.
  static Future<String?> _getTitleFromStream(String videoUrl) async {
    final player = Player();
    String? embeddedTitle;

    try {
      await player.open(Media(videoUrl), play: false);

      await player.stream.tracks
          .firstWhere(
            (tracks) => tracks.video.isNotEmpty || tracks.audio.isNotEmpty,
          )
          .timeout(const Duration(seconds: 5));

      if (player.platform is NativePlayer) {
        final nativePlayer = player.platform as NativePlayer;

        final dynamic metadata = await nativePlayer.getProperty('metadata');
        if (metadata is Map && metadata.isNotEmpty) {
          final rawTitle =
              metadata['title'] ?? metadata['TITLE'] ?? metadata['Title'];
          if (rawTitle != null) {
            embeddedTitle = rawTitle.toString().trim();
          }
        }

        // Fallback to 'media-title' property
        if (embeddedTitle == null || embeddedTitle.isEmpty) {
          final dynamic mediaTitle = await nativePlayer.getProperty(
            'media-title',
          );
          if (mediaTitle != null) {
            final String titleCandidate = mediaTitle.toString().trim();

            // Ensure mpv didn't just use the URL string
            if (!titleCandidate.contains('://') &&
                titleCandidate != videoUrl &&
                !videoUrl.endsWith(titleCandidate)) {
              embeddedTitle = titleCandidate;
            }
          }
        }
      }
    } catch (e) {
      print("Failed to fetch stream title via media_kit: $e");
    } finally {
      await player.dispose();
    }

    return embeddedTitle;
  }
}
