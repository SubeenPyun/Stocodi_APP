import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/lecture/widget/video_lecture.dart';
import '../Item/classroom_course_item.dart';
import 'video_detail.dart';

class VideoScreenActivity extends StatefulWidget {
  final ClassRoomCourseItem courseCardItem;
  final Function onReturnFromLecture;


  const VideoScreenActivity({
    Key? key,
    required this.courseCardItem,
    required this.onReturnFromLecture,
  }) : super(key: key);

  @override
  _VideoScreenActivityState createState() => _VideoScreenActivityState();
}

class _VideoScreenActivityState extends State<VideoScreenActivity> {
  late ClassRoomCourseItem courseCardItem;

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
          VideoLecture(courseCardItem: courseCardItem, onReturnFromLecture: widget.onReturnFromLecture,),
          VideoDetail(courseCardItem: courseCardItem,),
        ],
      ),
    );
  }
}