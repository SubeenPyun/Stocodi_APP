import 'package:flutter/material.dart';
import 'package:stocodi_app/invest/portfolio/item/grid_item.dart';
import 'package:stocodi_app/invest/portfolio/widget/grid_common.dart';
import 'package:stocodi_app/invest/portfolio/widget/grid_transaction_history.dart';

import '../../transaction_log.dart';

class PortfolioGrid extends StatelessWidget{
  const PortfolioGrid({super.key});

  @override
  Widget build(BuildContext context) {
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
          GridItem(context: context, title: "보유종목", childWidget: GridCommon(title: '보유종목',image: 'grid1'), destinationPage: null,),
          GridItem(context: context, title: "거래내역", childWidget: GridTransactionHistory(reservation: 2,thisMonth: 32), destinationPage: null,),
          GridItem(context: context, title: "거래일지", childWidget: GridCommon(title: '거래일지',image: 'grid3'), destinationPage: TransactionLog(),),
          GridItem(context: context, title: "배당금", childWidget: GridCommon(title: '배당금',image: 'grid4'), destinationPage: null,),
        ],
      ),
    );
  }

}
