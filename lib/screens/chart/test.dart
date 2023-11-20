import 'package:flutter/material.dart';

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
  bool isFavorite = false; // Track the favorite state

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
                  color: isFavorite ? Colors.red : null, // Set color when filled
                ),
                onPressed: () {
                  // Toggle the favorite state
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              ),
            ],
          ),
          // 차트 선택 옵션
          DropdownButton<String>(
            items: ['일', '주', '월', '년'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // 선택한 차트 옵션에 따라 동작 추가
            },
            value: '일', // 초기 선택값 설정
          ),
          // 차트 그리기 - 이 부분에 실제 차트 라이브러리를 사용해 차트를 표시해야 합니다.
          Container(
            height: 200.0, // 차트의 높이 조절
            // 차트 그리는 로직 추가
          ),
          // 매수하기, 매도하기 버튼
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  // 매수하기 버튼을 눌렀을 때의 동작 추가
                },
                child: Text('매수하기'),
              ),
              ElevatedButton(
                onPressed: () {
                  // 매도하기 버튼을 눌렀을 때의 동작 추가
                },
                child: Text('매도하기'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
