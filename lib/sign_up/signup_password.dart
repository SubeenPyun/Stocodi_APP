import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stocodi_app/sign_up/signup_deatil.dart';
import 'package:stocodi_app/widgets/gray_editTextSimilar.dart';
import 'package:stocodi_app/widgets/green_longbtn.dart';
import 'package:stocodi_app/widgets/new_inputfield.dart';

class SignupPwd extends StatefulWidget {
  final String enteredTxt;
  const SignupPwd({
    super.key,
    required this.enteredTxt,
  });

  @override
  State<SignupPwd> createState() => _SignupPwdState();
}

class _SignupPwdState extends State<SignupPwd> {
  bool isTyping = false;
  String enteredPassword = ''; // 비밀번호 저장할 변수
  bool isPasswordValid(String password) {
    // 영문, 숫자, 특수문자를 포함한 8~25자리 비밀번호 정규 표현식 정의
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,25}$',
    );

    return passwordRegex.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    String email = widget.enteredTxt;

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
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            NewInputField(
              focus: true,
              image: Icon(Icons.lock, size: 20),
              text: '비밀번호를 입력해주세요',
              obscure: true,
              inputtype: TextInputType.text,
              // onTextChanged 콜백을 통해 입력된 텍스트 업데이트
              onTextChanged: (password) {
                setState(() {
                  enteredPassword = password;
                });
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.017,
            ),
            GraySimilarEdit(
              frontboxsize: 22,
              imgName: 'email',
              text: email,
              betweenboxsize: 6,
              imgColor: 'gray',
              boxColor: Color(0xFFEBEBEB),
              textColor: Color(0xFFBDBDBD),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.47,
            ),
            GestureDetector(
              onTap: () {
                // 비밀번호 유효성 검사
                if (!isPasswordValid(enteredPassword)) {
                  Fluttertoast.showToast(
                    msg: "비밀번호는 영문, 숫자, 특수문자를 포함한 8~25자리여야 합니다.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                } else {
                  // 다음 단계로 진행
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignDetail(
                        enteredEmail: email,
                        enteredPwd: enteredPassword,
                      ),
                    ),
                  );
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
