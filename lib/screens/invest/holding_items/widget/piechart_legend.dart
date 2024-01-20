import 'package:flutter/material.dart';
import '../../../../theme/app_theme.dart';


class PieChartLegend extends StatelessWidget {
  ThemeData theme = AppTheme.appTheme;

  final String title;
  final Color color;
  final num value;
  final num total;

  PieChartLegend({
    required this.title,
    required this.color,
    required this.value,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: color,
          ),
          height: 10,
          width: 10,
          margin:EdgeInsets.all(10),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        Text(
          (value/total*100).toInt().toString()+"%",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Color(0xFF575E6B),
          ),
        ),
      ],
    );
  }
}
