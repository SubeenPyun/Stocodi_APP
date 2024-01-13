import 'package:flutter/material.dart';
import 'package:stocodi_app/api/lecture/lecture_manager.dart';
import 'package:stocodi_app/model/lecture/response/lecture_response.dart';
import 'package:stocodi_app/screens/lecture/Item/classroom_couse_list_item.dart';

class SearchWindow extends StatefulWidget {
  @override
  _SearchWindowState createState() => _SearchWindowState();
}

class _SearchWindowState extends State<SearchWindow> {
  final TextEditingController _textEditingController = TextEditingController();

  late List<LectureResponse> searchCourseList = []; // Initialize courseList as an empty list

  @override
  void initState() {
    super.initState();
    setSearchList(); // Call setCourseList when the widget is initialized
  }

  Future<void> setSearchList() async {
    try {
      final lectureManager = LectureManager();
      final searchedCourse = await lectureManager.getSearchList("1탄");

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

    print('강의 검색!!!!!: $searchCourseList');
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.only(left: 30, top: 50, bottom: 25, right: 25),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: TextField(
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
                  // 강의검색 기능 추가
                  // onTap: () =>
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
