import 'package:flutter/material.dart';
import '../item/internal_invest_item.dart';

class internalWidget extends StatelessWidget {
  Widget buildInternalItem(String image, String title, int totalprice,
      double percentage, int profit, int numOfItem) {
    return InternalInvestItem(
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
              return buildInternalItem("apple", "애플", 237816, 3.6, 478000, 21);
            case 1:
              return buildInternalItem("teslr", "테슬라", 331672, -1.1, 478000, 6);
            case 2:
              return buildInternalItem("ecopro", "에코프로", 1021000, 1.4, 478000, 6);
            case 3:
              return buildInternalItem("posco", "포스코DX", 60700, 3.2, 478000, 6);
            case 4:
              return buildInternalItem("sm", "에스엠", 132000, 1.3, 478000, 6);
            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
