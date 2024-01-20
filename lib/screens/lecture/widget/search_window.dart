import 'package:flutter/material.dart';
import 'package:stocodi_app/api/lecture/lecture_manager.dart';
import 'package:stocodi_app/model/lecture/response/lecture_response.dart';
import 'package:stocodi_app/screens/lecture/Item/search_course_list_item.dart';
import '../../../analytics_helper.dart';

class SearchWindow extends StatefulWidget {
  final Function onReturnFromLecture;

  const SearchWindow({
    Key? key,
    required this.onReturnFromLecture,
  }) : super(key: key);

  @override
  _SearchWindowState createState() => _SearchWindowState();
}

class _SearchWindowState extends State<SearchWindow> {
  final TextEditingController _textEditingController = TextEditingController();
  late List<LectureResponse> searchCourseList = []; // Initialize courseList as an empty list

  @override
  void initState() {
    super.initState();
    searchCourseList = []; // Call setCourseList when the widget is initialized
  }

  Future<void> setSearchList(String key) async {
    AnalyticsHelper.gaEvent("search_lectures", {"input_words " : key});
    try {
      final lectureManager = LectureManager();
      final searchedCourse = await lectureManager.getSearchList(key);

      if (searchedCourse != null) {
        setState(() {
          searchCourseList = searchedCourse;
        });
      } else {
        // 검색 결과가 null인 경우
        setState(() {
          searchCourseList = [];
        });
      }
    } catch (e) {
      print('강의 검색 오류2: $e');
      // 오류 처리, 스낵바 표시 등을 수행하세요.
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.only(left: 30, top: 50, bottom: 25, right: 25),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                    onTap: (){
                    Navigator.pop(context);
                    },
                ),
              ),
              Expanded(
                child: TextField(
                  //강의 검색
                  onSubmitted: (String value) {
                    // 엔터를 눌렀을 때 실행되는 코드
                    setSearchList(value);
                  },
                  cursorColor: Color(0xFF0ECB81),
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: '검색어를 입력하세요',
                    hintStyle: TextStyle(
                      color: Color(0xffBEBEBE),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0ECB81), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0ECB81), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    suffixIcon: GestureDetector(
                      child: const Icon(
                        Icons.search_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ClassRoomSearchListItem(courseList: searchCourseList,
            onReturnFromLecture:widget.onReturnFromLecture,
          ),
        ],
      ),
    );
  }
}
