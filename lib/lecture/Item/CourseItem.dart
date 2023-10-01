import 'package:flutter/material.dart';
import 'package:stocodi_app/theme/ClassRoomTheme.dart';
import 'package:stocodi_app/lecture/data/CourseData.dart';

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(courseTitle, style: textTheme.displayLarge),
                    SizedBox(
                      width: 28,
                      height: 28,
                      child: Icon(Icons.arrow_right, color: theme.primaryColor),
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
    return Container(
      width: 200,
      height: 165,
      margin: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(courseTitle, style: textTheme.displayMedium),
              Text(courseDescription, style: textTheme.displaySmall),
            ],
          ),
        ],
      ),
    );
  }
}
