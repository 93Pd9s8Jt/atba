import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatelessWidget {
  final String url;

  const VideoPlayerScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
    final chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: false,
      fullScreenByDefault: true,
    );

    return Scaffold(
      appBar: AppBar(title: Text("Video Player")),
      body: Chewie(
        controller: chewieController,
      ),
    );
  }
}
