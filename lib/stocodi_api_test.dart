import 'package:flutter/material.dart';
import 'retrofit/HttpService.dart';
import 'retrofit/HttpDTO.dart';

void main() {
  runApp(const SignUp());
}

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  Future<void> _signUp() async {
    final data = signUpRequest(
      "test111@naver.com",
      "편수빈",
      "1234",
      "봉봉",
      "2001-07-03",
      ["IT"],
      "USER",
    );

    try {
      // AuthenticationManager 인스턴스 생성 및 사용
      final authenticationManager = AuthenticationManager();
      /*await authenticationManager.nickNameExist();*/
      await authenticationManager.signUp(data);
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
