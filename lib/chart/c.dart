import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import 'dart:math' as math;

void main() {
  runApp(MyAppc());
}

class MyAppc extends StatelessWidget {
  const MyAppc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Chart Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<ChartSampleData> chartData;
  late TrackballBehavior _trackballBehavior;
  late Timer _timer;

  @override
  void initState() {
    chartData = getInitialChartData();
    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
    );
    // 1초마다 updateDataSource 함수 호출
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      updateDataSource();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Real-time Stock Chart'),
        ),
        body: SfCartesianChart(
          title: ChartTitle(text: 'AAPL - 2016'),
          legend: Legend(isVisible: true),
          trackballBehavior: _trackballBehavior,
          series: <CandleSeries>[
            CandleSeries<ChartSampleData, DateTime>(
              dataSource: chartData,
              name: 'AAPL',
              xValueMapper: (ChartSampleData sales, _) => sales.x,
              lowValueMapper: (ChartSampleData sales, _) => sales.low,
              highValueMapper: (ChartSampleData sales, _) => sales.high,
              openValueMapper: (ChartSampleData sales, _) => sales.open,
              closeValueMapper: (ChartSampleData sales, _) => sales.close,
            )
          ],
          primaryXAxis: DateTimeAxis(
            dateFormat: DateFormat.MMM(),
            majorGridLines: MajorGridLines(width: 0),
          ),
          primaryYAxis: NumericAxis(
            minimum: 70,
            maximum: 130,
            interval: 10,
            numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
          ),
        ),
      ),
    );
  }

  void updateDataSource() {
    final random = math.Random();
    final low = 50 + random.nextInt(30);
    final high = low + random.nextInt(20);
    final open = (low + high) / 2;
    final close = (low + high) / 2;

    // 새로운 데이터 생성
    final newData = ChartSampleData(
      x: DateTime.now(),
      low: low.toDouble(),
      high: high.toDouble(),
      open: open.toDouble(),
      close: close.toDouble(),
    );

    // 차트 데이터 업데이트
    chartData.add(newData);

    if (chartData.length > 20) {
      chartData.removeAt(0);
    }

    // Force rebuild of the chart widget
    setState(() {});
  }

  List<ChartSampleData> getInitialChartData() {
    final initialData = <ChartSampleData>[];
    for (var i = 0; i < 20; i++) {
      final random = math.Random();
      final low = 50 + random.nextInt(30);
      final high = low + random.nextInt(20);
      final open = (low + high) / 2;
      final close = (low + high) / 2;
      initialData.add(ChartSampleData(
        x: DateTime.now().subtract(Duration(minutes: 20 - i)),
        low: low.toDouble(),
        high: high.toDouble(),
        open: open.toDouble(),
        close: close.toDouble(),
      ));
    }
    return initialData;
  }

  @override
  void dispose() {
    _timer.cancel(); // 타이머 종료
    super.dispose();
  }
}

class ChartSampleData {
  ChartSampleData({
    required this.x,
    required this.low,
    required this.high,
    required this.open,
    required this.close,
  });

  final DateTime x;
  final double low;
  final double high;
  final double open;
  final double close;
}
