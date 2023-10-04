import 'package:flutter/material.dart';
import 'package:stocodi_app/sign_up/signup_done.dart';
import 'package:stocodi_app/widgets/green_longbtn.dart';
import 'package:stocodi_app/widgets/interestBox.dart';
import 'package:stocodi_app/widgets/textEditBtn.dart';

class Interest extends StatefulWidget {
  const Interest({super.key});

  @override
  State<Interest> createState() => _InterestState();
}

class _InterestState extends State<Interest> {
  bool isTyping = false;
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 62, 32, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/images/back_toggle.png',
                width: 10,
                height: 20,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 49,
            ),
            const Text(
              '관심종목이 있나요?',
              style: TextStyle(
                color: Color(0xFF191919),
                fontSize: 28,
                fontWeight: FontWeight.w600,
                fontFamily: 'Pretendard Variable',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              '관심 종목을 선택한 후 맞춤화된 서비스를 만나보세요!',
              style: TextStyle(
                color: Color(0xFF767676),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Pretendard Variable',
              ),
            ),
            const SizedBox(
              height: 29,
            ),
            Container(
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InterestBox(
                        imgName: 'medical',
                        text: '의료',
                      ),
                      InterestBox(
                        imgName: 'money',
                        text: '금융',
                      ),
                      InterestBox(
                        imgName: 'laptop',
                        text: 'IT',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InterestBox(
                        imgName: 'chat',
                        text: '통신서비스',
                      ),
                      InterestBox(
                        imgName: 'util',
                        text: '유틸리티',
                      ),
                      InterestBox(
                        imgName: 'energy',
                        text: '에너지',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InterestBox(
                        imgName: 'material',
                        text: '소재',
                      ),
                      InterestBox(
                        imgName: 'material',
                        text: '산업재',
                      ),
                      InterestBox(
                        imgName: 'material',
                        text: '경기소비재',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InterestBox(
                        imgName: 'material',
                        text: '소재',
                      ),
                      InterestBox(
                        imgName: 'material',
                        text: '산업재',
                      ),
                      InterestBox(
                        imgName: 'material',
                        text: '경기소비재',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InterestBox(
                        imgName: 'util',
                        text: '종목',
                      ),
                      InterestBox(
                        imgName: 'util',
                        text: '종목',
                      ),
                      InterestBox(
                        imgName: 'util',
                        text: '종목',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 56,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignDone()));
              },
              child: const GreenLongBtn(text: '다음으로'),
            ),
          ],
        ),
      ),
    );
  }
}
