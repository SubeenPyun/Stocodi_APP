import 'package:flutter/material.dart';
import 'package:stocodi_app/lecture/widget/ClassRoomLecture.dart';
import 'Item/CourseItem.dart';
import 'package:stocodi_app/lecture/data/PredefinedClassRoomData.dart';

class ClassRoom extends StatelessWidget {
  const ClassRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: SizedBox(
            height: 400,
            child: ClassRoomLecture(),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white, // 배경색을 흰색으로 설정
            child: ListView(
              padding: EdgeInsets.zero, // 여기에 패딩을 제거합니다.
              shrinkWrap: true,
              children: [
                CourseItem(courseTitle: '실시간 인기강의', courseList: courseList),
                CourseItem(courseTitle: 'Course1', courseList: courseList),
                CourseItem(courseTitle: 'Course2', courseList: courseList),
                // 필요한 만큼 더 많은 CourseItem 위젯을 추가할 수 있습니다.
              ],
            ),
          ),
        ),
      ],
    );
  }
}
