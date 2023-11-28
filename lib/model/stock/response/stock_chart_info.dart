import 'package:json_annotation/json_annotation.dart';

part 'stock_chart_info.g.dart';

@JsonSerializable()
class StockChartInfo {
  final String stock_name;
  final int first_price;
  final int high_price;
  final int low_price;
  final int last_price;
  final int volume;
  final int trading_value;
  final double fluctuation_rate;

  StockChartInfo(
      this.stock_name,
      this.first_price,
      this.high_price,
      this.low_price,
      this.last_price,
      this.volume,
      this.trading_value,
      this.fluctuation_rate);

  Map<String, dynamic> toJson() => _$StockChartInfoToJson(this);

  factory StockChartInfo.fromJson(Map<String, dynamic> json) =>
      _$StockChartInfoFromJson(json);
}

