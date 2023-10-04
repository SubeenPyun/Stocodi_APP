import 'package:flutter/material.dart';
class MyComment extends StatefulWidget {
  final String imageUrl;

  const MyComment({Key? key, required this.imageUrl}) : super(key: key); // imageUrl을 생성자 매개 변수로 받음

  @override
  _MyCommentState createState() => _MyCommentState();
}

class _MyCommentState extends State<MyComment> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(widget.imageUrl), // 프로필 이미지를 widget.imageUrl로 설정
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextField(
                controller: _commentController,
                decoration: const InputDecoration(
                  hintText: '댓글을 입력하세요...',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0ECB81)),
                  ),
                ),
                cursorColor: const Color(0xFF0ECB81), // 커서 색상을 설정합니다.
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: _submitComment,
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF0ECB81), // 버튼의 색상을 지정합니다.
              ),
              child: const Text('입력'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitComment() {
    String comment = _commentController.text;
    if (comment.isNotEmpty) {
      print('댓글: $comment');
      _commentController.clear();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('경고'),
            content: const Text('댓글을 입력하세요.'),
            actions: <Widget>[
              TextButton(
                child: const Text('확인'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
