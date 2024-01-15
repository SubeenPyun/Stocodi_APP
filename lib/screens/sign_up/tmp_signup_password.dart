import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/sign_up/tmp_signup_detail.dart';
import '../../api/toasts.dart';
import '../../widgets/gray_similar_edit.dart';
import '../../widgets/green_long_btn.dart';
import '../../widgets/new_input_field.dart';

class TmpSignupPwd extends StatefulWidget {
  final String enteredEmail;
  final String enteredNickName;
  final String enteredGender;

  const TmpSignupPwd({
    super.key,
    required this.enteredEmail,
    required this.enteredNickName,
    required this.enteredGender,
  });

  @override
  State<TmpSignupPwd> createState() => _TmpSignupPwdState();
}

class _TmpSignupPwdState extends State<TmpSignupPwd> {
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
    String email = widget.enteredEmail;
    String tmpGender = widget.enteredGender;
    String tmpNickname = widget.enteredNickName;

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

              initialText: enteredPassword,
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
              imgName: Icon(
                Icons.mail,
                size: 20,
                color: Color(0xFFBEBEBE),
              ),
              text: email,
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
                  prepare("비밀번호는 영문, 숫자, 특수문자를\n포함한 8~25자리여야 합니다.");
                } else {
                  // 다음 단계로 진행
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TmpSignDetail(
                        enteredEmail: email,
                        enteredPwd: enteredPassword,
                        enteredGender: tmpGender,
                        enteredNickName: tmpNickname,
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
