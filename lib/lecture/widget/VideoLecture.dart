import 'package:flutter/material.dart';

class VideoLecture extends StatelessWidget {
  const VideoLecture({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
      padding: const EdgeInsets.fromLTRB(0, 217, 0, 0),
      width: double.infinity,
      height: MediaQuery.of(context).size.height* 0.3,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/kakao.jpg'), // 이미지 파일의 경로를 적절히 수정하세요.
        ),
      ),
    );
  }
}