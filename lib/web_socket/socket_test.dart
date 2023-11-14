import 'package:flutter/material.dart';
import 'package:stocodi_app/model/stockDTO/request/change_stock.dart';
import 'package:stocodi_app/model/stockDTO/request/interest_stock.dart';
import 'package:stocodi_app/web_socket/stock_manager.dart';
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

  Future<void> _checkAPI() async {
    final changeStockData = ChangeStock(
      "만호제강"
    );

    final interestData1 = InterestStock(
      'test@naver.com',
      '007610'
    );

    final interestData2 = InterestStock(
      'test@naver.com',
      '005030'
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
      await stockManager.checkSocketConnection();
      await stockManager.changeStock(changeStockData);
      await stockManager.getStockChartInfo('001080');
      // await stockManager.registerInterestStock(interestData1);
      // await stockManager.registerInterestStock(interestData2);
      // await stockManager.registerInterestStock(interestData3);
      // await stockManager.registerInterestStock(interestData4);
      // await stockManager.registerInterestStock(interestData5);
      await stockManager.getBest5InterestStock('test@naver.com');
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