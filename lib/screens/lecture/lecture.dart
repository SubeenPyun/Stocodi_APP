import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/lecture/Item/classroom_course_item.dart';
import 'package:stocodi_app/screens/lecture/widget/lecture_tab.dart';
import 'package:stocodi_app/screens/lecture/widget/video_screen_activity.dart';

class Lecture extends StatefulWidget {
  final ClassRoomCourseItem courseCardItem;
  final Function onReturnFromLecture;

  const Lecture({
    Key? key,
    required this.courseCardItem,
    required this.onReturnFromLecture,
  }) : super(key: key);

  @override
  _LectureState createState() => _LectureState();
}

class _LectureState extends State<Lecture> {
  late ClassRoomCourseItem courseCardItem;
  bool isLectureTabVisible = true; // 가시성 상태를 추적

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
              VideoScreenActivity(
                courseCardItem: courseCardItem,
                onReturnFromLecture: widget.onReturnFromLecture,
                isFullScreen: (visible){
                  print('화면전환 2$visible');
                  setState(() {
                    isLectureTabVisible = visible;
                  });
                }
              ),
              Visibility(
                visible: isLectureTabVisible,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: screenHeight * 0.5,
                      child: LectureTab(lectureId: courseCardItem.lectureId),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
