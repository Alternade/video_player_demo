import 'package:flutter/material.dart';

class InstagramVideoView extends StatefulWidget {
  const InstagramVideoView({Key? key}) : super(key: key);

  @override
  State<InstagramVideoView> createState() => _InstagramVideoViewState();
}

class _InstagramVideoViewState extends State<InstagramVideoView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("instagramVideo"),
      color: Colors.amberAccent,
      height: 400,
    );
  }
}
