import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class pieChart extends StatelessWidget {
  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  List<Color> colorList = [
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 40,),
          PieChart(
            dataMap: dataMap,
            animationDuration: Duration(milliseconds: 800),
            chartRadius: MediaQuery.of(context).size.width / 4,
            colorList: colorList,
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 60,
            legendOptions: LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.bottom,
              showLegends: false,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: false,
              showChartValues: false,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
              decimalPlaces: 1,
            ),
            // gradientList: ---To add gradient colors---
            // emptyColorGradient: ---Empty Color gradient---
          ),
          SizedBox(height: 40,),
        ],
      ),
    );
  }
}
