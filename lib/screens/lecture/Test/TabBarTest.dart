import 'package:flutter/material.dart';
import '../../../theme/AppTheme.dart';

void main() {
  runApp(const TabBarDemo());
}

final theme = AppTheme.getAppTheme();
final textTheme = AppTheme.getAppTheme().textTheme;
class TabBarDemo extends StatefulWidget {
  const TabBarDemo({super.key});
  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState((){});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            /*labelColor: theme.primaryColor,
            unselectedLabelColor: theme.unselectedWidgetColor,*/
            tabs: [
              Tab(
                child: TabItem(text: '댓글', count: '999', isSelected: _tabController.index == 0),
              ),
              Tab(
                child:  Text(
                  '다음 동영상',
                  style: textTheme.displayMedium?.copyWith(
                    color: _tabController.index == 0 ? theme.unselectedWidgetColor : theme.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: theme.backgroundColor,
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Icon(Icons.flight, size: 50),
            Icon(Icons.directions_transit, size: 350),
          ],
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String text;
  final String count;
  final bool isSelected;

  const TabItem({
    super.key,
    required this.text,
    required this.count,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: textTheme.displayLarge?.copyWith(
            color: isSelected ? theme.primaryColor : theme.unselectedWidgetColor,
          ),
        ),
        Container(
          width: 40.0,
          height: 26.0,
          padding: const EdgeInsets.fromLTRB(7.0, 2.0, 7.0, 2.0),
          margin: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
          decoration: BoxDecoration(
            color: isSelected ? theme.canvasColor : const Color(0xFFF5F7F9),
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Text(
            count,
            style: textTheme.displaySmall?.copyWith(
              color: isSelected ? theme.primaryColor : theme.unselectedWidgetColor,
            ),
          ),
        ),
      ],
    );
  }
}
