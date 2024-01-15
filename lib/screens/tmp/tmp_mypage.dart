import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../API/retrofit/auth_manager.dart';
import '../login/login.dart';

class Tmpmypage extends StatelessWidget {
  const Tmpmypage({Key? key}) : super(key: key);

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xff0ECB81),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () async {
          final authenticationManager = AuthenticationManager();
          try {
            var logoutResponse = await authenticationManager.logOut();

            // 로그인이 실패하면 토스트 메시지를 표시
            if (logoutResponse == false) {
              showToast('로그아웃에 오류가 발생하였습니다.');
            } else {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
                (route) => false,
              );
            }
          } catch (e) {
            // Dio 오류 또는 다른 예외가 발생한 경우
            print('오류 발생: $e');
            showToast('로그아웃 중 오류가 발생했습니다.');
          }
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout, size: 24),
              SizedBox(width: 12),
              Text(
                "로그아웃하기",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF767676), // Change the color as needed
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
