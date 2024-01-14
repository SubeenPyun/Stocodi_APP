import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/lecture/Item/total_course_item.dart';
import 'package:stocodi_app/screens/lecture/widget/lecture_tab.dart';
import 'package:stocodi_app/screens/lecture/widget/video_screen_activity2.dart';

class Lecture2 extends StatefulWidget {
  final ClassRoomTotalItem courseCardItem;

  const Lecture2({
    Key? key,
    required this.courseCardItem,
  }) : super(key: key);

  @override
  _LectureState createState() => _LectureState();
}

class _LectureState extends State<Lecture2> {
  late ClassRoomTotalItem courseCardItem;

  @override
  void initState() {
    super.initState();
    courseCardItem = widget.courseCardItem;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 1,
        itemBuilder: (BuildContext outerContext, int outerIndex) {
          return Column(
            children: [
              VideoScreenActivity2(
                courseCardItem: courseCardItem,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: screenHeight * 0.5,
                    child: LectureTab(lectureId: courseCardItem.lectureId),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
