import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/lecture/widget/video_lecture.dart';
import '../Item/classroom_course_item.dart';
import 'video_detail.dart';

class VideoScreenActivity extends StatefulWidget {
  final ClassRoomCourseItem courseCardItem;
  final Function onReturnFromLecture;
  final Function isFullScreen;


  const VideoScreenActivity({
    Key? key,
    required this.courseCardItem,
    required this.onReturnFromLecture,
    required this.isFullScreen,
  }) : super(key: key);

  @override
  _VideoScreenActivityState createState() => _VideoScreenActivityState();
}

class _VideoScreenActivityState extends State<VideoScreenActivity> {
  late ClassRoomCourseItem courseCardItem;
  bool isLectureTabVisible = true; // 가시성 상태를 추적

  @override
  void initState() {
    super.initState();
    courseCardItem = widget.courseCardItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          VideoLecture(
            courseCardItem: courseCardItem,
            onReturnFromLecture: widget.onReturnFromLecture,
            isFullScreen: (visible){
              setState(() {
                isLectureTabVisible = visible;
              });
              WidgetsBinding.instance.addPostFrameCallback((_) {
                widget.isFullScreen(visible);
              });
            },
          ),
          isLectureTabVisible ? VideoDetail(courseCardItem: courseCardItem,) : Container(),
        ],
      ),
    );
  }
}