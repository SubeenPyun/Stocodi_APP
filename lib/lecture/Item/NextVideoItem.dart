import 'package:flutter/material.dart';
import 'package:stocodi_app/theme/NextVideoTheme.dart';

final textTheme = AppTheme.getAppTheme().textTheme;

class VideoCard extends StatelessWidget {
  final String title;
  final String nickname;
  final String uploadDate;
  final String views;
  final String thumbnailUrl;

  const VideoCard({
    super.key,
    required this.title,
    required this.nickname,
    required this.uploadDate,
    required this.views,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isNarrowScreen = screenWidth < 600; // 예시 너비 (조정 가능)

    final titleStyle = isNarrowScreen ? textTheme.displayLarge : textTheme.displayLarge; // 너비에 따른 스타일 조정
    final nicknameStyle = isNarrowScreen ? textTheme.displayMedium : textTheme.displayMedium; // 너비에 따른 스타일 조정
    final dateAndViewsStyle = isNarrowScreen ? textTheme.displaySmall : textTheme.displaySmall; // 너비에 따른 스타일 조정
    double imageWidth = isNarrowScreen ? 160.0 : 200.0;
    double imageHeight = isNarrowScreen ? 90.0 : 112.5;

    return GestureDetector(
      onTap: () {
        // 동영상 재생 기능 추가
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(5, 12, 0, 12),
              width: imageWidth,
              height: imageHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/kakao.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title, style: titleStyle,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(nickname, style: nicknameStyle,),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(uploadDate, style: dateAndViewsStyle,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(views, style: dateAndViewsStyle,),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
