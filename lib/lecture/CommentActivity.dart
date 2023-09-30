import 'package:flutter/material.dart';
import 'package:stocodi_app/lecture/Item/CommentItem.dart';

void main() {
  runApp(const CommentActivity());
}


class CommentActivity extends StatelessWidget {
  const CommentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: 15, // 예시로 10개의 동영상을 표시
          itemBuilder: (context, index) {
            return CommentItem(
              name: 'Name $index',
              profileImage: 'assets/kakao.jpg',
              text: 'Your comment text here',
            );
          },
        ),
      ),
    );
  }
}