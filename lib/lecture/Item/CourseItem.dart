import 'package:flutter/material.dart';
import 'package:stocodi_app/lecture/data/CourseData.dart';
import 'package:stocodi_app/theme/ClassRoomTheme.dart';

import '../Lecture.dart';

final theme = ClassRoomTheme.getAppTheme();
final textTheme = theme.textTheme;

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
                      child: Text(courseTitle, style: textTheme.displayLarge),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 4),
                      child: Icon(Icons.chevron_right, color: theme.primaryColor, size: 35),
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

  const CourseCard({
    Key? key, required this.courseTitle, required this.courseDescription, required this.courseImage,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // CourseCard 클릭 시 VideoScreenActivity로 이동
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Lecture(),
          ),
        );
      },
      child: Container(
        width: 200,
        height: 165,
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽으로 정렬
          children: [
            Container(
              width: 200,
              height: 112,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(courseImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5), // 이미지와 텍스트 사이의 공간을 조절
            Text(courseTitle, style: textTheme.displayMedium),
            Text(courseDescription, style: textTheme.displaySmall),
          ],
        ),
      ),
    );
  }
}