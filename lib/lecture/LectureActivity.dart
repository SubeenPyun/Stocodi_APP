import 'package:flutter/material.dart';

void main() {
  runApp(const LectureActivity());
}

class LectureActivity extends StatelessWidget {
  const LectureActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('동영상 제목'),
        ),
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9, // 동영상 비율
              child: Container(
                color: Colors.black, // 동영상 플레이어 배경색
                child: Center(
                  child: Icon(
                    Icons.play_circle_outline,
                    size: 100.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0), // 간격 조절
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '동영상 제목',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 8.0), // 간격 조절
                  Text(
                    '업로드 날짜 • 조회수',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16.0), // 간격 조절
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.thumb_up),
                          SizedBox(width: 8.0), // 간격 조절
                          Text('좋아요'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.bookmark),
                          SizedBox(width: 8.0), // 간격 조절
                          Text('스크랩'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.link),
                          SizedBox(width: 8.0), // 간격 조절
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
