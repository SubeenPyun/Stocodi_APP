import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  final String name;
  final String profileImage;
  final String text;
  final String created;
  final bool myComment;
  final VoidCallback onDelete;

  const CommentItem({
    super.key,
    this.name = 'Your Name',
    this.profileImage = 'Y',
    required this.text,
    required this.created,
    required this.myComment,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrowScreen = constraints.maxWidth < 600; // 예시 너비 (조정 가능)

        return Container(
          margin: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
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
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        text,
                        overflow: TextOverflow.visible,
                        maxLines: 100, // 너비에 따라 텍스트 줄 수 조정
                      ),
                    ),
                  ],
                ),
              ),
              if(myComment)
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: onDelete,
                )
            ],
          ),
        );
      },
    );
  }
}
