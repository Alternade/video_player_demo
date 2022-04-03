import 'package:video_players/model/instagram_post.dart';
import 'package:video_players/model/instagram_video.dart';
import 'package:video_players/model/youtube_video.dart';

import '../model/post.dart';

class DataService {
  List<Post> posts = [
    YoutubeVideo(
      videoType: PostType.youtubeVideo,
      title: "title",
      subTitle: "subTitle",
      videoUrl: "https://www.youtube.com/watch?v=hjBBqCnGXn8",
      numberOfLikes: 20,
    ),
    InstagramVideo(
      videoType: PostType.instagramVideo,
      title: "title",
      subTitle: "subTitle",
      videoUrl: "https://www.youtube.com/watch?v=hjBBqCnGXn8",
      numberOfLikes: 10,
    ),
    InstagramPost(
      videoType: PostType.instagramPost,
      title: "title",
      subTitle: "subTitle",
      imageUrl: "https://www.youtube.com/watch?v=hjBBqCnGXn8",
      numberOfLikes: 40,
    )
  ];

  DataService._privateDataService();
  static final _shared = DataService._privateDataService();

  factory DataService() => _shared;

  fetchAllPosts() {
    return posts;
  }
}
