
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:stocodi_app/invest/portfolio/data/titles_data.dart';

class PortfolioBarChart extends StatefulWidget {
  double touchedValue;

  PortfolioBarChart({super.key, required this.touchedValue});

  @override
  _PortfolioBarChartState createState() => _PortfolioBarChartState();
}

class _PortfolioBarChartState extends State<PortfolioBarChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.black,
            tooltipRoundedRadius: 20,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '${rod.toY.toInt()}만원',
                TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              );
            },
          ),
          touchCallback: (FlTouchEvent event, BarTouchResponse? barTouchResponse) {
            setState(() {
              if (!event.isInterestedForInteractions ||
                  barTouchResponse == null ||
                  barTouchResponse.spot == null) {
                setState(() {
                  widget.touchedValue = -1;
                });
                return;
              }

              //touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
              setState(() {
                  widget.touchedValue = barTouchResponse.spot?.touchedBarGroupIndex as double;
              });
            });
          },
          handleBuiltInTouches: true,
        ),
        titlesData: TitlesData(widget.touchedValue),
        borderData: FlBorderData(
          show: false,
        ),
        barGroups: showingGroups(),
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: false,
          drawVerticalLine: true,
          checkToShowVerticalLine: (value) => value % 1 == 0,
          getDrawingVerticalLine: (value) {
            return const FlLine(
              color: Color(0xffF3F7F9),
              strokeWidth: 0.5,
            );
          },
        ),
      )
    );
  }

  List<BarChartGroupData> showingGroups() {
    return List.generate(7, (i) {
      return makeGroupData(
        i,
        i.toDouble() + 30,
        touched: i == widget.touchedValue,
      );
    });
  }

  BarChartGroupData makeGroupData(int x, double y, {bool touched = false}) {
    Color barColor = touched ? Colors.green : Colors.grey;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: barColor,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
      ],
    );
  }
}
