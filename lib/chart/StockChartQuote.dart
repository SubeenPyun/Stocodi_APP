import 'package:flutter/material.dart';
import 'package:stocodi_app/chart/widget/ChartDetail.dart';
import 'package:stocodi_app/chart/widget/ChartNameColumn.dart';
import 'package:stocodi_app/chart/widget/PriceContainer.dart';

void main() {
  runApp(StockChartQuote());
}

class StockChartQuote extends StatelessWidget {
  const StockChartQuote({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StockChartScreen(),
    );
  }
}

class StockChartScreen extends StatefulWidget {
  const StockChartScreen({super.key});

  @override
  _StockChartScreenState createState() => _StockChartScreenState();
}

class _StockChartScreenState extends State<StockChartScreen> {
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ChartNameColumn(),
          PriceContainer(price: '70,200원', variant: '-100원 (-0.1%)'),
          DefaultTabController(
            length: 2,
            initialIndex: selectedTabIndex,
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.black, // 선택된 탭의 글씨 색
                  unselectedLabelColor: Colors.grey, // 선택되지 않은 탭의 글씨 색
                  indicatorColor: Colors.black, // 선택된 탭의 밑줄 색
                  tabs: [
                    Tab(text: '차트'),
                    Tab(text: '호가'),
                  ],
                  onTap: (index) {
                    setState(() {
                      selectedTabIndex = index;
                    });
                  },
                ),
                if (selectedTabIndex == 0)
                  ChartDetail()
                else
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text('Order Book Here'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



