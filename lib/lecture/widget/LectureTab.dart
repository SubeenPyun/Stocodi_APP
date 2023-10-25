import 'package:flutter/material.dart';
import 'package:stocodi_app/lecture/widget/Comment.dart';
import 'package:stocodi_app/lecture/widget/NextVideo.dart';
import 'package:stocodi_app/theme/TabTheme.dart';

void main() {
  runApp(const LectureTab());
}

final theme = AppTheme.getAppTheme();
final textTheme = AppTheme.getAppTheme().textTheme;

class LectureTab extends StatefulWidget {
  const LectureTab({Key? key}) : super(key: key);

  @override
  _LectureTabState createState() => _LectureTabState();
}

class _LectureTabState extends State<LectureTab> with SingleTickerProviderStateMixin {
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
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight), // Set the height to 0.0
          child: Container(
            color: theme.backgroundColor,
            child: TabBar(
              controller: _tabController,
              indicatorColor: theme.primaryColor, // 선택된 탭의 밑줄 색상
              indicatorWeight: 3.0, // 선택된 탭의 밑줄 두께
              indicatorSize: TabBarIndicatorSize.label,
              /*labelColor: theme.primaryColor,
              unselectedLabelColor: theme.unselectedWidgetColor,*/
              tabs: [
                Tab(
                  child: TabItem(text: '댓글', count: '999', isSelected: _tabController.index == 0),
                ),
                Tab(
                  child: Text('다음 동영상', style: textTheme.displayMedium?.copyWith(
                      color: _tabController.index == 0 ? theme.unselectedWidgetColor : theme.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            Comment(),
            NextVideo(),
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
      mainAxisSize: MainAxisSize.min, // Row 크기를 자식 위젯 크기에 맞게 조절
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: textTheme.displayLarge?.copyWith(
            color: isSelected ? theme.primaryColor : theme.unselectedWidgetColor,
          ),
        ),
        Container(
          width: 40.0,
          height: 26.0,
          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          decoration: BoxDecoration(
            color: isSelected ? theme.canvasColor : const Color(0xFFF5F7F9),
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Center( // Center 위젯을 이 위치로 이동
            child: Text(count, style: textTheme.displaySmall?.copyWith(
              color: isSelected ? theme.primaryColor : theme.unselectedWidgetColor,
            ),
            ),
          ),
        ),
      ],
    );
  }
}
