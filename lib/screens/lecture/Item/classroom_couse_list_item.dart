import 'package:flutter/material.dart';
import '../../../api/image/image_service.dart';
import '../../../model/lecture/response/lecture_response.dart';
import '../../../theme/class_room_theme.dart';
import 'classroom_course_item.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as yt;

final theme = ClassRoomTheme.getAppTheme();
final textTheme = theme.textTheme;

class ClassRoomCourseListItem extends StatelessWidget {
  final String courseTitle;
  final List<LectureResponse> courseList;
  final Function()? onTapFunction;
  final Function onReturnFromLecture;

  const ClassRoomCourseListItem({
    Key? key,
    required this.courseTitle,
    required this.courseList,
    this.onTapFunction,
    required this.onReturnFromLecture,
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
              GestureDetector(
                onTap: (){
                  onTapFunction?.call();
                  },
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 4),
                        child: Text(courseTitle, style: textTheme.displayLarge),
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 4),
                          child: Icon(Icons.chevron_right, color: theme.primaryColor, size: 35),
                        ),
                        onTap: (){
                          onTapFunction?.call();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FutureBuilder<List<Widget>>(
                  future: buildCourseCards(courseList),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Row(children: snapshot.data ?? []);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<List<Widget>> buildCourseCards(
      List<LectureResponse> courseList) async {
    var ytInstance = yt.YoutubeExplode(); // YouTube 인스턴스 생성
    List<Widget> courseCards = [];
    var imageService = ImageService();

    for (var courseData in courseList) {
      try {
        var courseImage = await imageService.getImage(
            courseData.thumbnail_name);

        var courseCard = ClassRoomCourseItem(
          courseTitle: courseData.title,
          courseDescription: courseData.description,
          courseImage: courseImage,
          videoLink: courseData.video_link,
          lectureId: courseData.id,
          onReturnFromLecture: onReturnFromLecture
        );
        courseCards.add(courseCard);
      } catch (e) {
        print('Error loading image for ${courseData.title}: $e');
      }
    }

    // Make sure to close the YouTube instance outside the loop.
    ytInstance.close();

    return courseCards; // Return the courseCards outside the loop.
  }
}
