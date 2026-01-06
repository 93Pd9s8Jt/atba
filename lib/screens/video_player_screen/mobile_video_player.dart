import 'package:flutter/material.dart';
import 'package:media_kit_video/media_kit_video.dart';

Widget mobileVideoPlayer(BuildContext context, VideoController controller) {
  return MaterialVideoControlsTheme(
    normal: buildThemeData(context),
    fullscreen: buildThemeData(context),
    child: Scaffold(body: Video(controller: controller)),
  );
}

MaterialVideoControlsThemeData buildThemeData(BuildContext context) {
  return MaterialVideoControlsThemeData(
    volumeGesture: true,
    brightnessGesture: true,
    seekGesture: true,
    seekOnDoubleTap: true,
    // Modify theme options:
    seekBarThumbColor: Theme.of(context).colorScheme.primary,
    seekBarPositionColor: Theme.of(context).colorScheme.primary,
    // Modify top button bar:
    topButtonBar: [
      MaterialDesktopCustomButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back),
      ),
      const Spacer(),
    ],
  );
}
