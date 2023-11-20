import 'package:flutter/material.dart';

void main() {
  runApp(TabBarDemo2());
}

class TabBarDemo2 extends StatefulWidget {
  @override
  _TabBarDemo2State createState() => _TabBarDemo2State();
}

class _TabBarDemo2State extends State<TabBarDemo2> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Color indicatorColor1 = Colors.purple; // 탭 1의 인디케이터 색상
  Color indicatorColor2 = Colors.green; // 탭 2의 인디케이터 색상

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // 탭 변경 시 인디케이터 색상 업데이트
    _tabController.addListener(() {
      setState(() {
        if (_tabController.index == 0) {
          // 탭 1 선택 시
          indicatorColor1 = Colors.purple;
          indicatorColor2 = Colors.green;
        } else {
          // 탭 2 선택 시
          indicatorColor1 = Colors.red;
          indicatorColor2 = Colors.blue;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: '탭 1',
              ),
              Tab(
                text: '탭 2',
              ),
            ],
            indicator: BoxDecoration(
              // 인디케이터 스타일 설정
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Center(child: Text('내용 1')),
            Center(child: Text('내용 2')),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            tabs: [
              Tab(
                text: '탭 1',
                icon: Icon(
                  Icons.star,
                  color: indicatorColor1,
                ),
              ),
              Tab(
                text: '탭 2',
                icon: Icon(
                  Icons.favorite,
                  color: indicatorColor2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
