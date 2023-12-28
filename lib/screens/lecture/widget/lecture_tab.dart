import 'package:flutter/material.dart';
import '../../../theme/AppTheme.dart';
import 'lecture_comment.dart';
import 'lecture_next_video.dart';

final theme = AppTheme.getAppTheme();
final textTheme = AppTheme.getAppTheme().textTheme;

class LectureTab extends StatefulWidget {
  final int lectureId;
  const LectureTab({
    Key? key, required this.lectureId}) : super(key: key);

  @override
  _LectureTabState createState() => _LectureTabState();
}

class _LectureTabState extends State<LectureTab>
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
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              const Size.fromHeight(kToolbarHeight), // Set the height to 0.0
          child: Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              indicatorColor: theme.primaryColor, // 선택된 탭의 밑줄 색상
              indicatorWeight: 3.0, // 선택된 탭의 밑줄 두께
              indicatorSize: TabBarIndicatorSize.label,
              /*labelColor: theme.primaryColor,
              unselectedLabelColor: theme.unselectedWidgetColor,*/
              tabs: [
                Tab(
                  child: TabItem(
                      text: '댓글',
                      count: '999',
                      isSelected: _tabController.index == 0),
                ),
                Tab(
                  child: Text(
                    '다음 동영상',
                    style: textTheme.displayLarge?.copyWith(
                      color: _tabController.index == 0
                          ? theme.unselectedWidgetColor
                          : theme.primaryColor,
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
            LectureComment(),
            LectureNextVideo(),
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isNarrowScreen = screenWidth < 600;
    final baseWidth = isNarrowScreen ? 40.0 : 40.0 * (screenWidth / 600); // 600보다 작을 때의 기본 너비 또는 비율에 따른 너비
    final baseHeight = isNarrowScreen ? 26.0 : 26.0 * (screenWidth / 600); // 600보다 작을 때의 기본 높이 또는 비율에 따른 높이

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: textTheme.displayLarge?.copyWith(
          color: isSelected ? theme.primaryColor : theme.unselectedWidgetColor,
        )),
        Container(
          width: baseWidth,
          height: baseHeight,
          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          decoration: BoxDecoration(
            color: isSelected ? theme.canvasColor : const Color(0xFFF5F7F9),
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Center(
            child: Text(count, style: textTheme.displaySmall?.copyWith(
              color: isSelected ? theme.primaryColor : theme.unselectedWidgetColor,
            )),
            
          ),
        ),
      ],
    );
  }
}

