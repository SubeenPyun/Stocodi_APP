import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../theme/app_theme.dart';

class TransactionLogDetailItem extends StatelessWidget {
  ThemeData theme = AppTheme.appTheme;

  final String image;
  final String title;
  final int share; // 주
  final int price;
  final VoidCallback onPressed;

  TransactionLogDetailItem({
    required this.image,
    required this.title,
    required this.share,
    required this.price,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var format = NumberFormat('###,###,###,###');

    return Container(
      margin: EdgeInsets.only(bottom: 30,),
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 8,
            height: 60,
            decoration: BoxDecoration(
              color: price > 0 ? Color(0xffFCB5BE) : Color(0xffA1CAFB),
              borderRadius: BorderRadius.circular(100), // 둥근 모서리
            ),
          ),
          SizedBox(width: 28,),
          CircleAvatar(
            backgroundImage: Image.asset('assets/images/${image}.png', fit: BoxFit.fill,).image,
            radius: 20, // 동그란 이미지 크기 설정
          ),
          SizedBox(width: 14),
          Text(
            title,
            style: theme.textTheme.titleSmall,
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price > 0 ? "${share}주 매수" : "${share}주 매도",
                style: TextStyle(
                  height: 1,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                (price > 0 ? "+" : "")+"${format.format(price)}원",
                style: TextStyle(
                  height: 1,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: price > 0 ? Color(0xffF6465D) : Color(0xff4496F7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
