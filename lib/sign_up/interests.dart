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
            MediaQuery.of(context).size.height * 0.03),
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
              height: MediaQuery.of(context).size.height * 0.05,
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.013,
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.033,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InterestBox(
                          imgName: 'medical',
                          text: '의료',
                          length: MediaQuery.of(context).size.width * 0.24,
                          howmuch: MediaQuery.of(context).size.height * 0.01,
                        ),
                        InterestBox(
                          imgName: 'money',
                          text: '금융',
                          length: MediaQuery.of(context).size.width * 0.24,
                          howmuch: MediaQuery.of(context).size.height * 0.01,
                        ),
                        InterestBox(
                          imgName: 'laptop',
                          text: 'IT',
                          length: MediaQuery.of(context).size.width * 0.24,
                          howmuch: MediaQuery.of(context).size.height * 0.01,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InterestBox(
                          imgName: 'chat',
                          text: '통신서비스',
                          length: MediaQuery.of(context).size.width * 0.24,
                          howmuch: MediaQuery.of(context).size.height * 0.01,
                        ),
                        InterestBox(
                          imgName: 'util',
                          text: '유틸리티',
                          length: MediaQuery.of(context).size.width * 0.24,
                          howmuch: MediaQuery.of(context).size.height * 0.01,
                        ),
                        InterestBox(
                          imgName: 'energy',
                          text: '에너지',
                          length: MediaQuery.of(context).size.width * 0.24,
                          howmuch: MediaQuery.of(context).size.height * 0.01,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InterestBox(
                          imgName: 'material',
                          text: '소재',
                          length: MediaQuery.of(context).size.width * 0.24,
                          howmuch: MediaQuery.of(context).size.height * 0.01,
                        ),
                        InterestBox(
                          imgName: 'material',
                          text: '산업재',
                          length: MediaQuery.of(context).size.width * 0.24,
                          howmuch: MediaQuery.of(context).size.height * 0.01,
                        ),
                        InterestBox(
                          imgName: 'material',
                          text: '경기소비재',
                          length: MediaQuery.of(context).size.width * 0.24,
                          howmuch: MediaQuery.of(context).size.height * 0.01,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InterestBox(
                          imgName: 'material',
                          text: '소재',
                          length: MediaQuery.of(context).size.width * 0.24,
                          howmuch: MediaQuery.of(context).size.height * 0.01,
                        ),
                        InterestBox(
                          imgName: 'material',
                          text: '산업재',
                          length: MediaQuery.of(context).size.width * 0.24,
                          howmuch: MediaQuery.of(context).size.height * 0.01,
                        ),
                        InterestBox(
                          imgName: 'material',
                          text: '경기소비재',
                          length: MediaQuery.of(context).size.width * 0.24,
                          howmuch: MediaQuery.of(context).size.height * 0.01,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InterestBox(
                          imgName: 'util',
                          text: '종목',
                          length: MediaQuery.of(context).size.width * 0.24,
                          howmuch: MediaQuery.of(context).size.height * 0.01,
                        ),
                        InterestBox(
                          imgName: 'util',
                          text: '종목',
                          length: MediaQuery.of(context).size.width * 0.24,
                          howmuch: MediaQuery.of(context).size.height * 0.01,
                        ),
                        InterestBox(
                          imgName: 'util',
                          text: '종목',
                          length: MediaQuery.of(context).size.width * 0.24,
                          howmuch: MediaQuery.of(context).size.height * 0.01,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignDone()));
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
