import 'package:flutter/material.dart';
import 'package:stocodi_app/theme/LectureVideoTheme.dart';

final theme = LectureVideoTheme.getAppTheme();
final textTheme = theme.textTheme;

class VideoDetails extends StatelessWidget {
  const VideoDetails({super.key});

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
            child: Text('초보 주식투자자들이 흔히 하는 실수 박곰희 1부', style: textTheme.displayLarge,),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 17),
                child: Text('2023.05.25', style: textTheme.displaySmall,),
              ),
              Container(
                margin: const EdgeInsets.only(right: 25),
                child: Text('조회 2.8천회', style: textTheme.displaySmall,),
              ),
              Text('더보기', style: textTheme.displaySmall,),
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(5, 20, 0, 0),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 32, height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/kakao.jpg'), // 이미지 파일의 경로를 적절히 수정하세요.
                    ),
                  ),
                ),
                Text('박곰희', style: textTheme.displayMedium,),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildActionContainer(width: 86, iconData: Icons.favorite, text: '60K', iconColor: const Color(0xFF9BA6AF), textStyle: textTheme.labelSmall,),
                buildActionContainer(width: 96, iconData: Icons.bookmark, text: '스크랩', iconColor: const Color(0xFF9BA6AF), textStyle: textTheme.labelSmall,),
                buildActionContainer(width: 110, iconData: Icons.link, text: '링크 복사', iconColor: const Color(0xFF9BA6AF), textStyle: textTheme.labelSmall,),
                const SizedBox(width: 25, height: 25, child: Icon(Icons.more_vert, color: Color(0xFF9BA6AF)),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildActionContainer({
    required double width,
    required IconData iconData,
    required String text,
    required Color iconColor,
    required TextStyle? textStyle,
  }) {
    return Container(
      width: width,
      height: double.infinity,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: const Color(0xfff5f7f9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 2, 0, 2),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: Icon(iconData, color: iconColor),
            ),
            Text(text, style: textStyle),
          ],
        ),
      ),
    );
  }
}
