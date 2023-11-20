import 'package:flutter/material.dart';
import '../../../../theme/app_theme.dart';

class StockCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double preferredHeight;
  final String title;
  final VoidCallback? onPressed;

  StockCustomAppBar({
    Key? key,
    required this.preferredHeight,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = AppTheme.appTheme;

    return AppBar(
      automaticallyImplyLeading: true,
      iconTheme: IconThemeData(
        size: 30,
        color: Colors.black
      ),
      toolbarHeight: preferredHeight,
      title: Text(
        title,
        style: theme.textTheme.titleMedium,
      ),
      backgroundColor: theme.backgroundColor,
      elevation: 0.0,
      actions: [
        IconButton(
          iconSize: 32,
          onPressed: onPressed,
          icon: Icon(
            Icons.favorite,
            color: theme.primaryColor,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);
}
