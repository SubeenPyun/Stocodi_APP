import 'package:flutter/material.dart';
import 'package:stocodi_app/invest/item/interest_invest_item.dart';
import 'package:stocodi_app/invest/screens/portfolio.dart';
import 'package:stocodi_app/styles/widget/custom_appbar.dart';

import '../../styles/theme/app_theme.dart';
import '../../styles/widget/round_square_container.dart';

final ThemeData theme = AppTheme.appTheme;

class InvestExperiment extends StatefulWidget{
  const InvestExperiment({Key? key}) : super(key: key);

  @override
  _InvestExperimentState createState() => _InvestExperimentState();
}

Container _bodyWidget(BuildContext context){

  Widget buildInterestItem(String image, String title, int price, double percentage) {
    return InterestInvestItem(
      image: image,
      title: title,
      price: price,
      percentage: percentage,
      onPressed: () {},
    );
  }

  return Container(
    color: theme.backgroundColor,
    padding: EdgeInsets.all(20),
    child: Column(
      children: [
        RoundSquareContainer( // 포트폴리오
          width : MediaQuery.of(context).size.width,
          height : 125,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ // 포트폴리오 이름과 관리 버튼
                    Text(
                      "포트폴리오 1",
                      style: theme.textTheme.titleSmall,
                    ),
                    Container(
                      width: 44,
                      height: 30,
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Portfolio()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            backgroundColor: theme.cardColor,
                            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0), // 버튼 내부 패딩 조정
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // 모서리 둥글게 설정
                            ),
                          ),
                          child: Text(
                              "관리",
                            style: TextStyle(
                              color: const Color(0xff575E6B),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft, // 왼쪽 정렬
                child: Text(
                  "1,234,500 원",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
              ), // 포트폴리오 금액
            ],
          ),

        ),
        Expanded(
          child: RoundSquareContainer( // 관심종목
            width : MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.centerLeft, // 왼쪽 정렬
                  child: Text(
                    "관심종목",
                    textAlign: TextAlign.left,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index){
                      switch (index) {
                        case 0:
                          return buildInterestItem(
                              "apple", "애플", 237816, 3.6);
                        case 1:
                          return buildInterestItem(
                              "teslr", "테슬라", 331672, -1.1);
                        case 2:
                          return buildInterestItem(
                              "ecopro", "에코프로", 1021000, 1.4);
                        case 3:
                          return buildInterestItem(
                              "posco", "포스코DX", 60700, 3.2);
                        case 4:
                          return buildInterestItem(
                              "sm", "에스엠", 132000, 1.3);
                        default:
                          return SizedBox.shrink();
                      }
                    },

                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class _InvestExperimentState extends State<InvestExperiment> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        preferredHeight: 64,
        title: "투자실험",
        onSearchPressed: (){},
        showSearchIcon: true, // searchIcon 보이게
      ),
      body: _bodyWidget(context),
    );
  }
}
