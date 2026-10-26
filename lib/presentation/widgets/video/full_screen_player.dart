import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {

  final String videoUrl;
  final String caption;

  const FullScreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.asset(widget.videoUrl)
    ..setVolume(0)
    ..setLooping(true)
    ..play();

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
        future: _controller.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center( child: CircularProgressIndicator(strokeWidth: 2, color: Colors.deepPurple,));
          }
          return GestureDetector(
            onTap: () {
              if (_controller.value.isPlaying) {
                _controller.pause();
                return;
              }
                _controller.play();
            },
            child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
              child: Stack(children: [

                VideoPlayer(_controller),

                VideoBackground(
                  stops: const [0.8, 1.0],
                ),

                Positioned(
                    bottom: 50,
                    left: 20,
                    child: _VideoCaption(caption: widget.caption)
                ),
              ]),
            ),
          );
        },
    );
  }
}

class _VideoCaption extends StatelessWidget {

  final String caption;

  const _VideoCaption({
    super.key,
    required this.caption
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width,
      child: Text( caption, maxLines: 2, style: titleStyle, ),
    );
  }
}
