import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'data/ChartData.dart';

void main() {
  runApp(ScreenTest());
}

class ScreenTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScreenTest',
      home: LiveChartPage(),
    );
  }
}

class LiveChartPage extends StatefulWidget {
  const LiveChartPage({Key? key}) : super(key: key);

  @override
  _LiveChartPageState createState() => _LiveChartPageState();
}

class _LiveChartPageState extends State<LiveChartPage> {
  late List<ChartData> chartDataList;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    chartDataList = [];
    startDataUpdate();
  }

  void startDataUpdate() {
    addChartData();
    // 타이머를 사용하여 주기적으로 새로운 데이터 생성
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      addChartData(); // 새로운 데이터 추가 및 차트 업데이트
      // updateChartData();

      // // 10초가 되면 타이머 중지
      // if (t.tick == 5) {
      //   t.cancel();
      // }
    });
  }

  void addChartData() {
    // 새로운 데이터 생성
    final ChartData newChartData = ChartData(
      x: DateTime.now(),
      open: 116.52,
      high: 118.0166,
      low: 115.43,
      close: 115.82,
      volume: 1000000
    );

    // setState를 사용하여 UI 업데이트
    setState(() {
      chartDataList.add(newChartData);

      // 최대 데이터 개수를 유지 (예: 최근 10개 데이터만 표시)
      if (chartDataList.length > 10) {
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

  // 주어진 범위 내에서 랜덤한 숫자 생성
  double generateRandomNumber(double min, double max) {
    final Random random = Random();
    return min + random.nextDouble() * (max - min);
  }

  @override
  void dispose() {
    timer.cancel(); // 페이지가 dispose될 때 타이머 중지
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Chart'),
      ),
      body: Center(
        child: SfCartesianChart(
          series: <CandleSeries>[
            CandleSeries<ChartData, DateTime>(
              dataSource: chartDataList,
              xValueMapper: (ChartData sales, _) => sales.x,
              lowValueMapper: (ChartData sales, _) => sales.low,
              highValueMapper: (ChartData sales, _) => sales.high,
              openValueMapper: (ChartData sales, _) => sales.open,
              closeValueMapper: (ChartData sales, _) => sales.close,
            ),
          ],
          primaryXAxis: DateTimeAxis(
            isVisible: true,
            majorGridLines: MajorGridLines(width: 0),
            autoScrollingDelta: 15,
            autoScrollingMode: AutoScrollingMode.start,
          ),
          primaryYAxis: NumericAxis(
            opposedPosition: true,
          ),
          zoomPanBehavior: ZoomPanBehavior(
            enablePanning: true,
            enablePinching: true,
            enableDoubleTapZooming: true,
          ),
        ),
      ),
    );
  }
}
