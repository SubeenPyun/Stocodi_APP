import 'package:flutter/material.dart';

class InterestBox extends StatefulWidget {
  final String imgName;
  final String text;
  final double length; //한 상자의 길이
  final double howmuch; //그림과 텍스트 사이 공간
  const InterestBox({
    required this.imgName,
    required this.text,
    required this.length,
    required this.howmuch,
    super.key,
  });

  @override
  State<InterestBox> createState() => _InterestBoxState();
}

class _InterestBoxState extends State<InterestBox> {
  bool isClicked = false;

  void btnClick() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor =
        isClicked ? const Color(0xFF0ECB81) : const Color(0xFFDBDBDB);
    Color txtColor =
        isClicked ? const Color(0xFF0ECB81) : const Color(0xFF111111);
    String imgColor = isClicked ? 'green_' : 'gray_';
    FontWeight fontw = isClicked ? FontWeight.w500 : FontWeight.w400;

    return GestureDetector(
      onTap: btnClick,
      child: Container(
        height: widget.length,
        width: widget.length,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/$imgColor${widget.imgName}.png',
              width: widget.length / 3,
              height: widget.length / 3,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: widget.howmuch,
            ),
            Text(
              widget.text,
              style: TextStyle(
                color: txtColor,
                fontSize: 12,
                fontWeight: fontw,
                fontFamily: 'Pretendard Variable',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
