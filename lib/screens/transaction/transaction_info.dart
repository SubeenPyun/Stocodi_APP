import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/transaction/widget/done_transaction_log.dart';
import 'package:stocodi_app/screens/transaction/widget/reservation_log.dart';
import 'package:stocodi_app/theme/transaction_theme.dart';

final theme = TransactionTheme.appTheme;

class TransactionInfo extends StatefulWidget {
  const TransactionInfo({Key? key}) : super(key: key);

  @override
  _TransactionInfoState createState() => _TransactionInfoState();
}

class _TransactionInfoState extends State<TransactionInfo>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(kToolbarHeight), // Set the height to 0.0
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: TabBar(
            controller: _tabController,
            indicatorColor: theme.primaryColor, // 선택된 탭의 밑줄 색상
            indicatorWeight: 3.0, // 선택된 탭의 밑줄 두께
            indicatorSize: TabBarIndicatorSize.tab,
            /*labelColor: theme.primaryColor,
              unselectedLabelColor: theme.unselectedWidgetColor,*/
            tabs: [
              Tab(
                child: TabItem(
                    text: '예약일지', isSelected: _tabController.index == 0),
              ),
              Tab(
                child: Text(
                  '거래완료',
                  style: _tabController.index == 0
                      ? theme.textTheme.displayMedium
                      : theme.textTheme.displayLarge,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xffF5F5F5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: TabBarView(
          controller: _tabController,
          children: [
            ReservationLog(),
            DoneTransactionLog(),
          ],
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String text;
  final bool isSelected;

  const TabItem({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // Row 크기를 자식 위젯 크기에 맞게 조절
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: theme.textTheme.displayLarge?.copyWith(
            color:
                isSelected ? theme.primaryColor : theme.unselectedWidgetColor,
          ),
        ),
      ],
    );
  }
}
