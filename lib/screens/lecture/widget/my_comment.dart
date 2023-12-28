import 'package:flutter/material.dart';

import '../../../API/retrofit/auth_manager.dart';
import '../../../model/lecture/request/comment_model.dart';


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
              onPressed: () {
                _submitComment(context);
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF0ECB81),
              ),
              child: const Text('입력'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _submitComment(BuildContext context) async {
    String comment = _commentController.text;
    if (comment.isNotEmpty) {
      print('댓글: $comment');
      CommentRequest commentRequest = CommentRequest(
        lecture_id: 1,
        content: comment,
      );
      final authenticationManager = AuthenticationManager();
      var commentResponse = await authenticationManager.writeComment(commentRequest);

      if (commentResponse == null) {
        _showErrorDialog(context, '댓글 작성에 실패했어요..');
      }
      _commentController.clear();
    } else {
      _showErrorDialog(context, '댓글을 입력하세요.');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('경고'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
