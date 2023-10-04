import 'package:flutter/material.dart';
import 'package:stocodi_app/lecture/widget/VideoDetails.dart';
import 'package:stocodi_app/lecture/widget/VideoLecture.dart';
class VideoScreenActivity extends StatelessWidget {
  const VideoScreenActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          VideoLecture(),
          VideoDetails(),
        ],
      ),
    );
  }
}