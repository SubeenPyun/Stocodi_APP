import 'package:flutter/material.dart';

class SearchRecent extends StatelessWidget {

  List<String> TitleList=[
    "검색어1",
    "검색어2",
    "검색어20",
    "검색어12445",
    "검색어1205",
    "검색어88",
  ];

  Container textContainer(String text){
    return Container(
      alignment: Alignment.center,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xffF2F3F4),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xff575E6B),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.only(bottom: 40, right: 25, left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "최근 검색",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 2/1,
            ),
            itemCount: TitleList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return textContainer(TitleList[index]);
            },
          ),
        ],
      ),
    );
  }
}