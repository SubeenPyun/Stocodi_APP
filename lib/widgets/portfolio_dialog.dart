import 'package:flutter/material.dart';
import '../API/retrofit/auth_manager.dart';
import '../model/portfolio/request/accounts_model.dart';
import 'green_long_btn.dart';

class PortfolioDialog extends StatefulWidget {
  const PortfolioDialog({Key? key}) : super(key: key);

  @override
  _PortfolioDialogState createState() => _PortfolioDialogState();
}

class _PortfolioDialogState extends State<PortfolioDialog> {
  String portfolioName = '';
  String selectedFunds = '';

  String? selectedButton; // 사용자가 선택한 버튼을 저장할 변수

  void updateSelectedButton(String buttonName) {
    if (selectedButton == buttonName) {
      // 이미 선택된 버튼을 다시 누를 경우 선택 해제
      setState(() {
        selectedButton = null;
        selectedFunds = ''; // 선택 해제될 때 선택된 자금 초기화
      });
    } else {
      setState(() {
        selectedButton = buttonName;
        selectedFunds = buttonName; // 선택한 버튼에 대한 자금 설정
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xffffffff),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "생성할 포트폴리오 이름",
            style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Pretendard Variable',
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              onChanged: (value) {
                portfolioName = value;
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "포트폴리오 자금 설정",
            style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Pretendard Variable',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: smallGreenAction(
                  text: "1천만원",
                  isSelected: selectedButton == "1천만원",
                  onPressed: () {
                    updateSelectedButton("1천만원");
                  },
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: smallGreenAction(
                  text: "3천만원",
                  isSelected: selectedButton == "3천만원",
                  onPressed: () {
                    updateSelectedButton("3천만원");
                  },
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: smallGreenAction(
                  text: "5천만원",
                  isSelected: selectedButton == "5천만원",
                  onPressed: () {
                    updateSelectedButton("5천만원");
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: () async {
            if (portfolioName.isEmpty && selectedFunds.isEmpty) {
              // 포트폴리오 이름이나 자금 설정이 비어있는 경우
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('경고'),
                    content: Text('포트폴리오 이름과 자금 설정을 입력하세요.'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // 경고 다이얼로그 닫기
                        },
                        child: Text('확인'),
                      ),
                    ],
                  );
                },
              );
            } else if (portfolioName.isEmpty && selectedFunds.isNotEmpty) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('경고'),
                    content: Text('포트폴리오 이름을 입력하세요.'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // 경고 다이얼로그 닫기
                        },
                        child: Text('확인'),
                      ),
                    ],
                  );
                },
              );
            } else if (portfolioName.isNotEmpty && selectedFunds.isEmpty) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('경고'),
                    content: Text('자금 설정을 선택하세요.'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // 경고 다이얼로그 닫기
                        },
                        child: Text('확인'),
                      ),
                    ],
                  );
                },
              );
            } else {
              // 포트폴리오 이름과 자금 설정이 입력된 경우
              //print('포트폴리오 이름: $portfolioName');
              //print('선택된 자금: $selectedFunds');

              int selectedmoney;
              if (selectedFunds == '1천만원') {
                selectedmoney = 10000000;
              } else if (selectedFunds == '3천만원') {
                selectedmoney = 30000000;
              } else {
                selectedmoney = 50000000;
              }
              var authenticationManager = AuthenticationManager();
              var portfolioData = PortfolioRequest(
                  account_name: portfolioName, initial_cash: selectedmoney);

              await authenticationManager.makePortfolio(portfolioData);
              Navigator.of(context).pop(); // 다이얼로그 닫기
            }
          },
          child: GreenLongBtn(
            text: '포트폴리오 생성하기',
            height: MediaQuery.of(context).size.height * 0.067,
          ),
        ),
      ],
    );
  }

  Widget smallGreenAction({
    required String text,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF0ECB81) : Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Color(0xFFffFFFF) : Color(0xFF111111),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Pretendard Variable',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
