import 'package:flutter/material.dart';
import 'package:media_kit_video/media_kit_video.dart';

Widget desktopVideoPlayer(BuildContext context, VideoController controller) {
  return MaterialDesktopVideoControlsTheme(
    normal: buildThemeData(context),
    fullscreen: buildThemeData(context),
    child: Scaffold(body: Video(controller: controller)),
  );
}

MaterialDesktopVideoControlsThemeData buildThemeData(BuildContext context) {
  return MaterialDesktopVideoControlsThemeData(
    // Modify theme options:
    seekBarThumbColor: Theme.of(context).colorScheme.primary,
    seekBarPositionColor: Theme.of(context).colorScheme.primary,
    toggleFullscreenOnDoublePress: false,
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
