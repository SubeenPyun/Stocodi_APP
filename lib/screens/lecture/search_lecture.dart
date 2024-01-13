import 'package:flutter/material.dart';
import '../../../../theme/app_theme.dart';
import 'package:stocodi_app/screens/lecture/widget/realtime_popularity.dart';
import 'package:stocodi_app/screens/lecture/widget/search_recent.dart';
import 'package:stocodi_app/screens/lecture/widget/search_window.dart';

final ThemeData theme = AppTheme.appTheme;

class SearchLecture extends StatelessWidget {
  const SearchLecture({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SearchWindow(),
              SearchRecent(),
              SizedBox(
                height: 12,
                width: screenWidth,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F3F4),
                  ),
                ),
              ),
              RealtimePopularity(),
            ],
          ),
        ),
      ),
    );
  }
}
