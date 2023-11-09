import 'package:flutter/material.dart';
import 'HttpService.dart';
import 'httpdto/predefined_data_dto.dart';

void main() {
  runApp(const SignUp());
}

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  Future<void> _signUp() async {

    try {
      // AuthenticationManager 인스턴스 생성 및 사용
      final authenticationManager = AuthenticationManager();
      //await authenticationManager.signUp(signupData);
      var nicnkameResult = await authenticationManager.nickNameExist('oz');
      var loginResponse = await authenticationManager.login(loginData);
      await authenticationManager.logOut(); // jwt 받아서 로그아웃
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
              onPressed: _signUp, // 첫 번째 버튼에 할당된 함수
              child: const Text('Call API 1'),
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