import 'package:flutter/material.dart';
import 'package:stocodi_app/theme/ClassRoomLectureTheme.dart';
import 'package:stocodi_app/lecture/data/PredefinedClassRoomData.dart';
final theme = ClassRoomLectureTheme.getAppTheme();
final textTheme = theme.textTheme;
class ClassRoomLecture extends StatelessWidget {
  const ClassRoomLecture({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LectureSlider(),
    );
  }
}

class LectureSlider extends StatefulWidget {
  const LectureSlider({super.key});

  @override
  _LectureSliderState createState() => _LectureSliderState();
}

class _LectureSliderState extends State<LectureSlider> {


  int currentIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SizedBox(
        height: 350,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(25, 20, 25, 20), // Adjust the values as needed
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(images[index]), // Load image from assets
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            /*const SizedBox(height: 20.0),*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: index == currentIndex ? selected : unselected,
                );
              }),
            ),
            const SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}
