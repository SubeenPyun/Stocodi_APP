import 'package:flutter/material.dart';
import 'package:stocodi_app/lecture/Item/CommentItem.dart';
import 'package:stocodi_app/lecture/widget/MyComment.dart';

void main() {
  runApp(const Comment());
}


class Comment extends StatelessWidget {
  const Comment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 65,
              child: MyComment(imageUrl: 'assets/kakao.jpg'),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero, // 여기에 패딩을 제거합니다.
                itemCount: 15,
                itemBuilder: (context, index) {
                  return CommentItem(
                    name: 'Name $index',
                    profileImage: 'assets/kakao.jpg',
                    text: 'Your comment text here',
                  );
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}