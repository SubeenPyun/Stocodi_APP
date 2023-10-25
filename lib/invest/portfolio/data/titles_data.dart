import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stocodi_app/theme/app_theme.dart';

FlTitlesData TitlesData(double touchedValue) {
  return FlTitlesData(
    show: true,
    topTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
      ),
    ),
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 30,
        getTitlesWidget: (value, meta) => _buildBottomTitleWidget(value, meta, touchedValue),
        interval: 1,
      ),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
      ),
    ),
    rightTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
      ),
    ),
  );
}

Widget _buildBottomTitleWidget(double value, TitleMeta meta, double touchedValue) {
  final isTouched = value == touchedValue;
  final theme = AppTheme.appTheme;
  final style = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: isTouched ? theme.primaryColor : const Color(0xffB1CAC8),
  );

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: Text(
      '${value.toInt() + 3}월',
      style: style,
    ),
  );
}
