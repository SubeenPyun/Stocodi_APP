import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/lecture/widget/video_lecture2.dart';
import '../Item/total_course_item.dart';
import 'video_detail2.dart';

class VideoScreenActivity2 extends StatefulWidget {
  final ClassRoomTotalItem courseCardItem;
  final Function onReturnFromLecture;
  final Function isFullScreen;


  const VideoScreenActivity2({
    Key? key,
    required this.courseCardItem,
    required this.onReturnFromLecture,
    required this.isFullScreen,
  }) : super(key: key);

  @override
  _VideoScreenActivityState2 createState() => _VideoScreenActivityState2();
}

class _VideoScreenActivityState2 extends State<VideoScreenActivity2> {
  late ClassRoomTotalItem courseCardItem;
  bool isLectureTabVisible = true; // 가시성 상태를 추적

  @override
  void initState() {
    super.initState();
    courseCardItem = widget.courseCardItem;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification) {
          FocusScope.of(context).unfocus();
        }
        return false;
      },
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VideoLecture2(
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
            isLectureTabVisible ? VideoDetail2(courseCardItem: courseCardItem,) : Container(),
          ],
        ),
      ),
    );
  }
}