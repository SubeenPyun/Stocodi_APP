import 'package:flutter/material.dart';
import '../../../../theme/app_theme.dart';

class GridCommon extends StatelessWidget {
  final String title;
  final String image;
  ThemeData theme = AppTheme.appTheme;

  GridCommon({
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder:  (context, constraints) {
        double containerWidth = constraints.maxWidth;
        double imageWidth = containerWidth * 0.7; // 내부 이미지의 폭을 조절
        double arrowWidth = containerWidth * 0.17;

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Text(
                        title,
                        style: theme.textTheme.titleMedium,
                    )
                ),
                Container(
                  width: arrowWidth,
                  height: arrowWidth,
                  child: Image.asset('assets/images/arrow.png', color: theme.primaryColor),
                ),
              ],
            ),
            Container(
                width: imageWidth,
                height: imageWidth,
                child: Image.asset('assets/images/${image}.png', fit: BoxFit.fill),
            ),
          ],
        );
      }
    );
  }
}
