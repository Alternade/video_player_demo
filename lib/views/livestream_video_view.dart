import 'package:flutter/material.dart';
import 'package:video_players/controller/video_controller.dart';

class LivestreamView extends StatefulWidget {
  const LivestreamView({Key? key}) : super(key: key);

  @override
  State<LivestreamView> createState() => _LivestreamViewState();
}

class _LivestreamViewState extends State<LivestreamView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: VideoApp(),
      height: 400,
    );
  }
}
