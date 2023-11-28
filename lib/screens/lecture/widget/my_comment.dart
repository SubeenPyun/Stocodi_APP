import 'package:flutter/material.dart';

class MyComment extends StatefulWidget {
  final String imageUrl;

  const MyComment({Key? key, required this.imageUrl}) : super(key: key);

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
              backgroundImage: AssetImage(widget.imageUrl),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextField(
                controller: _commentController,
                decoration: const InputDecoration(
                  hintText: '댓글을 입력하세요...',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: const Color(0xFF0ECB81)),
                  ),
                ),
                cursorColor: const Color(0xFF0ECB81),
                maxLines: null, // 여러 줄 텍스트 입력 가능
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: _submitComment,
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF0ECB81),
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
