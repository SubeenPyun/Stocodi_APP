import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/invest/sellbuy/widget/how_much.dart';
import 'package:stocodi_app/screens/invest/sellbuy/widget/sell_buy_buttons.dart';
import 'package:stocodi_app/screens/invest/sellbuy/widget/how_many.dart';


class SellBuyDialog extends StatelessWidget {
  final String price;

  SellBuyDialog({
    Key? key,
    required this.price
  }) : super(key: key);

  Container percentBox(String text, double screenWidth){
    return Container(
      alignment: Alignment.center,
      height: 36,
      width: (screenWidth-70)/4,
      decoration: BoxDecoration(
        color: Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 250,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        )
      ),
      child: Column(
        children: [
          HowMany(),
          SizedBox(height: 10,),
          HowMuch(price: price),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              percentBox("10%", screenWidth),
              percentBox("25%", screenWidth),
              percentBox("50%", screenWidth),
              percentBox("100%", screenWidth),
            ],
          ),
          Spacer(),
          SellBuyButtons(),
        ],
      ),
    );
  }
}
