import 'package:flutter/material.dart';
import '../../../theme/lecture_video_theme.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as yt;

final theme = LectureVideoTheme.getAppTheme();
final textTheme = theme.textTheme;

class VideoDetails extends StatefulWidget {
  final String videoId;

  const VideoDetails({Key? key, required this.videoId}) : super(key: key);

  @override
  _VideoDetailsState createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  late String? title = null;
  late String? date = null;
  late String? views = null;
  late String? author = null;
  late String? description = null; // 비디오 설명을 저장할 변수
  late String? authorProfileImage = null; // 프로필 이미지 주소를 저장할 변수
  bool showDetails = false;

  @override
  void initState() {
    super.initState();
    getVideoDetails();
  }

  Future<void> getVideoDetails() async {
    var ytInstance = yt.YoutubeExplode();
    var video = await ytInstance.videos.get(widget.videoId);

    setState(() {
      title = video.title;
      date = video.uploadDate.toString();
      views = '조회수 ${video.engagement.viewCount}';
      author = video.author;
    });

    // 작성자(author)의 채널 정보 가져오기
    var channel = await ytInstance.channels.getByUsername(author!); // 수정된 부분
    authorProfileImage = channel.logoUrl;

    ytInstance.close();
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
              title ?? '로딩 중...',
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
                  if (showDetails) {
                    getVideoDescription(); // 더보기를 눌렀을 때 비디오 설명 가져오기
                  }
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
                    '비디오 설명',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description ?? '상세 설명이 없습니다.',
                    style: TextStyle(fontSize: 14),
                  ),
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
        ],
      ),
    );
  }

  // 더보기를 눌렀을 때 비디오 설명 가져오는 함수
  void getVideoDescription() async {
    var ytInstance = yt.YoutubeExplode();
    var video = await ytInstance.videos.get(widget.videoId);

    // 비디오 설명을 가져와서 변수에 저장
    description = video.description;

    ytInstance.close();

    setState(() {}); // 상태 갱신
  }
}
