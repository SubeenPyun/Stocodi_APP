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
    double screenHeight = MediaQuery.of(context).size.height;
    return ListView.builder(
      padding: EdgeInsets.zero, // 패딩을 없애기 위해 EdgeInsets.zero를 설정
      itemCount: 1, // 외부 ListView 항목 수
      itemBuilder: (BuildContext outerContext, int outerIndex) {
        return Column(
          children: [
            VideoScreenActivity(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    height: screenHeight * 0.7,
                    child: LectureTab()
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
