import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/lecture/widget/video_lecture2.dart';
import '../Item/total_course_item.dart';
import 'video_detail2.dart';

class VideoScreenActivity2 extends StatefulWidget {
  final ClassRoomTotalItem courseCardItem;

  const VideoScreenActivity2({
    Key? key,
    required this.courseCardItem,
  }) : super(key: key);

  @override
  _VideoScreenActivityState createState() => _VideoScreenActivityState();
}

class _VideoScreenActivityState extends State<VideoScreenActivity2> {
  late ClassRoomTotalItem courseCardItem;

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
          VideoLecture2(courseCardItem: courseCardItem,),
          VideoDetail2(courseCardItem: courseCardItem,),
        ],
      ),
    );
  }
}