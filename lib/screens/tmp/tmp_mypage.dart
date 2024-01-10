import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../API/retrofit/auth_manager.dart';
import '../../widgets/long_btn.dart';
import '../../widgets/portfolio_dialog.dart';
import '../login/login.dart';

class Tmpmypage extends StatelessWidget {
  const Tmpmypage({Key? key}) : super(key: key);

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.08,
          MediaQuery.of(context).padding.top +
              MediaQuery.of(context).size.height * 0.14,
          MediaQuery.of(context).size.width * 0.08,
          MediaQuery.of(context).size.height * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
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
              child: LongButton(
                frontboxsize: 22,
                imgName: 'google_login.png',
                text: '로그아웃 하기',
                borderColor: Color(0xFFEBEBEB),
                textColor: Color(0xFF767676),
                height: MediaQuery.of(context).size.height * 0.0627,
                imgsize: 24,
                betweensize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
