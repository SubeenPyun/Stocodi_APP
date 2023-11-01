import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../data/PredefinedChartData.dart';
import '../utils/Func.dart';
import '../data/ChartData.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color bullColor = Color(0xFFF6465D); // 상승색
    final Color bearColor = Color(0xFF4496F7); // 하락색
    final Color bullColor2 = Color(0xFFFCB5BE);
    final Color bearColor2 = Color(0xFFA1CAFB);

    return Column(
      children: [
        SfCartesianChart(
          trackballBehavior: TrackballBehavior(
            enable: true,
            activationMode: ActivationMode.singleTap,
          ),
          series: <CandleSeries>[
            CandleSeries<ChartData, DateTime>(
              dataSource: getChartData(),
              xValueMapper: (ChartData sales, _) => sales.x,
              lowValueMapper: (ChartData sales, _) => sales.low,
              highValueMapper: (ChartData sales, _) => sales.high,
              openValueMapper: (ChartData sales, _) => sales.open,
              closeValueMapper: (ChartData sales, _) => sales.close,
              bearColor: bearColor, // 하락색
              bullColor: bullColor, // 상승색
            ),
          ],
          primaryXAxis: DateTimeAxis(
            isVisible: false, // x축 숨기기
            dateFormat: DateFormat("MM"),
            majorGridLines: MajorGridLines(width: 0),
          ),
          primaryYAxis: NumericAxis(
            minimum: getMinMax(getChartData()).first - 5,
            maximum: getMinMax(getChartData())[1] + 5,
            interval: 10,
            numberFormat: NumberFormat.simpleCurrency(decimalDigits: 3),
            opposedPosition: true,
          ),
        ),
        Container(
          height: 100,
          margin: EdgeInsets.all(0), // 원하는 높이로 설정
          child: SfCartesianChart(
            series: <ColumnSeries<ChartData, DateTime>>[ // ColumnSeries를 사용하여 막대그래프 생성
              ColumnSeries<ChartData, DateTime>(
                dataSource: getChartData(),
                xValueMapper: (ChartData sales, _) => sales.x,
                yValueMapper: (ChartData sales, _) => sales.volume,
                pointColorMapper: (ChartData sales, _) {
                  if (sales.close > sales.open) {
                    return bullColor2; // 상승색
                  } else {
                    return bearColor2; // 하락색
                  }
                },
              ),
            ],
            primaryXAxis: DateTimeAxis(
              dateFormat: DateFormat("MM"),
              majorGridLines: MajorGridLines(width: 0),
              enableAutoIntervalOnZooming: true,
            ),
            primaryYAxis: NumericAxis(
              opposedPosition: true,
            ),
          ), // 위 그래프와 아래 그래프 사이 간격 제거
        ),
      ],
    );
  }
}
