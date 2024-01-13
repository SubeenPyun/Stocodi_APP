import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/lecture/search_lecture.dart';
import 'package:stocodi_app/screens/lecture/widget/classroom_top.dart';
import '../../API/retrofit/auth_manager.dart';
import '../../api/lecture/lecture_manager.dart';
import '../../model/lecture/response/lecture_response.dart';
import '../../theme/classroom_top_theme.dart';
import 'Item/classroom_couse_list_item.dart';

final theme = ClassRoomTopTheme.getAppTheme();
final textTheme = theme.textTheme;

class ClassRoom extends StatefulWidget {
  const ClassRoom({Key? key}) : super(key: key);

  @override
  _ClassRoomState createState() => _ClassRoomState();
}

class _ClassRoomState extends State<ClassRoom> {
  late List<LectureResponse> popularCourseList =
      []; // Initialize courseList as an empty list
  late List<LectureResponse> watchingList = [];
  late List<LectureResponse> courseList = [];

  @override
  void initState() {
    super.initState();
    setCourseList(); // Call setCourseList when the widget is initialized
  }

  Future<void> setCourseList() async {
    try {
      final lectureManager = LectureManager();
      final fetchedCourseList = await lectureManager.getLectureList();
      final fetchedWatchingLectureList =
          await lectureManager.getWatchingLectureList();

      setState(() {
        courseList = fetchedCourseList ??
            []; // Use fetchedCourseList or an empty list if null
        watchingList = fetchedWatchingLectureList ?? [];
      });
    } catch (e) {
      print('Error fetching course list: $e');
      // Handle error, show a snackbar, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        title: Text('강의실', style: textTheme.displayLarge),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xff191919)),
            onPressed: () {
              // Functionality
              Navigator.push(
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
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.37,
              width: MediaQuery.of(context).size.width,
              child: ClassRoomTop(),
            ),
            ClassRoomCourseListItem(
                courseTitle: '수강 중인 강의', courseList: watchingList),
            ClassRoomCourseListItem(
                courseTitle: '실시간 인기강의', courseList: popularCourseList),
            ClassRoomCourseListItem(
                courseTitle: '강의 전체 보기', courseList: courseList),
          ],
        ),
      ),
    );
  }
}
