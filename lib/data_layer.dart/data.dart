import 'package:video_players/model/instagram_post.dart';
import 'package:video_players/model/instagram_video.dart';
import 'package:video_players/model/livestream_post.dart';
import 'package:video_players/model/youtube_live_stream.dart';
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
    ),
    LivestreamVideo(
      videoType: PostType.livestreamVideo,
      title: "Title",
      subTitle: "subTitle",
      videoUrl:
          "https://dt9xom8irs6kr.cloudfront.net/u255961/733539-171769413452844233.mp4",
      numberOfLikes: 20,
    ),
    YoutubeLiveStream(
      videoType: PostType.youtubeLivestream,
      title: "title",
      subTitle: "subTitle",
      videoUrl: "https://www.youtube.com/watch?v=GpzN0b5Dl1E",
      numberOfLikes: 20,
    ),
  ];

  DataService._privateDataService();
  static final _shared = DataService._privateDataService();

  factory DataService() => _shared;

  fetchAllPosts() {
    return posts;
  }
}
