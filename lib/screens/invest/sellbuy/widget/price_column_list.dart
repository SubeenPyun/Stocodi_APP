import 'dart:math';
import 'package:flutter/material.dart';
import 'package:stocodi_app/theme/app_theme.dart';
import '../item/price_column_item.dart';

class PriceColumnList extends StatefulWidget {
  final double currentPrice;

  const PriceColumnList({
    super.key,
    required this.currentPrice,
  });

  @override
  _PriceColumnListState createState() => _PriceColumnListState();
}

class _PriceColumnListState extends State<PriceColumnList> {
  final Random random = Random();
  final int itemCount = 21; // 원하는 아이템 개수 -> 무조건 홀수
  int sellPeople = 0;
  int buyPeople = 0;
  int selectedPriceIndex = -1; // 초기 선택된 항목 없음

  @override
  Widget build(BuildContext context) {
    ThemeData theme = AppTheme.appTheme;

    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        // currentPrice를 기준으로 price 설정
        double price = widget.currentPrice + itemCount~/2*100 - (index * 100);
        sellPeople = random.nextInt(10001); // 0부터 10,000 사이의 랜덤한 수
        buyPeople = random.nextInt(10001); // 0부터 10,000 사이의 랜덤한 수

        // 각 PriceColumnItem을 생성하여 반환
        return PriceColumnItem(
          sellPeople: price > widget.currentPrice ? sellPeople : 0,
          buyPeople: price < widget.currentPrice ? buyPeople : 0,
          price: price,
          currentPrice: widget.currentPrice,
          isSelected: selectedPriceIndex == index, // 선택된 항목 확인
          onItemSelected: (bool isSelected) {
            setState(() {
              // 항목 선택 또는 해제
              selectedPriceIndex = isSelected ? index : -1;
            });
          },
        );
      },
    );
  }
}
