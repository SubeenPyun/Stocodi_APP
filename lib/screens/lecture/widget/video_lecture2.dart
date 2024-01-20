import 'package:flutter/material.dart';
import 'package:stocodi_app/api/lecture/lecture_manager.dart';
import 'package:stocodi_app/model/lecture/request/watching_lecture_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../analytics_helper.dart';
import '../../../theme/app_theme.dart';
import '../Item/total_course_item.dart';

final ThemeData theme = AppTheme.appTheme;

class VideoLecture2 extends StatefulWidget {
  final ClassRoomTotalItem courseCardItem;
  final Function onReturnFromLecture;
  final Function isFullScreen;

  const VideoLecture2({
    Key? key,
    required this.courseCardItem,
    required this.onReturnFromLecture,
    required this.isFullScreen,
  }) : super(key: key);

  @override
  _VideoLectureState2 createState() => _VideoLectureState2();
}

class _VideoLectureState2 extends State<VideoLecture2> {
  late ClassRoomTotalItem courseCardItem;
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
        disableDragSeek: true,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )
      ..addListener(_listener);

    setState(() {
      _initialized = true;
    });
  }

  Future<void> _listener() async {
    if (_controller.value.isReady && !_hasStarted) {
      _controller.seekTo(Duration(seconds: seconds));
      _controller.play();
      _hasStarted = true;
    }

    if (_isPlayerReady && _controller.value.playerState == PlayerState.paused) {
      Duration pausedPosition = _controller.value.position;
      print("유튜브 영상 일시 정지 at : ${pausedPosition.inSeconds} 초");
      WatchingLectureRequest watchingLectureRequest = WatchingLectureRequest(
        lecture_id: widget.courseCardItem.lectureId,
        time: pausedPosition.inSeconds.toString(),
      );

      try {
        if (isWatched) {
          await lectureManager.changeWatchedTime(watchingLectureRequest);
        } else {
          await lectureManager.addWatchingLectureList(watchingLectureRequest);
        }
        await widget.onReturnFromLecture();
      } catch (e) {
        print("예외 발생: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return Container();
    }

    return WillPopScope(
      onWillPop: () async {
        AnalyticsHelper.gaEvent("lecture_to_classroom", {"lecture_id": widget.courseCardItem.lectureId});
        _controller.pause();
        Navigator.pop(context);
        return true;
      },
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
            width: double.infinity,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.3
                : MediaQuery.of(context).size.height,
            child: YoutubePlayerBuilder(
              onEnterFullScreen: (){
                _updateFullScreen(false);
              },
              onExitFullScreen: () {
                _updateFullScreen(true);
              },
              player: YoutubePlayer(
                aspectRatio: MediaQuery.of(context).size.height / MediaQuery.of(context).size.width,
                controller: _controller,
                progressColors: ProgressBarColors(
                  playedColor: theme.primaryColor,
                  handleColor: theme.primaryColor,
                ),
                onReady: () {
                  _isPlayerReady = true;
                },
                onEnded: (YoutubeMetaData metaData) async {
                  if (isWatched) {
                    await lectureManager.deleteWatchingLecture(widget.courseCardItem.lectureId);
                    await widget.onReturnFromLecture();
                  }
                },
              ),
              builder: (context, player) {
                return player;
              },
            ),
          );
        },
      ),
    );
  }

  void _updateFullScreen(bool isFullScreen) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.isFullScreen(isFullScreen);
    });
  }
}
