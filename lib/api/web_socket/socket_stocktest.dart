import 'package:flutter/material.dart';
import 'package:stocodi_app/model/stockDTO/request/change_stock.dart';
import 'package:stocodi_app/model/stockDTO/request/interest_stock.dart';
import 'package:stocodi_app/web_socket/stock_manager.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../retrofit/HttpDTO/Login.dart';
import '../retrofit/HttpDTO/Register.dart';
import '../retrofit/HttpService.dart';

void main() => runApp(const SocketStockTest());

class SocketStockTest extends StatelessWidget {
  const SocketStockTest({super.key});

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

  Future<void> _checkStockAPI() async {
    final changeStockData = ChangeStock(
        "만호제강"
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
      final authenticationManager = AuthenticationManager();
      await authenticationManager.nickNameExist('봉봉'); // 이젠 또 되네
      await authenticationManager.signUp(signUpData);
      await authenticationManager.nickNameExist('봉봉');
      await authenticationManager.login(loginData);
      // await authenticationManager.logOut(); // jwt 받아서 로그아웃
      // 주식 api 확인
      final stockManager = StockManager();
      await stockManager.checkSocketConnection();
      await stockManager.changeStock(changeStockData);
      await stockManager.getBest5Stock();
      await stockManager.getStockInfo('만호제강');
    } catch (e) {
      // 오류 처리
      print('오류 발생: $e');
    }
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
            ElevatedButton(
              onPressed: _checkStockAPI, // 버튼에 할당된 함수
              child: const Text('check APIs'),
            ),
            SizedBox(height: 20), // 버튼 사이에 간격 추가
          ],
        ),
      ),
    );
  }
}