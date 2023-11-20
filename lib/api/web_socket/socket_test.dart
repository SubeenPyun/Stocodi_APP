import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stocodi_app/model/stockDTO/request/change_stock.dart';
import 'package:stocodi_app/model/stockDTO/request/interest_stock.dart';
import 'package:stocodi_app/model/stockDTO/socket_connect.dart';
import 'package:stocodi_app/web_socket/stock_manager.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../retrofit/HttpDTO/Login.dart';
import '../retrofit/HttpDTO/Register.dart';
import '../retrofit/HttpService.dart';

void main() => runApp(const SocketTest());

class SocketTest extends StatelessWidget {
  const SocketTest({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'WebSocket Demo';
    return const MaterialApp(
      title: title,
      home: TestPage(
        title: title,
      ),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  // final channel = IOWebSocketChannel.connect('ws://10.0.2.2:53001/api/ws/stock'); // 소켓 연결
  final url =  Uri.parse('ws://10.0.2.2:53001/api/ws/stock');
  late WebSocketChannel channel; // 소켓 연결

  StreamController<String> _messageController =
      StreamController<String>.broadcast();

  @override
  void initState() {
    super.initState();
    _initializeWebSocket();
  }

  void _initializeWebSocket() async {
    channel = WebSocketChannel.connect(url);
    channel.stream.listen((event) {
      _messageController.add(event);
    });
  }


  Future<void> _checkAPI() async {
    final changeStockData = ChangeStock(
      // "삼성전자"
      "DSR제강"
    );

    final interestData1 = InterestStock(
      'test@naver.com',
      '005930'
    );

    final interestData2 = InterestStock(
      'test@naver.com',
      '005935'
    );

    final interestData3 = InterestStock(
      'test@naver.com',
      '003560'
    );

    final interestData4 = InterestStock(
      'test@naver.com',
      '001340'
    );

    final interestData5 = InterestStock(
      'test@naver.com',
      '001080'
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
      // await authenticationManager.nickNameExist('봉봉'); // 이젠 또 되네
      // await authenticationManager.signUp(signUpData);
      // await authenticationManager.nickNameExist('봉봉');
      await authenticationManager.login(loginData);
      // await authenticationManager.logOut(); // jwt 받아서 로그아웃


      // 주식 api 확인
      final stockManager = StockManager();
      final response = await stockManager.checkSocketConnection(); // 소켓 룸 생성
      final socketData = SocketConnect(response?.data['response']);
      print(socketData.toJson());
      // StreamController<String> _messageController;
      // 에뮬레이터용 웹소켓 서버 url
      channel = WebSocketChannel.connect(url);

      await Future.delayed(Duration(milliseconds: 500));

      channel.sink.add(socketData.toJson()); // 소켓으로 세션 전송 (룸 생성 시 받은 id값 json으로)
      // _messageController = StreamController<String>.broadcast();
      // channel.stream.listen((event) {
      //   // _messageController.add(event);
      //   print(event);
      // });
      await stockManager.changeStock(changeStockData); // 실시간 정보 받을 주식 설정

      // await stockManager.getStockInfo('삼성전자');
      // await stockManager.getStockInfo('DSR제강');

      // await stockManager.getStockChartInfo('001080'); // 만호제강
      // await stockManager.getStockChartInfo('005930'); // 삼성전자
      await stockManager.getStockChartInfo('069730'); // DSR제강

      // await stockManager.registerInterestStock(interestData1);
      // await stockManager.registerInterestStock(interestData2);
      // await stockManager.registerInterestStock(interestData3);
      // await stockManager.registerInterestStock(interestData4);
      // await stockManager.registerInterestStock(interestData5);
      // await stockManager.getBest5InterestStock('test@naver.com');

      // 실시간 API 테스트
    //   await stockManager.getBest5Stock();
    //   await stockManager.getStockInfo("삼성전자");
    } catch (e) {
      // 오류 처리
      print('오류 발생: $e');
    }
  }

  // 상태 클래스가 종료될 때 호출
  @override
  void dispose() {
    // 채널을 닫음
    channel.sink.close();
    _messageController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // StreamBuilder(
            //     stream: _messageController.stream,
            //     builder: (context, snapshot) {
            //     return Padding(
            //       padding: const EdgeInsets.symmetric(vertical: 24.0),
            //       // 수신 데이터가 존재할 경우 해당 데이터를 텍스트로 출력
            //       child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
            //     );
            //   },
            // ),
            ElevatedButton(
              onPressed: _checkAPI, // 첫 번째 버튼에 할당된 함수
              child: const Text('check APIs'),
            ),
            SizedBox(height: 20), // 버튼 사이에 간격 추가
            /*ElevatedButton(
              onPressed: _anotherFunction, // 두 번째 버튼에 할당된 함수
              child: const Text('Call API 2'),
            ),*/
          ],
        ),
      ),
    );
  }
}