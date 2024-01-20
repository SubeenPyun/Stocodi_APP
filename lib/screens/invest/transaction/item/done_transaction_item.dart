import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stocodi_app/theme/transaction_theme.dart';

class DoneItem extends StatelessWidget {
  final theme = TransactionTheme.appTheme;
  final int perPrice;
  final String stock;
  final String day;
  final int buy;
  final int howmuch;
  final NumberFormat f;

  DoneItem({
    super.key,
    required this.howmuch, //7주
    required this.day, //9월 11일
    required this.stock, // 애플
    required this.perPrice, //240000
    required this.buy, //매수했다면 1, 매도했다면 0
  }) : f = NumberFormat('###,###,###,###');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              SizedBox(
                width: 1,
                //width: MediaQuery.of(context).size.width * 0.003,
              ),
              Text(
                day,
                style: theme.textTheme.titleSmall,
              ),
            ],
          ),
          SizedBox(
            height: 12,
            //height: MediaQuery.of(context).size.height * 0.15,
          ),
          Row(
            //----
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //네모 두개 양 옆으로 펼쳐져
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stock,
                        style: theme.textTheme.titleLarge,
                      ),
                      Text(
                        "${f.format(perPrice)}원",
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            "$howmuch주",
                            style: theme.textTheme.labelLarge,
                          ),
                          SizedBox(
                            width: 2,
                            //width: MediaQuery.of(context).size.width * 0.006,
                          ),
                          Text(
                            buy == 1 ? "매수" : "매도",
                            style: theme.textTheme.labelLarge,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                        //height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "${f.format(perPrice * howmuch)}원",
                        style: buy == 1
                            ? theme.textTheme.labelMedium
                            : theme.textTheme.labelSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
