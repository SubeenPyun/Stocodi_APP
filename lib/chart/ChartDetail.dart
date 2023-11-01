import 'package:flutter/material.dart';
import 'package:stocodi_app/chart/widget/Chart.dart';
import 'package:stocodi_app/chart/widget/ChartNameColumn.dart';
import 'package:stocodi_app/chart/widget/PriceContainer.dart';

import 'Item/ElevatedButton.dart';

void main() {
  runApp(ChartDetail());
}

class ChartDetail extends StatelessWidget {
  const ChartDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StockChartScreen(),
    );
  }
}

class StockChartScreen extends StatefulWidget {
  @override
  _StockChartScreenState createState() => _StockChartScreenState();
}

class _StockChartScreenState extends State<StockChartScreen> {
  int selectedTabIndex = 0;
  String selectedOption = '일'; // 선택된 옵션을 저장할 변수

  void handleOptionChange(String option) {
    setState(() {
      selectedOption = option;
    });
  }

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
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DropdownButton<String>(
                            items: ['1분', '5분', '1틱'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              // 선택한 차트 옵션에 따라 동작 추가
                            },
                            value: '1분', // 초기 선택값 설정
                          ),
                          buildOptionButton('일', () {
                            // '일' 옵션에 따른 작업 추가
                            handleOptionChange('일');
                          }, selectedOption == '일'), // 선택 여부에 따라 isSelected 설정
                          buildOptionButton('주', () {
                            // '주' 옵션에 따른 작업 추가
                            handleOptionChange('주');
                          }, selectedOption == '주'),
                          buildOptionButton('월', () {
                            // '월' 옵션에 따른 작업 추가
                            handleOptionChange('월');
                          }, selectedOption == '월'),
                          buildOptionButton('년', () {
                            // '년' 옵션에 따른 작업 추가
                            handleOptionChange('년');
                          }, selectedOption == '년'),
                        ],
                      ),
                      Chart(),
                    ],
                  )
                else
                // Order Book Widgets
                // Replace with your order book widgets here
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
