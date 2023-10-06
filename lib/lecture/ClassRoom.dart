import 'package:flutter/material.dart';
import 'package:stocodi_app/lecture/widget/ClassRoomLecture.dart';
import '../theme/ClassRoomLectureTheme.dart';
import 'Item/CourseItem.dart';
import 'package:stocodi_app/lecture/data/PredefinedClassRoomData.dart';

final theme = ClassRoomLectureTheme.getAppTheme();
final textTheme = theme.textTheme;
class ClassRoom extends StatelessWidget {
  const ClassRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        title: Text('강의실', style: textTheme.displayLarge),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Color(0xff191919)),
            onPressed: () {
              //기능
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 400,
              child: ClassRoomLecture(),
            ),
            CourseItem(courseTitle: '실시간 인기강의', courseList: courseList),
            CourseItem(courseTitle: 'Course1', courseList: courseList),
            CourseItem(courseTitle: 'Course2', courseList: courseList),
          ],
        ),
      ),
    );
  }
}
