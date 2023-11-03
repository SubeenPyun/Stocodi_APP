import 'package:flutter/material.dart';
import 'package:stocodi_app/sign_up/interests.dart';
import 'package:stocodi_app/widgets/green_longbtn.dart';
import 'package:stocodi_app/widgets/textEditBtn.dart';

class SignDetail extends StatefulWidget {
  const SignDetail({super.key});

  @override
  State<SignDetail> createState() => _SignDetailState();
}

class _SignDetailState extends State<SignDetail> {
  bool isTyping = false;
  TextEditingController emailController = TextEditingController();

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
            TextEditBtn(
              nosee: false,
              inputtype: TextInputType.name,
              frontboxsize: 22,
              icon: Icons.person,
              text: '이름을 입력해주세요',
              betweenboxsize: 6,
              height: MediaQuery.of(context).size.height * 0.0627,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.017,
            ),
            TextEditBtn(
              nosee: false,
              inputtype: TextInputType.name,
              frontboxsize: 22,
              icon: Icons.person,
              text: '사용할 닉네임을 입력해주세요',
              betweenboxsize: 6,
              height: MediaQuery.of(context).size.height * 0.0627,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.017,
            ),
            TextEditBtn(
              nosee: false,
              inputtype: TextInputType.number,
              frontboxsize: 22,
              icon: Icons.calendar_month,
              text: '생년월일을 입력해주세요 (8자리)',
              betweenboxsize: 6,
              height: MediaQuery.of(context).size.height * 0.0627,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.017,
            ),
            TextEditBtn(
              nosee: false,
              inputtype: TextInputType.phone,
              frontboxsize: 22,
              icon: Icons.phone_android,
              text: '휴대폰 번호를 입력해주세요 (숫자만 입력)',
              betweenboxsize: 6,
              height: MediaQuery.of(context).size.height * 0.0627,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.306,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Interest()));
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
