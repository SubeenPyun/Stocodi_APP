import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/lecture/widget/classroom_top.dart';
import '../../theme/classroom_top_theme.dart';
import 'Item/classroom_couse_list_item.dart';
import 'data/predefined_classroom_data.dart';

final theme = ClassRoomTopTheme.getAppTheme();
final textTheme = theme.textTheme;
class ClassRoom extends StatelessWidget {
  const ClassRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
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
            SizedBox(
              height: screenHeight * 0.37,
              width: MediaQuery.of(context).size.width,
              child: ClassRoomTop(),
            ),
            ClassRoomCourseListItem(courseTitle: '실시간 인기강의', courseList: courseList),
            ClassRoomCourseListItem(courseTitle: 'Course1', courseList: courseList),
            ClassRoomCourseListItem(courseTitle: 'Course2', courseList: courseList),
          ],
        ),
      ),
    );
  }
}
