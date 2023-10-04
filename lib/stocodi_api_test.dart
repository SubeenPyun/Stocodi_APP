import 'package:flutter/material.dart';
import 'package:stocodi_app/retrofit/HttpDTO/Login.dart';
import 'package:stocodi_app/retrofit/HttpDTO/Register.dart';
import 'retrofit/HttpService.dart';

void main() {
  runApp(const SignUp());
}

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  Future<void> _signUp() async {
    final data = Register(
      "oz@naver.com",
      "1234",
      "김동기",
      'oz',
      "2000-01-11",
      'M',
      "IT",
    );
    final loginData = Login(
      'oz@naver.com',
      '1234'
    );

    try {
      // AuthenticationManager 인스턴스 생성 및 사용
      final authenticationManager = AuthenticationManager();
      /*await authenticationManager.nickNameExist();*/
      await authenticationManager.signUp(data);
      await authenticationManager.nickNameExist('예리미양');
      /*await authenticationManager.login(loginData);*/
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
        child: ElevatedButton(
          onPressed: _signUp, // 함수 자체를 할당합니다.
          child: const Text('Call API'),
        ),
      ),
    );
  }
}
