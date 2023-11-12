import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stocodi_app/retrofit/HttpService.dart';
import 'package:stocodi_app/sign_up/interests.dart';
import 'package:stocodi_app/widgets/green_longbtn.dart';
import 'package:stocodi_app/widgets/new_inputfield.dart';

class SignDetail extends StatefulWidget {
  final String enteredEmail;
  final String enteredPwd;
  const SignDetail({
    Key? key,
    required this.enteredEmail,
    required this.enteredPwd,
  }) : super(key: key);

  @override
  State<SignDetail> createState() => _SignDetailState();
}

class _SignDetailState extends State<SignDetail> {
  bool isTyping = false;
  TextEditingController emailController = TextEditingController();
  String name = '';
  String phone = '';
  String birth = '';
  String nickname = '';
  bool canProceed = false;
  // 조건을 만족하는지 확인하는 함수
  void checkConditions() {
    if (name.isNotEmpty &&
        phone.length == 11 &&
        birth.length == 8 &&
        nickname.isNotEmpty) {
      setState(() {
        canProceed = true;
      });
    } else {
      setState(() {
        canProceed = false;
      });
    }
  }

  // 특수문자 체크 함수
  bool containsSpecialCharacters(String value) {
    // 허용할 문자셋을 지정하고, 해당 문자셋에 포함되지 않으면 특수문자로 판단
    RegExp specialCharacters = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    return specialCharacters.hasMatch(value);
  }

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

  Future<void> onNextButtonPressed() async {
    if (canProceed) {
      // 조건이 충족되었을 때 닉네임 중복 검사
      final authenticationManager = AuthenticationManager();

      bool nicknameExists = await authenticationManager.nickNameExist(nickname);

      if (!nicknameExists) {
        // 닉네임이 이미 존재하는 경우 에러 메시지 표시
        showToast('닉네임이 이미 존재합니다. 다른 닉네임을 입력해주세요.');
      } else {
        // 닉네임이 존재하지 않는 경우 다음 페이지로 이동
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Interest(
              enteredBirth: birth,
              enteredEmail: widget.enteredEmail,
              enteredName: name,
              enteredNickName: nickname,
              enteredPhone: phone,
              enteredPwd: widget.enteredPwd,
            ),
          ),
        );
      }
    } else {
      // 조건이 충족되지 않았을 때 오류 메시지 토스트로 표시
      showToast('모든 항목을 정확히 입력해주세요.');
      print('오류오류: name=$name, phone=$phone, birth=$birth, nick=$nickname');
    }
  }

  @override
  Widget build(BuildContext context) {
    String email = widget.enteredEmail;
    String pwd = widget.enteredPwd;

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
              '거의 다 왔어요!',
              style: TextStyle(
                color: Color(0xFF191919),
                fontSize: 28,
                fontWeight: FontWeight.w600,
                fontFamily: 'Pretendard Variable',
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.036,
            ),
            NewInputField(
              focus: true,
              image: Icon(Icons.person, size: 20),
              text: '이름을 입력해주세요',
              obscure: false,
              inputtype: TextInputType.name,
              // onTextChanged 콜백을 통해 입력된 텍스트 업데이트
              onTextChanged: (entername) {
                setState(() {
                  name = entername;
                  checkConditions();
                });
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.017,
            ),
            NewInputField(
              focus: true,
              image: Icon(Icons.person, size: 20),
              text: '사용할 닉네임을 입력해주세요',
              obscure: false,
              inputtype: TextInputType.name,
              // onTextChanged 콜백을 통해 입력된 텍스트 업데이트
              onTextChanged: (enternickname) {
                setState(() {
                  if (!containsSpecialCharacters(enternickname)) {
                    nickname = enternickname;
                    checkConditions();
                  } else {
                    //특수문자 들어갔으니 안된다는 말을 써야 한다.
                    showToast('닉네임에는 특수문자가 들어갈 수 없습니다.');
                  }
                });
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.017,
            ),
            NewInputField(
              focus: true,
              image: Icon(Icons.calendar_month, size: 20),
              text: '생년월일을 입력해주세요 (8자리)',
              obscure: false,
              inputtype: TextInputType.number,
              // onTextChanged 콜백을 통해 입력된 텍스트 업데이트
              onTextChanged: (enterbirth) {
                setState(() {
                  birth = enterbirth;
                  checkConditions();
                });
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.017,
            ),
            NewInputField(
              focus: true,
              image: Icon(Icons.phone_android, size: 20),
              text: '휴대폰 번호를 입력해주세요 (숫자만 입력)',
              obscure: false,
              inputtype: TextInputType.phone,
              // onTextChanged 콜백을 통해 입력된 텍스트 업데이트
              onTextChanged: (enterphone) {
                setState(() {
                  phone = enterphone;
                  checkConditions();
                });
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.306,
            ),
            GestureDetector(
              onTap: onNextButtonPressed,
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
