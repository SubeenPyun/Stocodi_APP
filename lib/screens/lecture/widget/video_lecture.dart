import 'package:flutter/material.dart';
import 'package:stocodi_app/api/lecture/lecture_manager.dart';
import 'package:stocodi_app/model/lecture/request/watching_lecture_model.dart';
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
  LectureManager lectureManager = LectureManager();
  String? secondsResponse;
  int seconds = 0;
  bool _initialized = false;
  bool isWatched = false;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    uri = Uri.parse(widget.courseCardItem.videoLink);
    youtubeId = uri.queryParameters['v'] ?? '';
    courseCardItem = widget.courseCardItem;

    try {
      // 시청 중인 강의일 경우 seconds 부터 재생
      secondsResponse = await lectureManager.isWatched(courseCardItem.lectureId);
      seconds = int.parse(secondsResponse!);
      isWatched = true;
    } catch (e) {
      print("시청 중인 강의가 아닙니다.");
    }

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
    )..addListener(_listener);

    setState(() {
      _initialized = true;
    });
  }

  void _listener(){
    if (_controller.value.isReady && !_hasStarted) {
      _controller.seekTo(Duration(seconds: seconds));
      _controller.play();
      _hasStarted = true;
    }

    if(_isPlayerReady && _controller.value.playerState == PlayerState.paused){
      Duration pausedPosition = _controller.value.position;
      print("유튜브 영상 일시 정지 at : ${pausedPosition.inSeconds} 초");
      WatchingLectureRequest watchingLectureRequest = WatchingLectureRequest(lecture_id: widget.courseCardItem.lectureId, time: pausedPosition.inSeconds.toString());

      if(isWatched){
        lectureManager.changeWatchedTime(watchingLectureRequest);
      }
      else{
        lectureManager.addWatchingLectureList(watchingLectureRequest);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return Container(); // 또는 초기화 중임을 나타내는 다른 위젯을 반환할 수 있습니다.
    }

    return WillPopScope(
      onWillPop: () async {
        // 뒤로가기 버튼이 눌렸을 때 실행되는 코드
        _controller.pause();
        Navigator.pop(context);
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

            // 시청 중 강의를 끝까지 본 경우 시청 중 강의 리스트에서 삭제
            if(isWatched){
              lectureManager.deleteWatchingLecture(widget.courseCardItem.lectureId);
            }
          },
        ),
      ),
    );
  }
}
