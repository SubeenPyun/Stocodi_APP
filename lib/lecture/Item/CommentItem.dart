import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({
    this.name = 'Your Name',
    this.profileImage = 'Y',
    required this.text,
  });

  final String name;
  final String profileImage;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 15, 0),
            child: CircleAvatar(
              backgroundImage: AssetImage(profileImage), // 프로필 이미지 설정
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(name, style: Theme.of(context).textTheme.subtitle2),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}