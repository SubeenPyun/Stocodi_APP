import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/lecture/Item/total_course_list_item.dart';
import 'package:stocodi_app/screens/lecture/data/predefined_classroom_data.dart';
import '../../../../theme/app_theme.dart';
import 'package:stocodi_app/screens/lecture/widget/realtime_popularity.dart';
import 'package:stocodi_app/screens/lecture/widget/search_recent.dart';
import 'package:stocodi_app/screens/lecture/widget/search_window.dart';
import 'package:stocodi_app/screens/lecture/search_lecture.dart';
import 'package:stocodi_app/screens/lecture/widget/lecture_next_video.dart';
import '../../api/lecture/lecture_manager.dart';
import '../../model/lecture/response/lecture_response.dart';
import '../../theme/classroom_top_theme.dart';
import 'Item/search_course_list_item.dart';
import 'Item/classroom_course_item.dart';


final ThemeData theme = AppTheme.appTheme;
final textTheme = theme.textTheme;

class TotalLecture extends StatefulWidget {
  @override
  _TotalLectureState createState() => _TotalLectureState();
}

class _TotalLectureState extends State<TotalLecture> {
  late List<LectureResponse> courseList= [];

  @override
  void initState() {
    super.initState();
    setCourseList();
  }

  Future<void> setCourseList() async {
    try {
      final lectureManager = LectureManager();
      final fetchedCourseList = await lectureManager.getLectureList();

      setState(() {
        courseList = fetchedCourseList ?? []; // Use fetchedCourseList or an empty list if null
      });
    } catch (e) {
      print('Error fetching course list: $e');
      // Handle error, show a snackbar, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text('강의 전체 보기', style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        )),
        elevation: 0, // 그림자 제거
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xff191919)),
            onPressed: () {
              // Functionality
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchLecture(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Color(0xff191919)),
            onPressed: () {
              // Functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              ClassRoomTotalListItem(courseList: courseList),
            ],
          ),
        ),
      ),
    );
  }
}
