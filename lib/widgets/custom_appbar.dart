import 'package:flutter/material.dart';
import '../screens/invest/invest_experiment.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isSub;
  final double preferredHeight;
  final String title;
  final VoidCallback? onSearchPressed;
  final bool showSearchIcon; // 아이콘 버튼을 표시할지 여부를 나타내는 속성

  CustomAppBar({
    Key? key,
    this.isSub = false,
    required this.preferredHeight,
    required this.title,
    this.onSearchPressed,
    this.showSearchIcon = false, // 기본값은 false로 설정
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: !isSub ? false : true,
      iconTheme: IconThemeData(size: 30, color: Colors.black),
      toolbarHeight: preferredHeight,
      title: Text(
        title,
        style: theme.textTheme.titleLarge,
      ),
      backgroundColor: theme.canvasColor,
      elevation: 0.0,
      titleSpacing: !isSub ? 24 : 5,
      actions: [
        if (showSearchIcon && onSearchPressed != null)
          IconButton(
            iconSize: 30,
            onPressed: onSearchPressed,
            icon: Icon(Icons.search), // Search 아이콘 버튼
            color: Colors.black,
          ),
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: IconButton(
            iconSize: 30,
            onPressed: () {
              // 기본 아이콘 버튼 클릭 시 수행할 작업
            },
            icon: Icon(Icons.menu), // 기본 아이콘 버튼
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);
}
