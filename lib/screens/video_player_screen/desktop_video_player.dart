import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'widgets/track_selector.dart';

Widget desktopVideoPlayer(
  BuildContext context,
  VideoController controller,
  Player player,
) {
  return MaterialDesktopVideoControlsTheme(
    normal: buildThemeData(context, controller),
    fullscreen: buildThemeData(context, controller),
    child: Scaffold(
      body: Column(
        children: [Expanded(child: Video(controller: controller))],
      ),
    ),
  );
}

MaterialDesktopVideoControlsThemeData buildThemeData(
  BuildContext context,
  VideoController controller,
) {
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
    bottomButtonBar: [
      MaterialDesktopSkipPreviousButton(),
      MaterialDesktopPlayOrPauseButton(),
      MaterialDesktopSkipNextButton(),
      MaterialDesktopVolumeButton(),
      MaterialDesktopPositionIndicator(),
      PlayerDropdownButton(
        icon: const Icon(Icons.subtitles),
        type: SubtitleTrack,
      ),
      PlayerDropdownButton(
        icon: const Icon(Icons.audiotrack),
        type: AudioTrack,
      ),
      Spacer(),
      MaterialDesktopFullscreenButton(),
    ],
  );
}
