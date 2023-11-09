import 'package:json_annotation/json_annotation.dart';

// 터미널 명령어 -> flutter pub run build_runner build
part 'stock_chart_info.g.dart'; // 현재 파일 이름과 같아야 함!!!

@JsonSerializable()
class StockChartInfo {
  final String stockName;
  final int firstPrice;
  final int highPrice;
  final int lowPrice;
  final int lastPrice;
  final int volume;
  final int tradingValue;
  final double fluctuationRate;


  StockChartInfo(this.stockName, this.firstPrice, this.highPrice, this.lowPrice,
      this.lastPrice, this.volume, this.tradingValue, this.fluctuationRate);

  Map<String, dynamic> toJson() => _$StockChartInfoToJson(this);

  // JSON 역직렬화를 위한 팩토리 생성자
  factory StockChartInfo.fromJson(Map<String, dynamic> json) =>
      _$StockChartInfoFromJson(json);
}

