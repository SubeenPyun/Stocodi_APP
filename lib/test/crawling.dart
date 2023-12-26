import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

void main() {
  runApp(DongGi());
}

class DongGi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '삼성전자 주가',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StockPricePage(),
    );
  }
}

class StockPricePage extends StatefulWidget {
  @override
  _StockPricePageState createState() => _StockPricePageState();
}

class _StockPricePageState extends State<StockPricePage> {
  String currentStockPrice = 'Fetching...'; // 현재 주가 정보를 저장할 변수
  String beforeVS = 'Fetching...'; // 전일 대비 가격 정보를 저장할 변수

  @override
  void initState() {
    super.initState();
    fetchAndSetStockPrice(); // 앱이 실행될 때 주asdkjvlksdhvkl;sdvklsdvsdv가 정보를 가져오는 함수 호출
  }

  void fetchAndSetStockPrice() async {
    var response = await http.get(Uri.parse('https://finance.naver.com/item/main.nhn?code=005930'));
    if (response.statusCode == 200) {
      var document = parser.parse(response.body);
      // 현재 주가 정보 가져오기
      var priceElement = document.querySelector('.no_today');
      if (priceElement != null) {
        setState(() {
          currentStockPrice = priceElement.text.trim(); // 주가 정보를 가져와 변수에 저장
        });
      }
      // 전일 대비 정보 가져오기
      var beforePriceElement = document.querySelector('.no_exday');
      if (beforePriceElement != null) {
        setState(() {
          beforeVS = beforePriceElement.text.trim(); // 전일 대비 정보를 가져와 변수에 저장
        });
      }
    } else {
      setState(() {
        currentStockPrice = 'Failed to load data: ${response.statusCode}'; // 오류 메시지 표시
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('삼성전자 주가'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '현재 삼성전자 주가: $currentStockPrice',
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              '전일 대비: $beforeVS',
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
