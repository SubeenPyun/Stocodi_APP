import 'package:flutter/material.dart';
import '../Item/comment_item.dart';
import 'my_comment.dart';

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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isNarrowScreen = constraints.maxWidth < 600; // 예시 너비 (조정 가능)

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return CommentItem(
                        name: 'Name $index',
                        profileImage: 'assets/kakao.jpg',
                        text: 'Your comment text here',
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
