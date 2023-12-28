import 'package:flutter/material.dart';
import '../../../API/retrofit/auth_manager.dart';
import '../../../model/lecture/request/comment_model.dart';
import '../Item/comment_item.dart';

void main() {
  runApp(const LectureComment());
}

class LectureComment extends StatelessWidget {
  const LectureComment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 65,
              child: LectureMyComment(imageUrl: 'assets/kakao.jpg'),
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

class LectureMyComment extends StatefulWidget {
  final String imageUrl;

  const LectureMyComment({Key? key, required this.imageUrl}) : super(key: key);

  @override
  _LectureMyCommentState createState() => _LectureMyCommentState();
}

class _LectureMyCommentState extends State<LectureMyComment> {
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