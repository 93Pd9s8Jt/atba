import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';                    
import 'package:media_kit_video/media_kit_video.dart';   

class VideoPlayerScreen extends StatefulWidget {
  final String url;

  const VideoPlayerScreen({super.key, required this.url});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final player = Player();
  late final controller = VideoController(player);

  @override
  void initState() {
    super.initState();
    player.open(Media(widget.url));
  }


  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Video(
              controller: controller,
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: SafeArea(
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                mini: true,
                backgroundColor: Colors.black54,
                child: const Icon(Icons.arrow_back),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
