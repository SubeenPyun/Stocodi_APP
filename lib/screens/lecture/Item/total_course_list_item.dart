import 'package:flutter/material.dart';
import '../../../api/image/image_service.dart';
import '../../../model/lecture/response/lecture_response.dart';
import '../../../theme/class_room_theme.dart';
import 'total_course_item.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as yt;

final theme = ClassRoomTheme.getAppTheme();
final textTheme = theme.textTheme;

class ClassRoomTotalListItem extends StatelessWidget {
  final List<LectureResponse> courseList;
  final Function onReturnFromLecture;

  const ClassRoomTotalListItem({
    Key? key,
    required this.courseList,
    required this.onReturnFromLecture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: theme.colorScheme.background,
      width: screenWidth,
      padding: EdgeInsets.only(top: 25),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: FutureBuilder<List<Widget>>(
                  future: buildCourseCards(courseList),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Column(children: snapshot.data ?? []);
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

        var courseCard = ClassRoomTotalItem(
          courseTitle: courseData.title,
          courseDescription: courseData.description,
          courseAuthor: courseData.author,
          courseViews: courseData.views,
          courseImage: Image(image:courseImage),
          videoLink: courseData.video_link,
          lectureId: courseData.id,
          onReturnFromLecture: onReturnFromLecture,
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