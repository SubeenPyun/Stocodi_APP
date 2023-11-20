import 'package:json_annotation/json_annotation.dart';

part 'stock_rank.g.dart';

@JsonSerializable()
class StockRank {
  final int rank;
  final String stock_code;
  final String stock_name;
  final int current_price;
  final int volume;

  StockRank(this.rank, this.stock_code, this.stock_name, this.current_price,
      this.volume);

  Map<String, dynamic> toJson() => _$StockRankToJson(this);

  factory StockRank.fromJson(Map<String, dynamic> json) =>
      _$StockRankFromJson(json);
}

