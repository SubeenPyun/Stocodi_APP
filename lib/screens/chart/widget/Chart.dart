import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../data/PredefinedChartData.dart';
import '../utils/Func.dart';
import '../data/ChartData.dart';
import '../data/PredefinedChartData.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  final Color bullColor = Color(0xFFF6465D); // 상승색
  final Color bearColor = Color(0xFF4496F7); // 하락색
  final Color bullColor2 = Color(0xFFFCB5BE);
  final Color bearColor2 = Color(0xFFA1CAFB);

  late List<ChartData> chartDataList;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    chartDataList = [];
    startDataUpdate();
  }

  void startDataUpdate() {
    // 타이머를 사용하여 주기적으로 새로운 데이터 생성
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      addChartData(t.tick-1); // 새로운 데이터 추가 및 차트 업데이트
      // updateChartData();

      // 10초가 되면 타이머 중지
      if (t.tick == 20) {
        t.cancel();
      }
    });
  }

  void addChartData(int i) {
    // 새로운 데이터 생성
    final List<ChartData> newChartData = getChartData();

    // setState를 사용하여 UI 업데이트
    setState(() {
      chartDataList.add(newChartData[i]);

      // 최대 데이터 개수를 유지 (예: 최근 10개 데이터만 표시)
      if (chartDataList.length > 100) {
        chartDataList.removeAt(0);
      }
    });
  }

  void updateChartData() {
    // 새로운 데이터 생성
    final ChartData chartData = chartDataList[0];

    chartData.low = chartData.low-0.1;
    chartData.high = chartData.high-0.1;

    // setState를 사용하여 UI 업데이트
    setState(() {
      chartDataList[0] = chartData;

      // 최대 데이터 개수를 유지 (예: 최근 10개 데이터만 표시)
      if (chartDataList.length > 10) {
        chartDataList.removeAt(0);
      }
    });
  }

  @override
  void dispose() {
    timer.cancel(); // 페이지가 dispose될 때 타이머 중지
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            child: SfCartesianChart(
              trackballBehavior: TrackballBehavior(
                enable: true,
                activationMode: ActivationMode.singleTap,
                tooltipSettings: InteractiveTooltip(
                  enable: true,
                  format: 'Date: point.x \nHigh: point.high\nLow: point.low\nOpen: point.open\nClose: point.close', // 원하는 형식으로 포맷 지정
                ),
              ),
              series: <CandleSeries>[
                CandleSeries<ChartData, DateTime>(
                  // dataSource: getChartData(),
                  dataSource: chartDataList,
                  xValueMapper: (ChartData sales, _) => sales.x,
                  lowValueMapper: (ChartData sales, _) => sales.low,
                  highValueMapper: (ChartData sales, _) => sales.high,
                  openValueMapper: (ChartData sales, _) => sales.open,
                  closeValueMapper: (ChartData sales, _) => sales.close,
                  bearColor: bearColor, // 하락색
                  bullColor: bullColor, // 상승색
                  enableSolidCandles: true,
                ),
              ],
              primaryXAxis: DateTimeAxis(
                isVisible: false, // x축 숨기기
                dateFormat: DateFormat("yyyy-MM-dd"),
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
          ),
        ),
        Container(
          height: 100,
          margin: EdgeInsets.all(0), // 원하는 높이로 설정
          child: SfCartesianChart(
            series: <ColumnSeries<ChartData, DateTime>>[ // ColumnSeries를 사용하여 막대그래프 생성
              ColumnSeries<ChartData, DateTime>(
                dataSource: chartDataList,
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
              dateFormat: DateFormat("yyyy-MM-dd"),
              majorGridLines: MajorGridLines(width: 0),
              autoScrollingDelta: 15,
              autoScrollingMode: AutoScrollingMode.start,
            ),
            primaryYAxis: NumericAxis(
              opposedPosition: true,
            ),
            zoomPanBehavior: ZoomPanBehavior(
              zoomMode: ZoomMode.x,
              enablePinching: true,
              enablePanning: true,
              enableMouseWheelZooming: true
            ),
          ), // 위 그래프와 아래 그래프 사이 간격 제거
        ),
      ],
    );
  }
}
