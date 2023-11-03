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
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 1,
        itemBuilder: (BuildContext outerContext, int outerIndex) {
          return Column(
            children: [
              VideoScreenActivity(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: screenHeight * 0.5,
                    child: LectureTab(),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

