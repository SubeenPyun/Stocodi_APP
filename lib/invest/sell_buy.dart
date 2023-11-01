import 'package:flutter/material.dart';
import 'package:stocodi_app/invest/sellbuy/widget/sell_buy_buttons.dart';
import 'package:stocodi_app/invest/sellbuy/widget/stock_custom_appbar.dart';
import 'package:stocodi_app/invest/sellbuy/widget/stock_info.dart';
import 'package:stocodi_app/invest/sellbuy/widget/stock_tab_bar.dart';
import 'package:stocodi_app/widgets/custom_appbar.dart';

class SellBuy extends StatefulWidget{
  final StockInfo stockInfo;

  const SellBuy({
    Key? key,
    required this.stockInfo,
  }) : super(key: key);

  @override
  _SellBuyState createState() => _SellBuyState();
}

class _SellBuyState extends State<SellBuy> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StockCustomAppBar(
        title: widget.stockInfo.title,
        preferredHeight: 64,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            StockInfo(
              title: widget.stockInfo.title,
              price: widget.stockInfo.price,
              changeValue: widget.stockInfo.changeValue,
              changePercentage: widget.stockInfo.changePercentage,
            ),
            StockTabBar(currentPrice: widget.stockInfo.price,),
            SellBuyButtons(),
          ],
        ),
      ),
    );
  }
}
