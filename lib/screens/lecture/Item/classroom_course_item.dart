import 'package:flutter/material.dart';
import '../../../theme/class_room_theme.dart';
import '../lecture.dart';

final theme = ClassRoomTheme.getAppTheme();
final textTheme = theme.textTheme;

class ClassRoomCourseItem extends StatelessWidget {
  final String courseTitle;
  final String courseDescription;
  final Widget courseImage;
  final String videoLink;
  final int lectureId;
  final Function onReturnFromLecture;


  const ClassRoomCourseItem({
    Key? key,
    required this.courseTitle,
    required this.courseDescription,
    required this.courseImage,
    required this.videoLink,
    required this.lectureId,
    required this.onReturnFromLecture
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.5;
    double cardHeight = cardWidth * 0.8;

    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Lecture(courseCardItem: this,),
          ),
        );
        // 이 부분은 Lecture 화면에서 뒤로 돌아왔을 때 실행될 코드입니다.
        onReturnFromLecture();
      },
      child: IntrinsicHeight(
        child: Container(
          width: cardWidth,
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: cardWidth,
                height: cardHeight * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage('assets/placeholder_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: courseImage,
              ),
              const SizedBox(height: 5),
              Text(courseTitle, style: textTheme.displayMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
              Text(courseDescription, style: textTheme.displaySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}
