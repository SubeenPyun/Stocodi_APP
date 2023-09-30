import 'package:flutter/material.dart';
import 'package:stocodi_app/lecture/LectureTabActivity.dart';
import 'package:stocodi_app/lecture/VideoScreenActivity.dart';

void main() {
  runApp(const LectureActivity());
}

class LectureActivity extends StatelessWidget {
  const LectureActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            VideoScreenActivity(),
            Expanded(
              child: LectureTabActivity(),
            ),
          ],
        ),
      ),
    );
  }
}
