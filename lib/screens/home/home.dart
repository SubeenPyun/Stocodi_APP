import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stocodi_app/screens/home/widget/home_header.dart';
import 'package:stocodi_app/screens/home/widget/home_profit.dart';
import 'package:stocodi_app/model/portfolio/portfolio_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PortfolioData>(builder: (context, portfolioData, _) {
      return WillPopScope(
        onWillPop: () async {
          if (ModalRoute.of(context)!.isCurrent) {
            Navigator.of(context).popUntil((route) => route.isFirst);
            return true;
          }
          return false;
        },
        child: Scaffold(
          body: SingleChildScrollView(
            // SingleChildScrollView 추가
            child: Column(
              children: [
                HomeHeader(),
                HomeProfit(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
