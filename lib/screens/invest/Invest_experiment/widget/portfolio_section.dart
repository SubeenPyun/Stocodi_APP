import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stocodi_app/api/retrofit/predefined_data_dto.dart';
import 'package:stocodi_app/model/portfolio/portfolio_data.dart';

import '../../../../theme/app_theme.dart';
import '../../../../widgets/portfolio_dialog.dart';
import '../../../../widgets/round_square_container.dart';
import '../../portfolio.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  Widget _buildPortfolioHeader(ThemeData theme, BuildContext context) {
    return Consumer<PortfolioData>(
      builder: (context, portfolioData, _) {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              portfolioData.portfolioList != null &&
                      portfolioData.portfolioList!.isNotEmpty
                  ? Text(
                      portfolioData.selectedPortfolio.account.account_name,
                      style: theme.textTheme.titleSmall,
                    )
                  : Text(
                      "오른쪽에서 계좌 추가를 해주세요.",
                      style: theme.textTheme.titleSmall,
                    ),
              SizedBox(
                width: 44,
                height: 30,
                child: portfolioData.portfolioList != null &&
                        portfolioData.portfolioList!.isNotEmpty
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Portfolio()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: theme.cardColor,
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
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
                      )
                    : GestureDetector(
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
                          color: Color(0xff575E6B), // 아이콘 색상
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPortfolioAmount() {
    final currencyFormat = NumberFormat.currency(locale: 'ko_KR', symbol: '');

    return Consumer<PortfolioData>(
      builder: (context, portfolioData, _) {
        return Container(
          alignment: Alignment.centerLeft,
          child: Text(
            portfolioData.portfolioList != null &&
                    portfolioData.portfolioList!.isNotEmpty
                ? "${currencyFormat.format(portfolioData.selectedPortfolio.account.remain_cash)} 원"
                : "0 원",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = AppTheme.appTheme;

    return RoundSquareContainer(
      width: MediaQuery.of(context).size.width,
      height: 125,
      child: Column(
        children: [
          _buildPortfolioHeader(theme, context),
          _buildPortfolioAmount(),
        ],
      ),
    );
  }
}
