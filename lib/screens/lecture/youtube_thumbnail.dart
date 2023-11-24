import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as yt;

class ThumbnailExtractor extends StatelessWidget {
  final String videoId;

  const ThumbnailExtractor({super.key, required this.videoId});

  Future<String> _getThumbnailUrl() async {
    var ytInstance = yt.YoutubeExplode();
    var video = await ytInstance.videos.get(videoId);
    var thumbnailUrl = video.thumbnails.highResUrl;
    ytInstance.close();
    return thumbnailUrl;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getThumbnailUrl(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Image.network(
            snapshot.data ?? '',
            fit: BoxFit.cover,
            // You can customize the width, height, and other properties here
          );
        }
      },
    );
  }
}
