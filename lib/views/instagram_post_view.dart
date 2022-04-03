import 'package:flutter/material.dart';

class InstagramPostView extends StatefulWidget {
  const InstagramPostView({Key? key}) : super(key: key);

  @override
  State<InstagramPostView> createState() => _InstagramPostViewState();
}

class _InstagramPostViewState extends State<InstagramPostView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("instagramPost"),
      color: Colors.amber,
      height: 400,
    );
  }
}
