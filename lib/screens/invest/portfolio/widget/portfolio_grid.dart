import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stocodi_app/model/portfolio/portfolio_data.dart';
import '../../../transaction/screens/transcation_main.dart';
import '../../screens/holding_items.dart';
import '../../transaction_log.dart';
import '../item/grid_item.dart';
import 'grid_common.dart';
import 'grid_transaction_history.dart';

class PortfolioGrid extends StatelessWidget {
  const PortfolioGrid({super.key});

  int calThisMonth_Transcation(PortfolioData newData) {
    // 현재 날짜
    DateTime currentDate = DateTime.now();
    // 현재 월
    int currentMonth = currentDate.month;
    // 동일한 월의 거래 개수를 세기 위한 카운터
    int transactionsInCurrentMonth = 0;

    // 현재 월과 동일한 월의 거래 개수 계산
    for (var history in newData.selectedPortfolio.histories) {
      if (history.transaction_date.month == currentMonth) {
        transactionsInCurrentMonth += history.quantity;
      }
    }

    return transactionsInCurrentMonth;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PortfolioData>(
      builder: (context, portfolioData, _) {
        return SizedBox(
          width: double.infinity,
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (164 / 178),
            crossAxisSpacing: 14, // 가로 간격 14로 설정
            mainAxisSpacing: 14, // 세로 간격 14로 설정
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              GridItem(
                context: context,
                title: "보유종목",
                childWidget: GridCommon(title: '보유종목', image: 'grid1'),
                destinationPage: HoldingItem(),
              ),
              GridItem(
                context: context,
                title: "거래내역",
                childWidget: GridTransactionHistory(
                    reservation: 2,
                    thisMonth: calThisMonth_Transcation(portfolioData)),
                destinationPage: TransactionMain(),
              ),
              GridItem(
                context: context,
                title: "거래일지",
                childWidget: GridCommon(title: '거래일지', image: 'grid3'),
                destinationPage: TransactionLog(),
              ),
              GridItem(
                context: context,
                title: "배당금",
                childWidget: GridCommon(title: '배당금', image: 'grid4'),
                destinationPage: null,
              ),
            ],
          ),
        );
      },
    );
  }
}
