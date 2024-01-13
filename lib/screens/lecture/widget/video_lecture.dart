
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../theme/app_theme.dart';
import '../Item/classroom_course_item.dart';

final ThemeData theme = AppTheme.appTheme;

class VideoLecture extends StatefulWidget {
  final ClassRoomCourseItem courseCardItem;

  const VideoLecture({
    Key? key,
    required this.courseCardItem,
  }) : super(key: key);

  @override
  _VideoLectureState createState() => _VideoLectureState();
}

class _VideoLectureState extends State<VideoLecture>{
  late ClassRoomCourseItem courseCardItem;
  late YoutubePlayerController _controller;
  String youtubeId = '';
  bool _isPlayerReady = false;
  bool _hasStarted = false;
  late Uri uri;

  @override
  void initState() {
    super.initState();
    uri = Uri.parse(widget.courseCardItem.videoLink);
    youtubeId = uri.queryParameters['v'] ?? '';
    courseCardItem = widget.courseCardItem;
    _controller = YoutubePlayerController(
      initialVideoId: youtubeId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )
      ..addListener(_listener);
  }

  void _listener(){
      if (_controller.value.isReady && !_hasStarted) {
        _controller.seekTo(const Duration(seconds: 30));
        _controller.play();
        _hasStarted = true;
      }

      if(_isPlayerReady && _controller.value.playerState == PlayerState.paused){
        Duration pausedPosition = _controller.value.position;
        print("유튜브 영상 일시 정지 at : ${pausedPosition.inSeconds} 초");
      }
    }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // 뒤로가기 버튼이 눌렸을 때 실행되는 코드
        _controller.pause();
        // Duration currentPosition = _controller.value.position;
        // print("사용자가 뒤로가기 버튼을 누른 시점에서의 영상 재생 위치: ${currentPosition.inSeconds} 초");
        return true; // true를 반환하면 뒤로가기 허용, false를 반환하면 뒤로가기 차단
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        child: YoutubePlayer(
          controller: _controller,
          progressColors: ProgressBarColors(
            playedColor: theme.primaryColor,
            handleColor: theme.primaryColor,
          ),
          onReady: () {
            _isPlayerReady = true;
          },
          onEnded: (YoutubeMetaData metaData) {
            // 영상이 종료되었을 때 호출되는 콜백
            print('영상이 종료되었습니다.: $metaData');
          },
        ),
      ),
    );
  }
}
