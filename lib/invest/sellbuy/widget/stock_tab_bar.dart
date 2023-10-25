import 'package:flutter/material.dart';

class StockTabBar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: '차트'),
                Tab(text: '호가'),
              ],
            ),
            TabBarView(
              children: [
                Container(color: Colors.blue,), // 차트 탭에 해당하는 위젯
                Container(color: Colors.yellow,), // 호가 탭에 해당하는 위젯
              ],
            ),
          ],
        ),
      ),
    );
  }
}
