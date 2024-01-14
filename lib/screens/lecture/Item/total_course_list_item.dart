import 'package:flutter/material.dart';
import '../../../model/lecture/response/lecture_response.dart';
import '../../../theme/class_room_theme.dart';
import 'total_course_item.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as yt;

final theme = ClassRoomTheme.getAppTheme();
final textTheme = theme.textTheme;

class ClassRoomTotalListItem extends StatelessWidget {
  final List<LectureResponse> courseList;

  const ClassRoomTotalListItem({
    Key? key,
    required this.courseList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: theme.backgroundColor,
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

  Future<List<Widget>> buildCourseCards(List<LectureResponse> courseList) async {
    var ytInstance = yt.YoutubeExplode(); // YouTube 인스턴스 생성
    List<Widget> courseCards = [];

    for (var courseData in courseList) {
      var video = await ytInstance.videos.get(courseData.video_link);
      var courseImage = video.thumbnails.highResUrl;

      var courseCard = ClassRoomTotalItem(
        courseTitle: courseData.title,
        courseDescription: courseData.description,
        courseAuthor: courseData.author,
        courseViews: courseData.views,
        courseImage: courseImage,
        videoLink: courseData.video_link,
        lectureId: courseData.id,
      );
      courseCards.add(courseCard);
    }

    ytInstance.close(); // 사용이 끝난 후 인스턴스를 닫아주는 것이 좋아요.
    return courseCards;
  }
}
