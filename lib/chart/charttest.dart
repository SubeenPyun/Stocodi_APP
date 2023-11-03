import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(StockApp());
}

class StockApp extends StatelessWidget {
  const StockApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StockScreen(),
      ),
    );
  }
}

class StockScreen extends StatefulWidget {
  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  bool isFavorite = false;
  String selectedInterval = '1분';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '주식 종목',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<String>(
                items: ['1분', '5분', '1틱'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedInterval = newValue!;
                  });
                },
                value: selectedInterval,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle "일" button press
                    },
                    child: Text('일'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle "주" button press
                    },
                    child: Text('주'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle "월" button press
                    },
                    child: Text('월'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle "년" button press
                    },
                    child: Text('년'),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 200.0,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                    color: const Color(0xff37434d),
                    width: 1,
                  ),
                ),
                minX: 0,
                maxX: 7,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 3),
                      FlSpot(1, 1),
                      FlSpot(2, 4),
                      FlSpot(3, 2),
                      FlSpot(4, 5),
                      FlSpot(5, 1),
                      FlSpot(6, 4),
                      FlSpot(7, 3),
                    ],
                    isCurved: true,

                    color: Colors.blue,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle "매수하기" button press
                },
                child: Text('매수하기'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle "매도하기" button press
                },
                child: Text('매도하기'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getLineColor(int index) {
    // Here, you can implement your logic to determine line color based on data trend.
    // For example, compare current and previous data points to determine if it's an uptrend or downtrend.
    // This is a simplified random logic for demonstration purposes.

    final Random random = Random();
    bool isUpTrend = random.nextBool(); // Simulated random up and down trends

    return isUpTrend ? Colors.red : Colors.blue;
  }
}
