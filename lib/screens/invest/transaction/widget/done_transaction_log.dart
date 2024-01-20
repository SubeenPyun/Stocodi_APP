import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stocodi_app/model/portfolio/request/history/transaction_type.dart';
import 'package:stocodi_app/model/portfolio/portfolio_data.dart';
import '../item/done_transaction_item.dart';

class DoneTransactionLog extends StatelessWidget {
  const DoneTransactionLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PortfolioData>(
      builder: (context, portfolioData, _) {
        var historyList = portfolioData.selectedPortfolio.histories;
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 13,
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(), // 스크롤을 막음
                  itemCount: historyList.length,
                  itemBuilder: (context, index) {
                    var history = historyList[index];
                    return DoneItem(
                      perPrice: history.price,
                      stock: history.stock_name,
                      day: history.transaction_date.toString(),
                      buy: history.transaction_type == TransactionType.PURCHASE
                          ? 1
                          : 0,
                      howmuch: history.quantity,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
