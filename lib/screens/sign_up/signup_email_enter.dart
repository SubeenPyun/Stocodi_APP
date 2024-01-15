import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/sign_up/signup_password.dart';
import '../../API/retrofit/auth_manager.dart';
import '../../api/toasts.dart';
import '../../widgets/green_long_btn.dart';
import '../../widgets/new_input_field.dart';

class SignEmail extends StatefulWidget {
  const SignEmail({super.key});

  @override
  State<SignEmail> createState() => _SignEmailState();
}

class _SignEmailState extends State<SignEmail> {
  // 입력된 텍스트를 저장할 변수
  String enteredTxt = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.08,
          MediaQuery.of(context).padding.top +
              MediaQuery.of(context).size.height * 0.02,
          MediaQuery.of(context).size.width * 0.08,
          MediaQuery.of(context).size.height * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/images/back_toggle.png',
                width: MediaQuery.of(context).size.width * 0.025,
                height: MediaQuery.of(context).size.height * 0.022,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.056,
            ),
            const Text(
              '이메일로 시작하기',
              style: TextStyle(
                color: Color(0xFF191919),
                fontSize: 28,
                fontWeight: FontWeight.w600,
                fontFamily: 'Pretendard Variable',
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0358,
            ),
            NewInputField(
              focus: true,
              image: Icon(Icons.mail, size: 20),
              text: "이메일 주소를 입력해주세요",
              obscure: false,
              inputtype: TextInputType.emailAddress,
              initialText: enteredTxt,
              // onTextChanged 콜백을 통해 입력된 텍스트 업데이트
              onTextChanged: (text) {
                setState(() {
                  enteredTxt = text;
                });
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
            ),
            GestureDetector(
              onTap: () async {
                final authenticationManager = AuthenticationManager();
                // 입력된 이메일이 유효한지 확인
                if (!isEmailValid(enteredTxt)) {
                   prepare("유효한 이메일 주소를 입력해주세요.");
                } else {
                  // 이메일이 이미 존재하는지 확인
                  bool emailExists =
                      await authenticationManager.emailExist(enteredTxt);

                  if (!emailExists) {
                    prepare("이메일이 이미 존재합니다. 다른 이메일을 입력해주세요.");
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupPwd(
                          enteredTxt: enteredTxt,
                        ),
                      ),
                    );
                  }
                }
              },
              child: GreenLongBtn(
                text: '다음으로',
                height: MediaQuery.of(context).size.height * 0.067,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

bool isEmailValid(String email) {
  final RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
  return emailRegex.hasMatch(email);
}
