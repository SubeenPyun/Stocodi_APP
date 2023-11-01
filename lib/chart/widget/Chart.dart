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
    return SfCartesianChart(
      trackballBehavior: TrackballBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap,
      ),
      series: <CandleSeries>[
        CandleSeries<ChartData, DateTime>(
          dataSource: getChartData(),
          name: 'AAPL',
          xValueMapper: (ChartData sales, _) => sales.x,
          lowValueMapper: (ChartData sales, _) => sales.low,
          highValueMapper: (ChartData sales, _) => sales.high,
          openValueMapper: (ChartData sales, _) => sales.open,
          closeValueMapper: (ChartData sales, _) => sales.close,
          bearColor: Color(0xFFF6465D),
          bullColor: Color(0xFF4496F7),
        ),
      ],
      primaryXAxis: DateTimeAxis(
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
    );
  }
}
