import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../data/titles_data.dart';

class PortfolioLineChart extends StatefulWidget {
  double touchedValue;

  PortfolioLineChart({super.key, required this.touchedValue});

  @override
  _PortfolioLineChartState createState() => _PortfolioLineChartState();
}

class _PortfolioLineChartState extends State<PortfolioLineChart> {
  LineChartBarData _buildLineChartBarData() {
    return LineChartBarData(
      spots: [
        FlSpot(0, 60), // (X, Y) 좌표 설정
        FlSpot(1, 35),
        FlSpot(2, 31),
        FlSpot(3, 35),
        FlSpot(4, 50),
        FlSpot(5, 100),
      ],
      isCurved: false, // 그래프 각지게
      color: const Color(0xff81DFBA), // 그래프 선 색상
      barWidth: 4,
      dotData: FlDotData(
        show: true, // 데이터 점 보이게
        getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
          radius: 4,
          color: Colors.white,
          strokeColor: const Color(0xff0ECB81),
          strokeWidth: 4,
        ),
      ),
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          colors: [
            const Color(0xffE3FFE7).withOpacity(1),
            const Color(0xffDCFFE0).withOpacity(1),
            const Color(0xffFFFFFF).withOpacity(0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  LineTouchData _buildLineTouchData() {
    return LineTouchData(
      getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
        return spotIndexes.map((spotIndex) {
          return TouchedSpotIndicatorData(
            FlLine(
              color: const Color(0xff81DFBA),
              strokeWidth: 0,
            ),
            FlDotData(
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 5,
                  color: Colors.white,
                  strokeWidth: 5,
                  strokeColor: const Color(0xff0ECB81),
                );
              },
            ),
          );
        }).toList();
      },
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: Colors.black,
        tooltipRoundedRadius: 20,
        getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
          return touchedBarSpots.map((barSpot) {
            final flSpot = barSpot;
            return LineTooltipItem(
              '${flSpot.y.toInt()}만원',
              TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            );
          }).toList();
        },
      ),
      touchCallback: (FlTouchEvent event, LineTouchResponse? lineTouch) {
        if (!event.isInterestedForInteractions ||
            lineTouch == null ||
            lineTouch.lineBarSpots == null) {
          setState(() {
            widget.touchedValue = -1;
          });
          return;
        }

        final value = lineTouch.lineBarSpots![0].x;

        setState(() {
          widget.touchedValue = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
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
        titlesData: TitlesData(widget.touchedValue),
        borderData: FlBorderData(
          show: false,
        ),
        minX: 0, // X 축의 최소 값 (3월)
        maxX: 5, // X 축의 최대 값 (9월)
        minY: 0, // Y 축의 최소 값 (만원 단위)
        maxY: 110, // Y 축의 최대 값 (만원 단위)
        lineBarsData: [
          _buildLineChartBarData(),
        ],
        lineTouchData: _buildLineTouchData(),
      ),
    );
  }
}
