import 'package:flutter/material.dart';
import 'package:video_players/data_layer.dart/data.dart';
import 'package:video_players/model/livestream_post.dart';
import 'package:video_players/model/post.dart';
import 'package:video_players/views/instagram_post_view.dart';
import 'package:video_players/views/instagram_video_view.dart';
import 'package:video_players/views/livestream_video_view.dart';
import 'package:video_players/views/youtube__livestream_view.dart';
import 'package:video_players/views/youtube_video_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FeedView(),
    );
  }
}

class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  List<Post> posts = [];
  @override
  void initState() {
    posts = DataService().fetchAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Videosss"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          final post = posts[index];
          switch (post.postType) {
            case PostType.youtubeVideo:
              return const YoutubeVideoView();
            case PostType.instagramVideo:
              return const InstagramVideoView();
            case PostType.instagramPost:
              return const InstagramPostView();
            case PostType.livestreamVideo:
              return const LivestreamView();
            case PostType.youtubeLivestream:
              return const YoutubeLiveStreamView();
          }
        },
      ),
    );
  }
}
