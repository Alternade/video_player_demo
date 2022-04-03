import 'package:video_players/model/post.dart';

class InstagramPost extends Post {
  final String title;
  final String subTitle;
  final String imageUrl;
  final num numberOfLikes;

  InstagramPost({
    required PostType videoType,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.numberOfLikes,
  }) : super(videoType);
}
