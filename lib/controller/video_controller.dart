// ignore_for_file: avoid_print

import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta/flutter_insta.dart';

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  FlutterInsta flutterInsta = FlutterInsta();
  TextEditingController reelController = TextEditingController();
  late VideoPlayerController _controller;

  Future<String> setURL() async {
    String s = await flutterInsta.downloadReels(reelController.text);
    return s;
  }

  @override
  void initState() {
    super.initState();

    late String link = setURL() as String;

    _controller = VideoPlayerController.asset(link)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 1.0,
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
