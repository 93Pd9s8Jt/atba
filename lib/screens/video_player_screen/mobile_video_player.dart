import 'package:atba/screens/video_player_screen/widgets/track_selector.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart' show SubtitleTrack, AudioTrack;
import 'package:media_kit_video/media_kit_video.dart';

Widget mobileVideoPlayer(
  BuildContext context,
  VideoController controller,
  GlobalKey<VideoState> key,
) {
  return MaterialVideoControlsTheme(
    normal: buildThemeData(context, key),
    fullscreen: buildThemeData(context, key),
    child: Scaffold(
      body: Video(controller: controller, key: key),
    ),
  );
}

MaterialVideoControlsThemeData buildThemeData(
  BuildContext context,
  GlobalKey<VideoState> key,
) {
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
          if (key.currentState?.isFullscreen() ?? false) {
            key.currentState?.exitFullscreen();
          }
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        icon: const Icon(Icons.arrow_back),
      ),
      const Spacer(),
      PlayerDropdownButton(
        icon: const Icon(Icons.subtitles),
        type: SubtitleTrack,
      ),
      PlayerDropdownButton(
        icon: const Icon(Icons.audiotrack),
        type: AudioTrack,
      ),
    ],
  );
}
