import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stocodi_app/invest/screens/transaction_log.dart';
import 'package:stocodi_app/styles/theme/app_theme.dart';

import '../../styles/widget/custom_appbar.dart';
import '../../styles/widget/round_square_container.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  bool showEarnings = true;
  ThemeData theme = AppTheme.appTheme;

  Widget _buildPortfolioHeader() {
    return RoundSquareContainer(
      width: double.infinity,
      height: 160, // 원래 154
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "유의 포트폴리오_1",
              style: theme.textTheme.titleSmall,
            ),
          ),
          SizedBox(height: 28),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "10,000,000 원",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 32,
              ),
            ),
          ),
          SizedBox(height: 4),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "+123,000원 (7.00%)",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssetSection() {
    return RoundSquareContainer(
      width: double.infinity,
      height: 372,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "자산",
              style: theme.textTheme.titleMedium,
            ),
          ),

          SizedBox(height: 8),

          Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            height: showEarnings ? 222 : 222, // showEarnings에 따라 그래프의 높이 조절
            child: showEarnings
                ? LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(show: false),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      minX: 0, // X 축의 최소 값 (3월)
                      maxX: 5, // X 축의 최대 값 (9월)
                      minY: 0, // Y 축의 최소 값 (만원 단위)
                      maxY: 100, // Y 축의 최대 값 (만원 단위)
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 60), // (X, Y) 좌표 설정
                            FlSpot(1, 40),
                            FlSpot(2, 41),
                            FlSpot(3, 42),
                            FlSpot(4, 50),
                            FlSpot(5, 100),
                          ],
                          isCurved: true, // 꺾인 선 그래프 설정
                          color: theme.primaryColor, // 그래프 선 색상
                          dotData: FlDotData(show: true), // 데이터 점 숨기기
                        ),
                      ],
                    ),
                  )
                : SizedBox(), // 그래프가 보이지 않는 경우 빈 SizedBox 반환
          ),

          SizedBox(height: 30),

          Container(
            width: 146,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: theme.backgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCircularButton("수익률", 0),
                _buildCircularButton("총액", 1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularButton(String label, int value) {
    bool isSelected = showEarnings ? (value == 0) : (value == 1);
    return GestureDetector(
      onTap: () {
        setState(() {
          showEarnings = value == 0;
        });
      },
      child: Container(
        width: 70,
        height: 34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isSelected ? Colors.white : theme.backgroundColor,
        ),
        child: Center(
          child: Text(
            label,
            style: theme.textTheme.titleSmall?.copyWith(
              color: isSelected ? theme.primaryColor : Colors.grey,
            )
          ),
        ),
      ),
    );
  }



  Widget _buildGridContainerSection() {
    return Container(
      width: double.infinity,
      height: 370, // 그리드 높이 동적 조정
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 14, // 가로 간격 14로 설정
        mainAxisSpacing: 14, // 세로 간격 14로 설정
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          _buildGridContainer("보유종목",null),
          _buildGridContainer1("거래내역"),
          _buildGridContainer("거래일지",TransactionLog()),
          _buildGridContainer("배당금",null),
        ],
      ),
    );
  }

  Widget _buildGridContainer(String title, Widget? destinationPage) {
    return GestureDetector(
      onTap: () {
         if (destinationPage != null) {
           Navigator.push(
             context,
              MaterialPageRoute(
                builder: (context) => destinationPage,
              ),
           );
        }
      },
      child: RoundSquareContainer(
        width: 160,
        height: 178,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: Text(
                        title,
                        style: theme.textTheme.titleMedium,
                    )
                ),
                SizedBox(width: 40),
                Container(
                  width: 18,
                  height: 18,
                  child: Image.asset('assets/images/arrow.png', color: theme.primaryColor),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
                width: 84,
                height: 84,
                child: Image.asset('assets/images/no_image.jpg', fit: BoxFit.fill),
            ),
          ],
        ),
      ),
    );
  }

  // 거래내역
  Widget _buildGridContainer1(String title) {
    return RoundSquareContainer(
      width: 164,
      height: 178,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Text(
                      title,
                      style: theme.textTheme.titleMedium,
                  )
              ),
              SizedBox(width: 40),
              Container(
                width: 18,
                height: 18,
                child: Image.asset('assets/images/arrow.png', color: theme.primaryColor,),
              ),
            ],
          ),
          SizedBox(height: 42,),
          Container(
            width: 124,
            height: 26,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Text(
                        "예약",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                    )
                ),
                SizedBox(height: 8),
                Container(
                    child: Text(
                        "2건",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                    )
                ),
              ],
            ),
          ),
          Container(
            width: 124,
            height: 26,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Text(
                        "이번달",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                    )
                ),
                SizedBox(height: 8),
                Container(
                    child: Text(
                        "32건",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // isSub: true,
        preferredHeight: 64,
        title: "포트폴리오",
        onSearchPressed: (){},
        showSearchIcon: false, // searchIcon 안 보이게
      ),
      body: SingleChildScrollView(
        primary: true, // 자식 위젯의 크기에 스크롤 높이 맞춰짐
        child: Container(
          color: theme.backgroundColor,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              _buildPortfolioHeader(),
              _buildAssetSection(),
              _buildGridContainerSection(),
            ],
          ),
        ),
      ),
    );
  }
}
