import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:stocodi_app/theme/app_theme.dart';
import '../data/titles_data.dart';

final ThemeData theme = AppTheme.appTheme;

class PortfolioBarChart extends StatefulWidget {
  double touchedValue;

  PortfolioBarChart({super.key, required this.touchedValue});

  @override
  _PortfolioBarChartState createState() => _PortfolioBarChartState();
}

class _PortfolioBarChartState extends State<PortfolioBarChart> {

  BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double value,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 6,
        )
      ],
      showingTooltipIndicators: widget.touchedValue == x ? [0] : [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      child: BarChart(
        BarChartData(
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
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Color(0xffE7FBF3),
              tooltipRoundedRadius: 20,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  '${rod.toY.toInt()}만원',
                  TextStyle(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                );
              },
            ),
            touchCallback: (event, response) {
              if (event.isInterestedForInteractions &&
                  response != null &&
                  response.spot != null) {

                final value = response.spot!.touchedBarGroupIndex;

                setState(() {
                  widget.touchedValue = value.toDouble();
                });
              } else {
                setState(() {
                  widget.touchedValue = -1;
                });
              }
            },
          ),
        )
      ),
    );
  }

  List<BarChartGroupData> showingGroups() {
    return List.generate(7, (i) {
      return makeGroupData(
        i,
        i.toDouble() + 30,
      );
    });
  }

  BarChartGroupData makeGroupData(int x, double y) {
    Color barColor = widget.touchedValue == x ? theme.primaryColor : Colors.grey;
    return BarChartGroupData(
      x: x,
      barsSpace: 20,
      barRods: [
        BarChartRodData(
          toY: y,
          color: barColor,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
      ],
      showingTooltipIndicators: widget.touchedValue == x ? [0] : [],
    );
  }
}
