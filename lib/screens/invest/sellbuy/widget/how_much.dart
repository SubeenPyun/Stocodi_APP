import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HowMuch extends StatefulWidget {
  final String price;

  // 생성자
  HowMuch({required this.price});

  @override
  _HowMuchState createState() => _HowMuchState();
}

class _HowMuchState extends State<HowMuch> {
  int num = 0;

  @override
  void initState() {
    super.initState();
    num = int.parse(widget.price.replaceAll(',', ''));
  }

  // 숫자 바꾸는 것 때문에 버튼 위젯 따로 안만들었습니당
  // PlusButton
  Container plusButton() {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xFF0ECB81),
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            num = num + 100;
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
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xFFEDFFEF),
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (num >= 100) {
              num = num - 100;
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
    final NumberFormat currencyFormat = NumberFormat('#,###');

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Text(
            "가격",
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
                      currencyFormat.format(num),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "원",
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
      ),
    );
  }
}
