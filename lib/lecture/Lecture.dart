import 'package:flutter/material.dart';
import 'package:stocodi_app/lecture/widget/LectureTab.dart';
import 'package:stocodi_app/lecture/widget/VideoScreenActivity.dart';

void main() {
  runApp(const Lecture());
}

class Lecture extends StatelessWidget {
  const Lecture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          VideoScreenActivity(),
          Expanded(
            child: LectureTab(),
          ),
        ],
      ),
    );
  }
}
