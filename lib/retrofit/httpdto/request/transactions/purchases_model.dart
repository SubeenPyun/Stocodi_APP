import 'package:json_annotation/json_annotation.dart';
part 'purchases_model.g.dart';

@JsonSerializable()
class PurchasesRequest {
  final String account_name;
  final String stock_name;
  final int price;
  final int quantity;

  PurchasesRequest({
    required this.account_name,
    required this.stock_name,
    required this.price,
    required this.quantity,
  });

  factory PurchasesRequest.fromJson(Map<String, dynamic> json) {
    return PurchasesRequest(
      account_name: json["account_name"] as String,
      stock_name: json["stock_name"] as String,
      price: json["price"] as int,
      quantity: json["quantity"] as int,
    );
  }
}
