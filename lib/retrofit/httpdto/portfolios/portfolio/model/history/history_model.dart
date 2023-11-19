import 'package:json_annotation/json_annotation.dart';

import 'transaction_type.dart';
part 'history_model.g.dart';

@JsonSerializable()
class HistoryModel {
  final String stock_name;
  final DateTime transaction_date;
  final TransactionType transaction_type; // PURCHASE(매수) OR SELL(매도)
  final int price;
  final int quantity;


  HistoryModel(this.stock_name, this.transaction_date, this.transaction_type,
      this.price, this.quantity);

  Map<String, dynamic> toJson() => _$HistoryModelToJson(this);

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return _$HistoryModelFromJson(json);
  }
}
