import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:live_streaming/res/strings.dart';

class PlaybackPage extends StatefulWidget {
  const PlaybackPage({Key? key}) : super(key: key);

  @override
  State<PlaybackPage> createState() => _PlaybackPageState();
}

class _PlaybackPageState extends State<PlaybackPage> {
  late final VideoPlayerController _videoController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String playbackId = "8j00Y67YvcoHBF9nGwYwlVgnDn2KTo02hcU6fdwBa6b6M";
    _videoController = VideoPlayerController.network(
        '$muxStreamBaseUrl/$playbackId.$videoExtension')
      ..initialize().then((_) {
        setState(() {});
      });

    _videoController.play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: _videoController.value.isInitialized
            ? ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: AspectRatio(
            aspectRatio: _videoController.value.aspectRatio,
            child: VideoPlayer(_videoController),
          ),
        )
            : const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.pink,
            ),
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}
