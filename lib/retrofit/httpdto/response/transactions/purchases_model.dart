import 'package:json_annotation/json_annotation.dart';
part 'purchases_model.g.dart';

@JsonSerializable()
class PurchasesResponse {
  final String account_name;
  final int remain_cash;
  final int total_price;
  final int total_quantity;

  PurchasesResponse({
    required this.account_name,
    required this.remain_cash,
    required this.total_price,
    required this.total_quantity,
  });

  factory PurchasesResponse.fromJson(Map<String, dynamic> json) {
    return PurchasesResponse(
      account_name: json["account_name"] as String,
      remain_cash: json["remain_cash"] as int,
      total_price: json["total_price"] as int,
      total_quantity: json["total_quantity"] as int,
    );
  }
}
