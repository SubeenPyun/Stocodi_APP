import 'package:flutter/material.dart';

class InterestBox extends StatefulWidget {
  final String imgName;
  final String text;
  final double length; //한 상자의 길이
  final double howmuch; //그림과 텍스트 사이 공간
  final bool isSelected; // 새로운 프로퍼티: 선택 여부
  final VoidCallback onTap; // 새로운 프로퍼티: 탭 이벤트

  const InterestBox({
    required this.imgName,
    required this.text,
    required this.length,
    required this.howmuch,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<InterestBox> createState() => _InterestBoxState();
}

class _InterestBoxState extends State<InterestBox> {
  @override
  Widget build(BuildContext context) {
    Color borderColor =
        widget.isSelected ? const Color(0xFF0ECB81) : const Color(0xFFDBDBDB);
    Color txtColor =
        widget.isSelected ? const Color(0xFF0ECB81) : const Color(0xFF111111);
    String imgColor = widget.isSelected ? 'green_' : 'gray_';
    FontWeight fontw = widget.isSelected ? FontWeight.w500 : FontWeight.w400;

    return GestureDetector(
      onTap: widget.onTap, // 새로운 onTap 콜백 사용
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
