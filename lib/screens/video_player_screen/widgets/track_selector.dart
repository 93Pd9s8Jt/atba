import 'dart:async';

import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video_controls/src/controls/material_desktop.dart';
import 'package:media_kit_video/media_kit_video_controls/src/controls/methods/video_state.dart';

class PlayerDropdownButton extends StatefulWidget {
  final Icon icon;
  final Object type;

  const PlayerDropdownButton({
    super.key,
    required this.icon,
    required this.type,
  });

  @override
  State<PlayerDropdownButton> createState() => _PlayerDropdownButtonState();
}

class _PlayerDropdownButtonState extends State<PlayerDropdownButton> {
  Future<void> _showMenu() async {
    final player = controller(context).player;

    // 1. Pause Logic
    final wasPlaying = player.state.playing;
    if (wasPlaying) player.pause();
    final RenderBox button = context.findRenderObject() as RenderBox;
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay) +
            Offset(0, button.size.height),
        button.localToGlobal(Offset.zero, ancestor: overlay) +
            Offset(button.size.width, button.size.height),
      ),
      Offset.zero & overlay.size,
    );

    late final List<dynamic> tracks;
    late final dynamic currentTrack;
    switch (widget.type) {
      case const (SubtitleTrack):
        tracks = player.state.tracks.subtitle;
        currentTrack = player.state.track.subtitle;
        break;
      case const (AudioTrack):
        tracks = player.state.tracks.audio;
        currentTrack = player.state.track.audio;
        break;
      default:
        throw Exception("Not an acceptable track type");
    }

    final selectedTrack = await showMenu<Object>(
      context: context,
      position: position,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 8,
      items: <PopupMenuEntry<Object>>[
        _buildMenuItem(
          track: _getNoTrack(),
          currentTrack: currentTrack,
          label: "None",
          subLabel: null,
        ),
        _buildMenuItem(
          track: _getAutoTrack(),
          currentTrack: currentTrack,
          label: "Auto",
          subLabel: null,
        ),
        if (tracks.isNotEmpty) const PopupMenuDivider(height: 1),
        // Actual Tracks
        ...tracks
            .where((track) {
              if (track is SubtitleTrack) {
                return track != SubtitleTrack.no() &&
                    track != SubtitleTrack.auto();
              } else if (track is AudioTrack) {
                return track != AudioTrack.no() && track != AudioTrack.auto();
              }
              return false;
            })
            .map((track) {
              return _buildMenuItem(
                track: track,
                currentTrack: currentTrack,
                label: _formatLabel(track),
                subLabel: _formatSubLabel(track),
              );
            }),
      ],
    );

    // 5. Handle Selection
    if (selectedTrack != null) {
      switch (widget.type) {
        case const (SubtitleTrack):
          player.setSubtitleTrack(selectedTrack as SubtitleTrack);
          break;
        case const (AudioTrack):
          player.setAudioTrack(selectedTrack as AudioTrack);
          break;
        default:
          throw Exception();
      }
    }

    // 6. Resume Logic
    if (wasPlaying) player.play();
  }

  Object _getNoTrack() {
    switch (widget.type) {
      case const (SubtitleTrack):
        return SubtitleTrack.no();
      case const (AudioTrack):
        return AudioTrack.no();
      default:
        throw Exception();
    }
  }

  Object _getAutoTrack() {
    switch (widget.type) {
      case const (SubtitleTrack):
        return SubtitleTrack.auto();
      case const (AudioTrack):
        return AudioTrack.auto();
      default:
        throw Exception();
    }
  }

  String _formatLabel(dynamic track) {
    String? lang;
    String? codec;

    if (track is SubtitleTrack) {
      lang = track.language;
      codec = track.codec;
    } else if (track is AudioTrack) {
      lang = track.language;
      // Attempt to access codec if available, otherwise default to empty
      try {
        codec = (track as dynamic).codec;
      } catch (_) {}
    }

    lang = lang ?? "Unknown";
    // Capitalize first letter
    if (lang.isNotEmpty) lang = lang[0].toUpperCase() + lang.substring(1);

    codec = codec ?? "";
    if (codec.isNotEmpty) codec = " (${codec.toUpperCase()})";

    return "$lang$codec";
  }

  String? _formatSubLabel(dynamic track) {
    String? title;
    String id = "";

    if (track is SubtitleTrack) {
      title = track.title;
      id = track.id;
    } else if (track is AudioTrack) {
      title = track.title;
      id = track.id;
    }

    if (title != null && title.isNotEmpty) {
      return title;
    }
    return id; // Fallback to ID if no title
  }

  PopupMenuItem<Object> _buildMenuItem({
    required dynamic track,
    required dynamic currentTrack,
    required String label,
    String? subLabel,
  }) {
    final isSelected = track == currentTrack;

    return PopupMenuItem(
      value: track as Object,
      padding: EdgeInsets.zero,
      height: subLabel != null ? 60 : 48, // Taller if it has 2 lines
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: 300, // Fixed width like Plex menu
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (subLabel != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        subLabel,
                        style: const TextStyle(fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ),
            if (isSelected) const Icon(Icons.check, size: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialDesktopCustomButton(onPressed: _showMenu, icon: widget.icon);
  }
}
