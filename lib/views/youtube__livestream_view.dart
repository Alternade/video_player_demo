import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeLiveStreamView extends StatefulWidget {
  const YoutubeLiveStreamView({Key? key}) : super(key: key);

  @override
  _YoutubeVideoViewState createState() => _YoutubeVideoViewState();
}

class _YoutubeVideoViewState extends State<YoutubeLiveStreamView> {
  late YoutubePlayerController _controller;

  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    'GpzN0b5Dl1E',
    'nPt8bK2gbaU',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: true,
        loop: true,
        isLive: true,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: false,
          topActions: <Widget>[
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                _controller.metadata.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
          onReady: () {
            _isPlayerReady = true;
          },
          onEnded: (data) {
            _controller
                .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
            //_showSnackBar('Next Video Started!');
          },
        ),
      ],
    );
  }

  // void _showSnackBar(String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(
  //         message,
  //         textAlign: TextAlign.center,
  //         style: const TextStyle(
  //           fontWeight: FontWeight.w300,
  //           fontSize: 16.0,
  //         ),
  //       ),
  //       backgroundColor: Colors.blueAccent,
  //       behavior: SnackBarBehavior.floating,
  //       elevation: 1.0,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(50.0),
  //       ),
  //     ),
  //   );
  // }
}


    // return YoutubePlayerBuilder(
    //   onExitFullScreen: null,
    //   player: YoutubePlayer(
    //     controller: _controller,
    //     showVideoProgressIndicator: true,
    //     progressIndicatorColor: Colors.blueAccent,
    //     topActions: <Widget>[
    //       const SizedBox(width: 8.0),
    //       // Expanded(
    //       //   child: Text(
    //       //     _controller.metadata.title,
    //       //     style: const TextStyle(
    //       //       color: Colors.white,
    //       //       fontSize: 18.0,
    //       //     ),
    //       //     overflow: TextOverflow.ellipsis,
    //       //     maxLines: 1,
    //       //   ),
    //       // ),
    //     ],
    //     onReady: () {
    //       _isPlayerReady = true;
    //     },
    //     onEnded: (data) {
    //       _controller
    //           .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
    //       _showSnackBar('Next Video Started!');
    //     },
    //   ),
    //   builder: (context, player) => ListView(
    //     children: [
    //       player,
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.stretch,
    //           children: [
    //             _space,
    //             _text('Title', _videoMetaData.title),
    //             _space,
    //             _text('Channel', _videoMetaData.author),
    //             _space,
    //             _text('Video Id', _videoMetaData.videoId),
    //             _space,
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
