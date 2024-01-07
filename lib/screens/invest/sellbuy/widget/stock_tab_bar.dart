import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/invest/sellbuy/widget/price_column_list.dart';
import '../../../chart/widget/Chart.dart';

class StockTabBar extends StatefulWidget {
  final double currentPrice;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const StockTabBar({
    Key? key,
    required this.currentPrice,
    this.scaffoldKey,
  }) : super(key: key);

  @override
  _StockTabBarState createState() => _StockTabBarState();
}

class _StockTabBarState extends State<StockTabBar> with SingleTickerProviderStateMixin {
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
    return Expanded(
      child: MaterialApp(
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize:
              const Size.fromHeight(kToolbarHeight),
            child: Container(
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                labelStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                indicatorColor: Colors.black, // 선택된 탭의 밑줄 색상
                indicatorWeight: 3.0, // 선택된 탭의 밑줄 두께
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(height:39, text: '차트'),
                  Tab(height:39, text: '호가'),
                ],
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              Chart(), // 차트 탭에 해당하는 위젯
              PriceColumnList(currentPrice: widget.currentPrice, scaffoldKey: widget.scaffoldKey,), // 호가 탭에 해당하는 위젯
            ],
          ),
        ),
      ),
    );
  }
}