import 'package:flutter/material.dart';
import 'package:stocodi_app/lecture/data/CourseData.dart';
import 'package:stocodi_app/theme/ClassRoomTheme.dart';
import 'package:stocodi_app/theme/ClassRoomThemeBig.dart';

import '../Lecture.dart';

final theme = ClassRoomTheme.getAppTheme();
final textTheme = theme.textTheme;
final bigTheme = ClassRoomThemeBig.getAppTheme();
final bigtextTheme = bigTheme.textTheme;

class CourseItem extends StatelessWidget {
  final String courseTitle;
  final List<CourseData> courseList;

  const CourseItem({
    Key? key,
    required this.courseTitle,
    required this.courseList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isNarrowScreen = screenWidth < 600;

    final titleStyle = isNarrowScreen ? textTheme.displayLarge : bigtextTheme.displayLarge;
    final iconSize = isNarrowScreen ? 25.0 : 35.0;

    return Container(
      color: theme.backgroundColor,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 4),
                      child: Text(courseTitle, style: titleStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 4),
                      child: Icon(Icons.chevron_right, color: theme.primaryColor, size: iconSize),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: courseList.map((courseData) {
                    return CourseCard(
                      courseTitle: courseData.title,
                      courseDescription: courseData.description,
                      courseImage: courseData.imagePath,
                      isNarrowScreen: isNarrowScreen,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String courseTitle;
  final String courseDescription;
  final String courseImage;
  final bool isNarrowScreen;

  const CourseCard({
    Key? key,
    required this.courseTitle,
    required this.courseDescription,
    required this.courseImage,
    required this.isNarrowScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final containerWidth = isNarrowScreen ? 200.0: 230.0;
    final containerHeight = isNarrowScreen ? 165.0: 189.75;
    final titleStyle = isNarrowScreen ? textTheme.displayMedium : bigtextTheme.displayMedium;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Lecture(),
          ),
        );
      },
      child: Container(
        width: containerWidth,
        height: containerHeight,
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: containerWidth,
              height: containerHeight * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(courseImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(courseTitle, style: titleStyle),
            Text(courseDescription, style: textTheme.displaySmall),
          ],
        ),
      ),
    );
  }
}
