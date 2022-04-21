enum PostType {
  youtubeVideo,
  instagramVideo,
  instagramPost,
  livestreamVideo,
  youtubeLivestream
}

class Post {
  final PostType postType;
  Post(
    this.postType,
  );
}
