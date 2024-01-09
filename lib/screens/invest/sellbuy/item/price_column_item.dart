import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stocodi_app/screens/invest/sellbuy/widget/sellbuy_dialog.dart';
import 'package:stocodi_app/theme/app_theme.dart';

class PriceColumnItem extends StatefulWidget {
  final int sellPeople; // 왼쪽
  final int buyPeople; // 오른쪽
  final double price; // 가격
  final double currentPrice; // 현재 가격
  bool isSelected;
  final ValueChanged<bool> onItemSelected;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  PriceColumnItem({
    required this.sellPeople,
    required this.buyPeople,
    required this.price,
    required this.currentPrice,
    required this.isSelected,
    required this.onItemSelected,
    this.scaffoldKey,
  });

  @override
  _PriceColumnItemState createState() => _PriceColumnItemState();
}

class _PriceColumnItemState extends State<PriceColumnItem> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = AppTheme.appTheme;
    bool isExpensive = widget.price > widget.currentPrice; // 주식 가격이 현재 가격보다 큰지 확인
    double containerWidth = (MediaQuery.of(context).size.width - 40) / 3; // 화면 너비를 3등분
    final NumberFormat currencyFormat = NumberFormat.currency(locale: 'ko_KR', symbol: '');

    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
          widget.onItemSelected(widget.isSelected);
        });
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 왼쪽 컨테이너
              Container(
                height: 36,
                width: containerWidth,
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      height: 24, // 막대그래프의 높이
                      width: widget.sellPeople / 15000 * containerWidth, // sellPeople 비율에 따라 가로 크기 설정
                      color: Color(0xFFE8F2FE), // 막대그래프의 색상
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        isExpensive ? currencyFormat.format(widget.sellPeople).replaceAll(',', '') : '',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff999999),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // 가격 컨테이너
              GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: widget.scaffoldKey?.currentContext ?? context,
                    shape: RoundedRectangleBorder(
                      // 모달창 모양을 둥근 모서리로 설정
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return SellBuyDialog(price: currencyFormat.format(widget.currentPrice).replaceAll(',', ''));
                    },
                  );
                },
                child: Container(
                  height: 36,
                  width: containerWidth,
                  decoration: BoxDecoration(
                    border: widget.isSelected
                        ? Border.all(color: Colors.black, width: 1.5)
                        : Border.all(color: Color(0xffF2F5F8)),
                  ),
                  child: Center(
                    child: Text(
                      currencyFormat.format(widget.price).toString(),
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: isExpensive
                            ? Color(0xffF6465D) // 가격이 크면 빨강
                            : widget.price == widget.currentPrice
                            ? Colors.black // 가격이 같으면 검정
                            : Color(0xff4496F7), // 가격이 작으면 파랑
                      ),
                    ),
                  ),
                ),
              ),
              // 오른쪽 컨테이너
              Container(
                height: 36,
                width: containerWidth,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      height: 24, // 막대그래프의 높이
                      width: widget.buyPeople / 15000 * containerWidth, // sellPeople 비율에 따라 가로 크기 설정
                      color: Color(0xFFE8F2FE), // 막대그래프의 색상
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        isExpensive ? '' : widget.price == widget.currentPrice ? '' : currencyFormat.format(widget.buyPeople).replaceAll(',', ''),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff999999),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
