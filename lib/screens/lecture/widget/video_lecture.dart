import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../theme/app_theme.dart';
import '../Item/course_card_item.dart';

final ThemeData theme = AppTheme.appTheme;

class VideoLecture extends StatefulWidget {
  final CourseCardItem courseCardItem;

  const VideoLecture({
    Key? key,
    required this.courseCardItem,
  }) : super(key: key);

  @override
  _VideoLectureState createState() => _VideoLectureState();
}

class _VideoLectureState extends State<VideoLecture> {
  late CourseCardItem courseCardItem;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    courseCardItem = widget.courseCardItem;
    _controller = YoutubePlayerController(
      initialVideoId: courseCardItem.videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      child: YoutubePlayer(
        controller: _controller,
        progressColors: ProgressBarColors(
          playedColor: theme.primaryColor,
          handleColor: theme.primaryColor,
        ),
      ),
    );
  }
}
