import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stocodi_app/invest/screens/transaction_log.dart';
import 'package:stocodi_app/theme/app_theme.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/round_square_container.dart';

List<String> get weekDays =>
      const ['3월', '4월', '5월', '6월', '7월', '8월', '9월'];

List<double> get yValues => const [60, 40, 39, 42, 50, 100];

List<String> portfolioList = [
  "유의 포트폴리오_1",
  "유의 포트폴리오_2",
  "유의 포트폴리오_3",
];

String selectedPortfolio = "유의 포트폴리오_1"; // 초기 선택

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  double touchedValue = -1;

  bool showEarnings = true;
  ThemeData theme = AppTheme.appTheme;

  @override
  void initState() {
    touchedValue = -1;
    super.initState();
  }

  Widget _buildPortfolioHeader() {
    return RoundSquareContainer(
      width: double.infinity,
      height: 160, // 원래 154
      child: Column(
        children: [
          Container(
            height: 22,
            alignment: Alignment.centerLeft,
           child: DropdownButton<String>(
              underline: SizedBox.shrink(),
              value: selectedPortfolio, // 현재 선택된 포트폴리오
              items: portfolioList.map((String portfolio) {
                return DropdownMenuItem<String>(
                  value: portfolio,
                  child: Text(
                    portfolio,
                    style: theme.textTheme.titleSmall,
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedPortfolio = newValue!;
                });
              },
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

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final isTouched = value == touchedValue;
    final style = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: isTouched? theme.primaryColor : const Color(0xffB1CAC8),
    );

    Widget text = Text(
        '${value.toInt()+3}월',
        style: style
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  // fl_chart 라이브러리 깃허브
  // https://github.com/imaNNeo/fl_chart/blob/master/repo_files/documentations/line_chart.md
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
            padding: EdgeInsets.all(7),
            height: showEarnings ? 222 : 222, // showEarnings에 따라 그래프의 높이 조절
            child: showEarnings
                ? LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawHorizontalLine: false,
                        drawVerticalLine: true,
                        checkToShowVerticalLine: (value) => value % 1 == 0,
                        getDrawingVerticalLine: (value) {
                          return const FlLine(
                              color: const Color(0xffF3F7F9),
                              strokeWidth: 0.5,
                            );
                        }
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          )
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            getTitlesWidget: bottomTitleWidgets,
                            interval: 1,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          )
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          )
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      minX: 0, // X 축의 최소 값 (3월)
                      maxX: 5, // X 축의 최대 값 (9월)
                      minY: 0, // Y 축의 최소 값 (만원 단위)
                      maxY: 110, // Y 축의 최대 값 (만원 단위)
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 60), // (X, Y) 좌표 설정
                            FlSpot(1, 35),
                            FlSpot(2, 31),
                            FlSpot(3, 35),
                            FlSpot(4, 50),
                            FlSpot(5, 100),
                          ],
                          isCurved: false, // 그래프 각지게
                          color: const Color(0xff81DFBA), // 그래프 선 색상
                          barWidth: 4,
                          dotData: FlDotData(
                            show: true, // 데이터 점 보이게
                            getDotPainter: (spot, percent, barData, index) =>
                                FlDotCirclePainter(
                                  radius: 4,
                                  color: Colors.white,
                                  strokeColor: const Color(0xff0ECB81),
                                  strokeWidth: 4,
                                ),
                          ),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xffE3FFE7).withOpacity(1),
                                const Color(0xffDCFFE0).withOpacity(1),
                                const Color(0xffFFFFFF).withOpacity(0),
                              ],
                              // stops: const [0.5, 1.0],
                              begin: Alignment.topCenter,
                              end:Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ],
                      lineTouchData: LineTouchData(
                        getTouchedSpotIndicator:
                            (LineChartBarData barData, List<int> spotIndexes) {
                          return spotIndexes.map((spotIndex) {
                            final spot = barData.spots[spotIndex];
                            // if (spot.x == 0 || spot.x == 6) {
                            //   return null;
                            // }
                            return TouchedSpotIndicatorData(
                              FlLine(
                                color: const Color(0xff81DFBA),
                                strokeWidth: 0,
                              ),
                              FlDotData(
                                getDotPainter: (spot, percent, barData, index) {
                                  return FlDotCirclePainter(
                                    radius: 5,
                                    color: Colors.white,
                                    strokeWidth: 5,
                                    strokeColor: const Color(0xff0ECB81),
                                  );
                                },
                              ),
                            );
                          }).toList();
                        },
                        touchTooltipData: LineTouchTooltipData(
                          tooltipBgColor: Colors.black,
                          tooltipRoundedRadius: 20,
                          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                            return touchedBarSpots.map((barSpot) {
                              final flSpot = barSpot;
                              // if(flSpot.x==0 || flSpot.x==6){
                              //   return null;
                              // }

                              return LineTooltipItem(
                                '${flSpot.y.toInt()}만원',
                                TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              );
                            }).toList();
                          },
                        ),
                        touchCallback:
                            (FlTouchEvent event, LineTouchResponse? lineTouch){
                          if(!event.isInterestedForInteractions ||
                            lineTouch == null ||
                            lineTouch.lineBarSpots == null){
                            setState(() {
                              touchedValue = -1;
                            });
                            return;
                          }

                          final value = lineTouch.lineBarSpots![0].x;

                          setState(() {
                            touchedValue = value;
                          });
                        }

                      ),
                  )
              ) : SizedBox.shrink(), // 그래프가 보이지 않는 경우 빈 SizedBox 반환
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
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (164 / 178),
        crossAxisSpacing: 14, // 가로 간격 14로 설정
        mainAxisSpacing: 14, // 세로 간격 14로 설정
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          _buildGridContainer("보유종목", "grid1", null),
          _buildGridContainer1("거래내역"),
          _buildGridContainer("거래일지", "grid3", TransactionLog()),
          _buildGridContainer("배당금", "grid4", null),
        ],
      ),
    );
  }

  Widget _buildGridContainer(String title, String image, Widget? destinationPage) {
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
        width: 164,
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
                width: 96,
                height: 96,
                child: Image.asset('assets/images/${image}.png', fit: BoxFit.fill),
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
