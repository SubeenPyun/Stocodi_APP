import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../api/toasts.dart';
import '../../widgets/green_long_btn.dart';
import '../../widgets/new_input_field.dart';
import 'interests.dart';

class TmpSignDetail extends StatefulWidget {
  final String enteredEmail;
  final String enteredNickName;
  final String enteredGender;
  final String enteredPwd;

  const TmpSignDetail({
    Key? key,
    required this.enteredEmail,
    required this.enteredNickName,
    required this.enteredGender,
    required this.enteredPwd,
  }) : super(key: key);

  @override
  State<TmpSignDetail> createState() => _TmpSignDetailState();
}

class _TmpSignDetailState extends State<TmpSignDetail> {
  bool isTyping = false;
  String name = '';
  bool canProceed = false;
  String phone = '';
  String birth = '';
  String nickname = '';
  TextEditingController nameController = TextEditingController();
  // 조건을 만족하는지 확인하는 함수
  void checkConditions() {
    if (name.isNotEmpty && phone.length == 11 && birth.length == 8) {
      setState(() {
        canProceed = true;
      });
    } else {
      setState(() {
        canProceed = false;
      });
    }
  }

  Future<void> onKaKaoNextButtonPressed() async {
    if (canProceed) {
      //여기에 새롭게 넘어가야 함 다음 interest로!
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Interest(
            enteredBirth: birth,
            enteredEmail: widget.enteredEmail,
            enteredName: name,
            enteredNickName: widget.enteredNickName,
            enteredPhone: phone,
            enteredPwd: widget.enteredPwd,
          ),
        ),
      );
    } else {
      prepare('모든 항목을 정확히 입력해주세요.');
    }
  }

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
            TextField(
              controller: nameController,
              autofocus: true,
              cursorColor: Color(0xFF0ECB81),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 23, right: 15),
                  child: Icon(Icons.person, size: 20),
                ),
                prefixIconColor: MaterialStateColor.resolveWith((states) =>
                    states.contains(MaterialState.focused)
                        ? Color(0xFF0ECB81)
                        : Color(0xFFBEBEBE)),
                labelText: '이름을 입력해주세요',
                labelStyle: TextStyle(color: Color(0xFFBDBDBD), fontSize: 14),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF0ECB81), width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFEBEBEB), width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              obscureText: false,
              keyboardType: TextInputType.text,
              onChanged: (entername) {
                setState(() {
                  name = nameController.text;
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
              initialText: birth,
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
              initialText: phone,
              // onTextChanged 콜백을 통해 입력된 텍스트 업데이트
              onTextChanged: (enterphone) {
                setState(() {
                  phone = enterphone;
                  checkConditions();
                });
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            GestureDetector(
              onTap: onKaKaoNextButtonPressed,
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
