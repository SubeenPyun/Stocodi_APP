import 'package:flutter/material.dart';
import 'package:stocodi_app/invest/item/interest_invest_item.dart';
import 'package:stocodi_app/invest/screens/portfolio.dart';

import '../../styles/theme/app_theme.dart';
import '../../styles/widget/round_square_container.dart';

class InvestExperiment extends StatefulWidget{
  const InvestExperiment({Key? key}) : super(key: key);

  @override
  _InvestExperimentState createState() => _InvestExperimentState();
}

Container _bodyWidget(BuildContext context){

  ThemeData theme = AppTheme.appTheme;

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
                            backgroundColor: theme.cardColor,
                            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0), // 버튼 내부 패딩 조정
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // 모서리 둥글게 설정
                            ),
                          ),
                          child: Text(
                              "관리",
                            style: TextStyle(
                              color: Colors.grey,
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
                      return InterestInvestItem(
                          image: "apple.jpeg",
                          title: "애플",
                          price: 237816,
                          percentage: 3.6,
                          onPressed: (){},
                      );
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
      appBar: AppBar(
        title: Text('투자실험'),
      ),
      body: _bodyWidget(context),
    );
  }
}
