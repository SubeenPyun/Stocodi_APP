import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stocodi_app/model/portfolio/response/portfolio_response.dart';
import 'package:stocodi_app/theme/app_theme.dart';
import 'package:stocodi_app/widgets/round_square_container.dart';
import '../../../../model/portfolio/portfolio_data.dart';

class PortfolioHeader extends StatelessWidget {
  const PortfolioHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.appTheme;
    final currencyFormat = NumberFormat.currency(locale: 'ko_KR', symbol: '');

    return Consumer<PortfolioData>(
      builder: (context, portfolioData, _) {
        return RoundSquareContainer(
          width: double.infinity,
          height: 160,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: portfolioData.portfolioList != null &&
                          portfolioData.portfolioList!.isNotEmpty
                      ? DropdownButton<PortfoiloResponse>(
                          underline: SizedBox.shrink(),
                          value: portfolioData.selectedPortfolio,
                          items: portfolioData.portfolioList!
                              .map((PortfoiloResponse portfolio) =>
                                  DropdownMenuItem(
                                      value: portfolio,
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        portfolio.account.account_name,
                                        style: theme.textTheme.titleSmall,
                                      )))
                              .toSet()
                              .toList(),
                          onChanged: (newValue) {
                            if (newValue != null) {
                              portfolioData.updateSelected(newValue);
                            }
                          },
                        )
                      : Text(
                          '우측 상단에서 계좌를 추가하세요.',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    portfolioData.portfolioList != null &&
                            portfolioData.portfolioList!.isNotEmpty
                        ? "${currencyFormat.format(portfolioData.selectedPortfolio.account.remain_cash)} 원"
                        : "0원", // 자산 업데이트
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: portfolioData.portfolioList != null &&
                          portfolioData.portfolioList!.isNotEmpty
                      ? Text(
                          "${portfolioData.selectedPortfolio.account.unrealized_gain >= 0 ? "+" : ""}${currencyFormat.format(portfolioData.selectedPortfolio.account.unrealized_gain)}원 (${portfolioData.selectedPortfolio.account.cumulative_returns.toStringAsFixed(2)}%)",
                          // 수익률 업데이트
                          style: TextStyle(
                            color: portfolioData.selectedPortfolio.account
                                        .unrealized_gain >=
                                    0
                                ? Color(0xffF6465D)
                                : Color(0xff4496F7),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        )
                      : Text(
                          "0원 (0.00%)",
                          // 수익률 업데이트
                          style: TextStyle(
                            color: Color(0xffF6465D),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
