import 'package:flutter/material.dart';

class GraySimilarEdit extends StatelessWidget {
  final double frontboxsize;
  final String imgName;
  final String text;
  final double betweenboxsize;
  final String imgColor;
  final Color boxColor;
  final Color textColor;

  const GraySimilarEdit({
    super.key,
    required this.frontboxsize,
    required this.imgName,
    required this.text,
    required this.betweenboxsize,
    required this.imgColor,
    required this.boxColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(
          color: boxColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: frontboxsize,
          ),
          Image.asset(
            'assets/images/${imgColor}_$imgName.png',
            width: 24,
            height: 24,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: betweenboxsize,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Pretendard Variable',
              ),
            ),
          )
        ],
      ),
    );
  }
}
