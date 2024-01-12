import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({
    super.key,
    this.name = 'Your Name',
    this.profileImage = 'Y',
    required this.text,
    required this.created,
    required this.onDelete,
  });

  final String name;
  final String profileImage;
  final String text;
  final String created;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrowScreen = constraints.maxWidth < 600; // 예시 너비 (조정 가능)

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 15, 0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(profileImage),
                  radius: isNarrowScreen ? 20.0 : 30.0, // 너비에 따라 크기 조정
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: Theme.of(context).textTheme.subtitle2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        text,
                        overflow: TextOverflow.ellipsis,
                        maxLines: isNarrowScreen ? 3 : 5, // 너비에 따라 텍스트 줄 수 조정
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
