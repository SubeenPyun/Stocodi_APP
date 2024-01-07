import 'package:flutter/material.dart';

class SearchWindow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final TextEditingController _textEditingController = TextEditingController();

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

                suffixIcon:  GestureDetector(
                  child: const Icon(
                    Icons.search_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
                  //강의검색 기능 추가
                  //onTap: () =>
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}