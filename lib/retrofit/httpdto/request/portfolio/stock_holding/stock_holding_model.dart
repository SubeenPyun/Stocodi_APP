import 'package:json_annotation/json_annotation.dart';
part 'stock_holding_model.g.dart';

@JsonSerializable()
class StockHoldingModel {
  final String stock_name;
  final int stock_valuation;
  final double stock_valuation_rate;

  StockHoldingModel(this.stock_name, this.stock_valuation,
      this.stock_valuation_rate);

  Map<String, dynamic> toJson() => _$StockHoldingModelToJson(this);

  factory StockHoldingModel.fromJson(Map<String, dynamic> json) {
    return _$StockHoldingModelFromJson(json);
  }
}
