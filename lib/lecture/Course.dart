import 'package:flutter/material.dart';
import 'package:stocodi_app/theme/ClassRoomTheme.dart';

final theme = ClassRoomTheme.getAppTheme();
final textTheme = theme.textTheme;

class Course extends StatelessWidget {
  const Course({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.backgroundColor, // Set the background color using the theme
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('실시간 인기 강의', style: textTheme.displayLarge,),
                    SizedBox(
                      width: 28,
                      height: 28,
                      child: Icon(Icons.arrow_right, color: theme.primaryColor),
                    ),
                  ],
                ),
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CourseCard(
                      courseTitle: 'Course Title 1',
                      courseDescription: 'Description of Course 1',
                      courseImage: 'assets/kakao.jpg', // Replace with the actual image asset path
                    ),
                    CourseCard(
                      courseTitle: 'Course Title 2',
                      courseDescription: 'Description of Course 2',
                      courseImage: 'assets/kakao.jpg', // Replace with the actual image asset path
                    ),
                    CourseCard(
                      courseTitle: 'Course Title 2',
                      courseDescription: 'Description of Course 2',
                      courseImage: 'assets/kakao.jpg', // Replace with the actual image asset path
                    ),
                    // ...
                  ],
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

  const CourseCard({super.key,
    required this.courseTitle,
    required this.courseDescription,
    required this.courseImage,
  });

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
                image: AssetImage(courseImage), // Use AssetImage to load the image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(courseTitle, style: textTheme.displayMedium,),
              Text(courseDescription, style: textTheme.displaySmall),
            ],
          ),
        ],
      ),
    );
  }
}
