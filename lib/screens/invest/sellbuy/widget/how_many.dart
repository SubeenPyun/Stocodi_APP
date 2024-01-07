import 'package:flutter/material.dart';

class HowMany extends StatefulWidget {
  @override
  _HowManyState createState() => _HowManyState();
}

class _HowManyState extends State<HowMany> {
  int num = 0;

  // 숫자 바꾸는 것 때문에 버튼 위젯 따로 안만들었습니당
  // PlusButton
  Container plusButton() {
    return Container(
      margin: EdgeInsets.only(left: 30),
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xFF0ECB81),
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            num++;
          });
        },
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // MinusButton
  Container minusButton() {
    return Container(
      margin: EdgeInsets.only(right: 30),
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xFFEDFFEF),
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (num > 0) {
              num--;
            }
          });
        },
        child: Center(
          child: Icon(
            Icons.remove,
            color: Color(0xFF0ECB81),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "수량",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        Container(
          width: 180,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              minusButton(),
              Row(
                children: [
                  Text(
                    num.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "주",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              plusButton(),
            ],
          ),
        ),
      ],
    );
  }
}
