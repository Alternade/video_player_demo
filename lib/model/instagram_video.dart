import 'package:video_players/model/post.dart';

class InstagramVideo extends Post {
  final String title;
  final String subTitle;
  final String videoUrl;
  final num numberOfLikes;

  InstagramVideo({
    required PostType videoType,
    required this.title,
    required this.subTitle,
    required this.videoUrl,
    required this.numberOfLikes,
  }) : super(videoType);
}
