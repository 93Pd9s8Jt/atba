import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'widgets/track_selector.dart';

Widget desktopVideoPlayer(
  BuildContext context,
  VideoController controller,
  GlobalKey<VideoState> key,
) {
  return MaterialDesktopVideoControlsTheme(
    normal: buildThemeData(context, key),
    fullscreen: buildThemeData(context, key),
    child: Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Video(controller: controller, key: key),
          ),
        ],
      ),
    ),
  );
}

MaterialDesktopVideoControlsThemeData buildThemeData(
  BuildContext context,
  GlobalKey<VideoState> key,
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
          if (key.currentState?.isFullscreen() ?? false) {
            key.currentState?.exitFullscreen();
          }
          Navigator.of(context).popUntil((route) => route.isFirst);
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
