import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/invest/item/foreign_invest_item.dart';

class foreignWidget extends StatelessWidget {
  Widget buildForeignItem(String image, String title, int totalprice,
      double percentage, int profit, int numOfItem) {
    return ForeignInvestItem(
      image: image,
      title: title,
      totalprice: totalprice,
      percentage: percentage,
      profit: profit,
      numOfItem: numOfItem,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return buildForeignItem("apple", "애플", 237816, 3.6, 478000, 21);
            case 1:
              return buildForeignItem("teslr", "테슬라", 331672, -1.1, 478000, 6);
            case 2:
              return buildForeignItem("ecopro", "에코프로", 1021000, 1.4, 478000, 6);
            case 3:
              return buildForeignItem("posco", "포스코DX", 60700, 3.2, 478000, 6);
            case 4:
              return buildForeignItem("sm", "에스엠", 132000, 1.3, 478000, 6);
            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
