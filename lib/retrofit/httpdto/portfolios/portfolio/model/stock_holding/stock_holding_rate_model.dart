import 'package:json_annotation/json_annotation.dart';
part 'stock_holding_rate_model.g.dart';

@JsonSerializable()
class StockHoldingRateModel {

  StockHoldingRateModel();

  Map<String, dynamic> toJson() => _$StockHoldingRateModelToJson(this);

  factory StockHoldingRateModel.fromJson(Map<String, dynamic> json) {
    return _$StockHoldingRateModelFromJson(json);
  }
}
