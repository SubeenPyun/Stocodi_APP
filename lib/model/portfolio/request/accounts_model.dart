import 'package:json_annotation/json_annotation.dart';
part 'accounts_model.g.dart';

@JsonSerializable()
class PortfolioRequest {
  final String account_name;
  final int initial_cash;

  PortfolioRequest({
    required this.account_name,
    required this.initial_cash,
  });

  Map<String, dynamic> toJson() => _$PortfolioRequestToJson(this);

  factory PortfolioRequest.fromJson(Map<String, dynamic> json) {
    return PortfolioRequest(
      account_name: json["account_name"] as String,
      initial_cash: json["initial_cash"] as int,
    );
  }
}
