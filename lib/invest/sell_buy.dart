import 'package:flutter/material.dart';

class SellBuy extends StatefulWidget{
  const SellBuy({Key? key}) : super(key: key);

  @override
  _SellBuyState createState() => _SellBuyState();
}

class _SellBuyState extends State<SellBuy> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('거래일지'),
      ),
    );
  }
}
