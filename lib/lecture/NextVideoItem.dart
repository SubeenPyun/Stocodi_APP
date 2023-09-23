import 'package:flutter/material.dart';
import 'package:stocodi_app/theme/NextVideoTheme.dart';

final textTheme = AppTheme.getAppTheme().textTheme;
class VideoCard extends StatelessWidget {
  final String title;
  final String nickname;
  final String uploadDate;
  final String views;
  final String thumbnailUrl;

  const VideoCard({super.key,
    required this.title,
    required this.nickname,
    required this.uploadDate,
    required this.views,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 동영상 재생 기능 추가
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer, // 미디어 모서리를 깎기 위해 추가
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // 모서리 깎기
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(thumbnailUrl, width: 160.0, height: 90.0), // 썸네일 이미지
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: textTheme.displayLarge
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        nickname,
                        style: textTheme.displayMedium
                    ),
                  ),
                  Row(
                      children: [Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            uploadDate,
                            style: textTheme.displaySmall
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              views,
                              style: textTheme.displaySmall
                          ),
                        ),
                      ]
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
