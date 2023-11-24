import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stocodi_app/model/portfolio/response/portfolio_response.dart';
import 'package:stocodi_app/model/portfolio/portfolio_data.dart';
import 'package:stocodi_app/widgets/portfolio_dialog.dart';

class HomeHeader extends StatefulWidget {
  HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  var f = NumberFormat('###,###,###,###');
  late PortfolioData portfolioData;
  late PortfoiloResponse? homeselect;

  @override
  void initState() {
    super.initState();
    portfolioData = Provider.of<PortfolioData>(context, listen: false);
    portfolioData.loadPortfolioData();
  }

  String formatCurrency(int value) {
    final formatter = NumberFormat("#,###");

    if (value >= 0) {
      return '+${formatter.format(value)}원';
    } else {
      return '${formatter.format(value.abs())}원';
    }
  }

  String formatReturns(double value) {
    final formatter = NumberFormat("#,###");

    if (value >= 0) {
      return '+${formatter.format(value)}%';
    } else {
      return '${formatter.format(value.abs())}%';
    }
  }

  Color getReturnsColor(double value) {
    return value >= 0
        ? Color(0xFFF6465D)
        : Color(0xff4496F7); // 양수일 때 빨간색, 음수일 때 파란색
  }

  Color getTextColor(int value) {
    return value >= 0
        ? Color(0xFFF6465D)
        : Color(0xff4496F7); // 양수일 때 빨간색, 음수일 때 파란색
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PortfolioData>(
      builder: (context, portfolioData, _) {
        //portfolioData.loadPortfolioData();

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/app_background.png'),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/stocodi.png',
                          width: 150,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (context) {
                                    return PortfolioDialog();
                                  },
                                );
                                portfolioData.loadPortfolioData();
                              },
                              child: Icon(
                                Icons.add_card, // 플러스 아이콘
                                size: 35, // 아이콘 크기
                                color: Colors.white, // 아이콘 색상
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                //height: 120,
                width: double.infinity,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Color(0xFF0ECB81),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 25, right: 25, left: 25),
                      child: portfolioData.portfolioList != null &&
                              portfolioData.portfolioList!.isNotEmpty
                          ? DropdownButton<PortfoiloResponse>(
                              style: TextStyle(color: Colors.white),
                              dropdownColor: Color(0xFF0ECB81),
                              elevation: 0,
                              underline: SizedBox.shrink(),
                              value: portfolioData.selectedPortfolio,
                              icon: Icon(
                                Icons.keyboard_arrow_down, // 드롭다운 아이콘
                                color: Colors.white, // 아이콘 색상 (흰색)
                              ),
                              items: portfolioData.portfolioList!
                                  .map((PortfoiloResponse portfolio) =>
                                      DropdownMenuItem(
                                          value: portfolio,
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            portfolio.account.account_name,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          )))
                                  .toSet()
                                  .toList(),
                              onChanged: (PortfoiloResponse? newValue) {
                                if (newValue != null) {
                                  //setState(() {
                                  //homeselect = newValue;
                                  portfolioData.updateSelected(newValue);
                                  //});
                                }
                              },
                            )
                          : Text(
                              '우측 상단에서 계좌를 추가하세요.',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                    ),
                    SizedBox(
                      height: portfolioData.portfolioList != null &&
                              portfolioData.portfolioList!.isNotEmpty
                          ? 0
                          : 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 25, left: 25),
                      child: Text(
                        portfolioData.portfolioList != null &&
                                portfolioData.portfolioList!.isNotEmpty
                            ? "${f.format(portfolioData.selectedPortfolio.account.remain_cash)}원"
                            : "0원",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: portfolioData.portfolioList != null &&
                        portfolioData.portfolioList!.isNotEmpty
                    ? 0
                    : 20,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 80, right: 25, left: 25, bottom: 12),
                    child: Container(
                      width: double.infinity,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly, // 수평으로 공간을 고르게 분배
                                crossAxisAlignment:
                                    CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬
                                children: [
                                  Expanded(
                                    child: Text(
                                      "수익률",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '수익금',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly, // 수평으로 공간을 고르게 분배
                                crossAxisAlignment:
                                    CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬
                                children: [
                                  Expanded(
                                    child: Text(
                                      portfolioData.portfolioList != null &&
                                              portfolioData
                                                  .portfolioList!.isNotEmpty
                                          ? formatReturns(portfolioData
                                              .selectedPortfolio
                                              .account
                                              .cumulative_returns)
                                          : "0%",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: portfolioData.portfolioList !=
                                                      null &&
                                                  portfolioData
                                                      .portfolioList!.isNotEmpty
                                              ? getReturnsColor(portfolioData
                                                  .selectedPortfolio
                                                  .account
                                                  .cumulative_returns)
                                              : Color(0xFFF6465D),
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      portfolioData.portfolioList != null &&
                                              portfolioData
                                                  .portfolioList!.isNotEmpty
                                          ? formatCurrency(portfolioData
                                              .selectedPortfolio
                                              .account
                                              .unrealized_gain)
                                          : '0원',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: portfolioData.portfolioList !=
                                                      null &&
                                                  portfolioData
                                                      .portfolioList!.isNotEmpty
                                              ? getTextColor(portfolioData
                                                  .selectedPortfolio
                                                  .account
                                                  .unrealized_gain)
                                              : Color(0xFFF6465D),
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
