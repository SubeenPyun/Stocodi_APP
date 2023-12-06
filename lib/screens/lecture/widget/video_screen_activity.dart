import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/lecture/widget/video_lecture.dart';
import 'package:stocodi_app/theme/app_theme.dart';
import '../Item/course_card_item.dart';
import '../Test/figmatoflutterTest.dart';

class VideoScreenActivity extends StatefulWidget {
  final CourseCardItem courseCardItem;


  const VideoScreenActivity({
    Key? key,
    required this.courseCardItem,
  }) : super(key: key);

    @override
  _VideoScreenActivityState createState() => _VideoScreenActivityState();
}

class _VideoScreenActivityState extends State<VideoScreenActivity> {
  late CourseCardItem courseCardItem;

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
          VideoLecture(courseCardItem: courseCardItem,),
          VideoDetails(courseCardItem: courseCardItem,),
        ],
      ),
    );
  }
}