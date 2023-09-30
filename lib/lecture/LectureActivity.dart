import 'package:flutter/material.dart';

void main() {
  runApp(const LectureActivity());
}

class LectureActivity extends StatelessWidget {
  const LectureActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('동영상 제목'),
        ),
        body: const Column(
          children: [
            VideoPlayerWidget(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: VideoDetailsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: Colors.black,
        child: const Center(
          child: Icon(
            Icons.play_circle_outline,
            size: 100.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class VideoDetailsWidget extends StatelessWidget {
  const VideoDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '동영상 제목',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          '업로드 날짜 • 조회수',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.thumb_up),
                SizedBox(width: 8.0),
                Text('좋아요'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.bookmark),
                SizedBox(width: 8.0),
                Text('스크랩'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.link),
                SizedBox(width: 8.0),
                Text('링크 복사'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.more_vert),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
