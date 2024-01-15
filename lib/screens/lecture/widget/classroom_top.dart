import 'package:flutter/material.dart';
import '../../../theme/classroom_top_theme.dart';
import '../data/predefined_classroom_data.dart';

final theme = ClassRoomTopTheme.getAppTheme();
final textTheme = theme.textTheme;

class ClassRoomTop extends StatelessWidget {
  const ClassRoomTop({super.key});

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
    final screenWidth = MediaQuery.of(context).size.width;
    final isNarrowScreen = screenWidth < 600; // 예시 너비 (조정 가능)

    final containerMargin = isNarrowScreen
        ? const EdgeInsets.fromLTRB(10, 10, 10, 10)
        : const EdgeInsets.fromLTRB(25, 20, 25, 20); // 너비에 따른 마진 조정
    final containerBorderRadius = isNarrowScreen ? BorderRadius.circular(10) : BorderRadius.circular(20); // 너비에 따른 BorderRadius 조정

    return Scaffold(
      backgroundColor: theme.canvasColor,
      body: SizedBox(
        height: isNarrowScreen ? 350 : 550, // 너비에 따른 높이 조정
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: containerMargin,
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: containerBorderRadius,
                      image: DecorationImage(
                        image: AssetImage(images[index]),
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
