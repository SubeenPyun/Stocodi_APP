import 'package:flutter/material.dart';
import 'package:stocodi_app/lecture/NextVideoItem.dart';

void main() {
  runApp(const NextVideoActivity());
}


class NextVideoActivity extends StatelessWidget {
  const NextVideoActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset('assets/youtube_logo.png', width: 100.0),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {
                // 검색 기능 추가
              },
            ),
            IconButton(
              icon: Icon(Icons.account_circle, color: Colors.black),
              onPressed: () {
                // 계정 관련 기능 추가
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: 10, // 예시로 10개의 동영상을 표시
          itemBuilder: (context, index) {
            return VideoCard(
              title: '동영상 제목 $index',
              nickname: '유저 닉네임',
              uploadDate: '2023-09-23',
              views: '${index * 1000}회 조회',
              thumbnailUrl: 'https://via.placeholder.com/150', // 썸네일 이미지 URL
            );
          },
        ),
      ),
    );
  }
}