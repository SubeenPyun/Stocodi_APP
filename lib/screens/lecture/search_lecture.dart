import 'package:flutter/material.dart';
import '../../../../theme/app_theme.dart';
import 'package:stocodi_app/screens/lecture/widget/realtime_popularity.dart';
import 'package:stocodi_app/screens/lecture/widget/search_recent.dart';
import 'package:stocodi_app/screens/lecture/widget/search_window.dart';

final ThemeData theme = AppTheme.appTheme;

class SearchLecture extends StatelessWidget {
  final Function onReturnFromLecture;

  const SearchLecture({
    super.key,
    required this.onReturnFromLecture
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SearchWindow(onReturnFromLecture: onReturnFromLecture,),
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
