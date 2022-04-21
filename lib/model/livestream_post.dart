import 'package:video_players/model/post.dart';

class LivestreamVideo extends Post {
  final String title;
  final String subTitle;
  final String videoUrl;
  final num numberOfLikes;

  LivestreamVideo({
    required PostType videoType,
    required this.title,
    required this.subTitle,
    required this.videoUrl,
    required this.numberOfLikes,
  }) : super(videoType);
}
