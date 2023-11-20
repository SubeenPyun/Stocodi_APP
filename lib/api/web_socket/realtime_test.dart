import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stocodi_app/web_socket/stock_manager.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../model/stockDTO/request/change_stock.dart';
import '../model/stockDTO/socket_connect.dart';
import '../retrofit/HttpDTO/Login.dart';
import '../retrofit/HttpDTO/Register.dart';
import '../retrofit/HttpService.dart';

void main() => runApp(RealtimeTest());

class RealtimeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebSocket Example',
      home: RealtimeTestPage(),
    );
  }
}

class RealtimeTestPage extends StatefulWidget {
  @override
  _RealtimeTestPageState createState() => _RealtimeTestPageState();
}

class _RealtimeTestPageState extends State<RealtimeTestPage> {
  final WebSocketChannel channel =
      IOWebSocketChannel.connect( // IO 없어도 됨
          Uri.parse('ws://10.0.2.2:53001/api/ws/stock'),
      );

  Future<void> _checkAPI() async {
    final changeStockData = ChangeStock(
      // "애플"
      "만호제강"
      // "DSR제강"
      // "삼성전자"
    );

    final signUpData = Register(
      "test@naver.com",
      "1234",
      "편수빈",
      "봉봉",
      "2001-07-03",
      'FEMALE',
      ["IT"],
    );

    final loginData = Login(
        'test@naver.com',
        '1234'
    );

    try {

      // 인증 api 확인
      final authenticationManager = AuthenticationManager();
      await authenticationManager.signUp(signUpData);
      await authenticationManager.login(loginData);

      // 주식 api 확인
      final stockManager = StockManager();
      final response = await stockManager.checkSocketConnection(); // 소켓 룸 생성
      final socketData = SocketConnect(response?.data['response']);
      // print(socketData.toJson());
      // print("{\"id\":1}");
      channel.sink.add(socketData.toJson().toString()); // 소켓으로 세션 전송 (룸 생성 시 받은 id값 json으로)
      // channel.sink.add("{\"id\":1}");
      await stockManager.changeStock(changeStockData); // 실시간 정보 받을 주식 설정

      // await stockManager.getStockInfo('삼성전자');
      // await stockManager.getStockInfo('DSR제강');

      // await stockManager.getStockChartInfo('001080'); // 만호제강
      // await stockManager.getStockChartInfo('005930'); // 삼성전자
      // await stockManager.getStockChartInfo('069730'); // DSR제강

      // 실시간 API 테스트
    //   await stockManager.getBest5Stock();
    //   await stockManager.getStockInfo("삼성전자");
    } catch (e) {
      // 오류 처리
      print('오류 발생: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebSocket Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _checkAPI, // 첫 번째 버튼에 할당된 함수
                child: const Text('check APIs'),
              ),
            StreamBuilder(
                stream: channel.stream,
                 builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('Received: ${snapshot.data}');
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Container(); // 빈 컨테이너를 반환합니다.
                  }
                },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
