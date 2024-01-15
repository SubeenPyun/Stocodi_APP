import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/invest/portfolio/widget/portfolio_bar_chart.dart';
import 'package:stocodi_app/screens/invest/portfolio/widget/portfolio_line_chart.dart';
import 'package:stocodi_app/theme/app_theme.dart';
import 'package:stocodi_app/widgets/round_square_container.dart';

class AssetSection extends StatefulWidget {
  ThemeData theme = AppTheme.appTheme;
  bool showEarnings;
  double touchedValue;

  AssetSection({required this.showEarnings, required this.touchedValue});

  @override
  _AssetSectionState createState() => _AssetSectionState();
}

class _AssetSectionState extends State<AssetSection> {

  Widget _buildCircularButton(String label, int value) {
    bool isSelected = widget.showEarnings ? (value == 0) : (value == 1);
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.showEarnings = value == 0;
        });
      },
      child: Container(
        width: 70,
        height: 34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isSelected ? Colors.white : widget.theme.canvasColor,
        ),
        child: Center(
          child: Text(
            label,
            style: widget.theme.textTheme.titleSmall?.copyWith(
              color: isSelected ? widget.theme.primaryColor : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RoundSquareContainer(
      width: double.infinity,
      height: 372,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "자산",
              style: widget.theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: widget.showEarnings
                ? EdgeInsets.only(left: 5, right: 5)
                : EdgeInsets.only(left: 0, right: 0),
            padding: widget.showEarnings
                ? EdgeInsets.all(7)
                : EdgeInsets.only(top: 7, bottom: 7),
            height: 222,
            child: widget.showEarnings
                ? PortfolioLineChart(touchedValue: widget.touchedValue)
                : PortfolioBarChart(touchedValue: widget.touchedValue), // 그래프가 보이지 않는 경우 빈 SizedBox 반환
          ),
          SizedBox(height: 30),
          Container(
            width: 146,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: widget.theme.canvasColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCircularButton("수익률", 0),
                _buildCircularButton("총액", 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
