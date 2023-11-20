import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../API/retrofit/auth_manager.dart';
import '../../widgets/long_btn.dart';
import '../../widgets/portfolio_dialog.dart';
import '../login/login.dart';

class Tmpmypage extends StatefulWidget {
  const Tmpmypage({super.key});

  @override
  State<Tmpmypage> createState() => _TmpmypageState();
}

class _TmpmypageState extends State<Tmpmypage> {
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
    return MaterialApp(
      home: Scaffold(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
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
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) {
                      return PortfolioDialog();
                    },
                  );
                },
                child: LongButton(
                  frontboxsize: 22,
                  imgName: 'naver_login.png',
                  text: '다이얼로그 테스트',
                  borderColor: Color(0xFFEBEBEB),
                  textColor: Color(0xFF767676),
                  height: MediaQuery.of(context).size.height * 0.0627,
                  imgsize: 24,
                  betweensize: 12,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () async {
                  List<String> valueList = [];
                  Map<String, int> price = {};

                  try {
                    final authenticationManager = AuthenticationManager();

                    var portfolioResponse =
                        await authenticationManager.getPortfolio();
                    if (portfolioResponse != null) {
                      for (var response in portfolioResponse) {
                        var account = response.account; // 자산 정보에 접근
                        var histories = response.histories; // 거래 기록 목록에 접근
                        var stockHoldings =
                            response.stock_holdings; // 보유 종목 목록에 접근
                        var stockHoldingRates =
                            response.stock_holding_rates; // 보유 종목 등락 목록에 접근

                        //각 AccountModel의 정보를 valueList에 추가
                        valueList.add(account.account_name); //각 포트폴리오 계좌 이름
                        price[account.account_name] = account.remain_cash;
                      }

                      print('Value 리스트 : $valueList');
                      print('Price 맵 : $price');
                    }
                  } catch (e) {
                    // 오류 처리
                    print('오류 발생: $e');
                  }
                },
                child: LongButton(
                  frontboxsize: 22,
                  imgName: 'kakao_login.png',
                  text: '포트폴리오 조회',
                  borderColor: Color(0xFFEBEBEB),
                  textColor: Color(0xFF767676),
                  height: MediaQuery.of(context).size.height * 0.0627,
                  imgsize: 24,
                  betweensize: 12,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              LongButton(
                frontboxsize: 22,
                imgName: 'email_login.png',
                text: '이메일 계정으로 시작하기',
                borderColor: Color(0xFFEBEBEB),
                textColor: Color(0xFF767676),
                height: MediaQuery.of(context).size.height * 0.0627,
                imgsize: 24,
                betweensize: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
