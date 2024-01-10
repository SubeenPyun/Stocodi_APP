import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../../api/lecture_subin/lecture_manager.dart';
import '../../../model/lecture/response/lecture_response.dart';
import '../../../theme/lecture_video_theme.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as yt;

import '../Item/classroom_course_item.dart';

final theme = LectureVideoTheme.getAppTheme();
final textTheme = theme.textTheme;

class VideoDetail extends StatefulWidget {
  final ClassRoomCourseItem courseCardItem;

  const VideoDetail({
    Key? key,
    required this.courseCardItem,
  }) : super(key: key);

  @override
  _VideoDetailsState createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetail> {
  late String? title = null;
  late String? date = null;
  late String? views = null;
  late String? author = null;
  late String? description = null; // 비디오 설명을 저장할 변수
  late String? authorProfileImage = null; // 프로필 이미지 주소를 저장할 변수
  bool showDetails = false;
  int likes = 60; // 가정한 '좋아요' 수

  bool isLikeButtonPressed = false; // 버튼 상태를 추적하는 변수
  bool isScrapButtonPressed = false;

  LectureManager lectureManager = LectureManager();

  @override
  void initState() {
    super.initState();
    increaseViews();
    getVideoDetails();
  }

  void increaseViews(){
    lectureManager.lectureViews(widget.courseCardItem.lectureId.toString());
  }

  Future<void> getVideoDetails() async {
    var ytInstance = yt.YoutubeExplode();
    var video = await ytInstance.videos.get(widget.courseCardItem.videoLink);

    LectureResponse? lecture = await lectureManager.oneLecture(widget.courseCardItem.lectureId.toString());

    setState(() {
      title = lecture?.title;
      date = DateFormat('yyyy-MM-dd HH:mm').format(video.uploadDate!);
      views = '조회수 ${lecture?.views ?? 0}'; // 예시로 views를 가져오는 부분
      author = video.author;
    });

    // 작성자(author)의 채널 정보 가져오기
    var channel = await ytInstance.channels.getByUsername(author!); // 수정된 부분
    authorProfileImage = channel.logoUrl;
    ytInstance.close();
  }

  void _incrementLikes() {
    setState(() {
      if(isLikeButtonPressed) {
        likes--;
      } else {
        likes++;
      }
      isLikeButtonPressed = !isLikeButtonPressed;
    });
  }

  void _scrapLecture() {
    setState(() {
      isScrapButtonPressed = !isScrapButtonPressed;
    });
  }

  void _copyLink() {
    Clipboard.setData(ClipboardData(text: 'https://your.link.here'));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Link copied to clipboard!')),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 14, 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Text(
              widget.courseCardItem.courseTitle,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 17),
                child: Text(
                  date ?? '날짜 없음',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 23),
                child: Text(
                  views ?? '조회수 없음',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showDetails = !showDetails;
                  });
                  // if (showDetails) {
                  //   widget.courseCardItem.courseDescription; // 더보기를 눌렀을 때 비디오 설명 가져오기
                  // }
                },
                child: Text(
                  '더보기',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          if (showDetails)
            Container(
              margin: const EdgeInsets.fromLTRB(5, 20, 0, 0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.courseCardItem.courseDescription,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          Container(
            margin: const EdgeInsets.fromLTRB(5, 20, 0, 0),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: authorProfileImage != null
                        ? DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(authorProfileImage!), // 작성자 프로필 이미지
                    )
                        : const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/kakao.jpg'),
                    ), // 이미지가 없을 경우
                  ),
                ),
                Text(
                  author ?? '작성자 없음', // 작성자 이름을 표시하거나 '작성자 없음' 표시
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox( // 좋아요 버튼
                height: 40,
                child: ElevatedButton(
                  onPressed: _incrementLikes, // 버튼이 눌렸을 때 실행할 함수
                  style: ElevatedButton.styleFrom(
                    primary: isLikeButtonPressed ? Colors.green : Color(0xffF5F7F9), // 버튼의 배경 색상
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100), // 둥근 모서리
                    ),
                    elevation: 1, // 버튼의 그림자 깊이
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // 컨텐츠 크기에 맞게 조절
                    children: <Widget>[
                      Icon(Icons.favorite_border, size: 24, color: isLikeButtonPressed ? Colors.white : Color(0xff9BA6AF)), // 아이콘
                      SizedBox(width: 6), // 아이콘과 텍스트 사이의 간격
                      Text(
                        '${likes}K',
                        style: TextStyle(
                          fontSize: 13,
                          color: isLikeButtonPressed ? Colors.white : Color(0xff9BA6AF),
                        ),
                      ), // 텍스트
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: _scrapLecture, // 버튼이 눌렸을 때 실행할 함수
                  style: ElevatedButton.styleFrom(
                    primary: isScrapButtonPressed ? Colors.green : Color(0xffF5F7F9), // 버튼의 배경 색상
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100), // 둥근 모서리
                    ),
                    elevation: 1, // 버튼의 그림자 깊이
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // 컨텐츠 크기에 맞게 조절
                    children: <Widget>[
                      Icon(Icons.bookmark_border, size: 24, color: isScrapButtonPressed ? Colors.white : Color(0xff9BA6AF)), // 아이콘
                      SizedBox(width: 6), // 아이콘과 텍스트 사이의 간격
                      Text(
                        '스크랩',
                        style: TextStyle(
                          fontSize: 13,
                          color: isScrapButtonPressed ? Colors.white : Color(0xff9BA6AF),
                        ),
                      ), // 텍스트
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: (){}, // 버튼이 눌렸을 때 실행할 함수
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffF5F7F9), // 버튼의 배경 색상
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100), // 둥근 모서리
                    ),
                    elevation: 1, // 버튼의 그림자 깊이
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // 컨텐츠 크기에 맞게 조절
                    children: <Widget>[
                      Icon(Icons.content_copy_outlined, size: 24, color: Color(0xff9BA6AF)), // 아이콘
                      SizedBox(width: 6), // 아이콘과 텍스트 사이의 간격
                      Text(
                        '링크 복사',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff9BA6AF),
                        ),
                      ), // 텍스트
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12,)
        ],
      ),
    );
  }
}