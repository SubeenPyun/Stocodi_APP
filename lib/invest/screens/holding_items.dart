import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:stocodi_app/invest/item/internal_invest_item.dart';
import 'package:stocodi_app/invest/item/foreign_invest_item.dart';
import 'package:stocodi_app/widgets/custom_appbar.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../theme/app_theme.dart';
import '../../widgets/round_square_container.dart';

final ThemeData theme = AppTheme.appTheme;

class HoldingItem extends StatefulWidget{
  const HoldingItem({Key? key}) : super(key: key);

  @override
  _HoldingState createState() => _HoldingState();
}

Container _internalWidget(BuildContext context){
  Widget buildInternalItem(String image, String title, int totalprice, double percentage, int profit, int numOfItem) {
    return InternalInvestItem(
      image: image,
      title: title,
      totalprice: totalprice,
      percentage: percentage,
      profit: profit,
      numOfItem: numOfItem,
    );
  }
  return Container(
    child: ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index){
        switch (index) {
          case 0:
            return buildInternalItem(
                "apple", "애플", 237816, 3.6, 478000, 21);
          case 1:
            return buildInternalItem(
                "teslr", "테슬라", 331672, -1.1, 478000, 6);
          case 2:
            return buildInternalItem(
                "ecopro", "에코프로", 1021000, 1.4, 478000, 6);
          case 3:
            return buildInternalItem(
                "posco", "포스코DX", 60700, 3.2, 478000, 6);
          case 4:
            return buildInternalItem(
                "sm", "에스엠", 132000, 1.3, 478000, 6);
          default:
            return SizedBox.shrink();
        }
      },
    ),
  );
}

Container _foreignWidget(BuildContext context){
  Widget buildForeignItem(String image, String title, int totalprice, double percentage, int profit, int numOfItem) {
    return ForeignInvestItem(
      image: image,
      title: title,
      totalprice: totalprice,
      percentage: percentage,
      profit: profit,
      numOfItem: numOfItem,
    );
  }
  return Container(
    child: ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index){
        switch (index) {
          case 0:
            return buildForeignItem(
                "apple", "애플", 237816, 3.6, 478000, 21);
          case 1:
            return buildForeignItem(
                "teslr", "테슬라", 331672, -1.1, 478000, 6);
          case 2:
            return buildForeignItem(
                "ecopro", "에코프로", 1021000, 1.4, 478000, 6);
          default:
            return SizedBox.shrink();
        }
      },
    ),
  );
}

PieChart _pieChart(BuildContext context){
  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  List<Color> colorList=[
    Color(0xFFF25840),
    Color(0xFFFF7F50),
    Color(0xFFFED749),
    Color(0xFF1DE180),
    Color(0xFF89EAF3),
    Color(0xFF54B6FF),
    Color(0xFFA65CF4),
    Color(0xFFE19EC7),
    Color(0xFF465A65),
  ];

  return PieChart(
    dataMap: dataMap,
    animationDuration: Duration(milliseconds: 800),
    chartLegendSpacing: 50,
    chartRadius: MediaQuery.of(context).size.width / 4,
    colorList: colorList,
    initialAngleInDegree: 0,
    chartType: ChartType.ring,
    ringStrokeWidth: 60,
    legendOptions: LegendOptions(
      showLegendsInRow: false,
      legendPosition: LegendPosition.bottom,
      showLegends: true,
      legendTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    chartValuesOptions: ChartValuesOptions(
      showChartValueBackground: true,
      showChartValues: false,
      showChartValuesInPercentage: false,
      showChartValuesOutside: false,
      decimalPlaces: 1,
    ),
    // gradientList: ---To add gradient colors---
    // emptyColorGradient: ---Empty Color gradient---
  );
}

Container _bodyWidget(BuildContext context){
  return Container(
    color: theme.backgroundColor,
    padding: EdgeInsets.all(20),
    child: Column(
      children: [
        RoundSquareContainer( // 포트폴리오
          width : MediaQuery.of(context).size.width,
          height: 400,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 40),
                child: _pieChart(context),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


class _HoldingState extends State<HoldingItem> with SingleTickerProviderStateMixin{
  late TabController tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: 0,

    /// 탭 변경 애니메이션 시간
    animationDuration: const Duration(milliseconds: 800),
  );

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(
          preferredHeight: 64,
          title: "보유종목",
          onSearchPressed: (){},
          showSearchIcon: true, // searchIcon 보이게
        ),
        body: Column(
          children: [
            _bodyWidget(context),
            Expanded(
              child: Container(
                color: theme.backgroundColor,
                padding: EdgeInsets.all(20),
                child: RoundSquareContainer(
                  width : MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height-500,
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(
                          controller: tabController,
                          labelColor: Colors.black,
                          labelStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          unselectedLabelColor: Colors.grey,
                          unselectedLabelStyle: const TextStyle(
                            fontSize: 16,
                          ),
                          tabs: const [
                            Tab(text: "국내"),
                            Tab(text: "해외"),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                _internalWidget(context), // "국내" 탭에 _internalWidget를 배치
                                // "해외" 탭의 내용을 추가
                                _foreignWidget(context),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
