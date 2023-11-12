import 'package:json_annotation/json_annotation.dart';

part 'portfolios_model.g.dart';

@JsonSerializable()
class AccountResponse {
  final String account_name;
  final int total_asset_evaluation;
  final double cumulative_returns;
  final int remain_cash;
  final int unrealized_gain;
  final int stock_valuation;

  AccountResponse({
    required this.account_name,
    required this.total_asset_evaluation,
    required this.cumulative_returns,
    required this.remain_cash,
    required this.unrealized_gain,
    required this.stock_valuation,
  });

  factory AccountResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AccountResponseToJson(this);
}

@JsonSerializable()
class PortfolioHistoryResponse {
  // Define properties for PortfolioHistory based on the actual structure in your JSON
  // ...

  PortfolioHistoryResponse();

  factory PortfolioHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$PortfolioHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioHistoryResponseToJson(this);
}

@JsonSerializable()
class StockHoldingResponse {
  // Define properties for StockHolding based on the actual structure in your JSON
  // ...

  StockHoldingResponse();

  factory StockHoldingResponse.fromJson(Map<String, dynamic> json) =>
      _$StockHoldingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StockHoldingResponseToJson(this);
}

@JsonSerializable()
class GetPortfolioResponse {
  final AccountResponse account;
  final List<PortfolioHistoryResponse> histories;
  final List<StockHoldingResponse> stock_holdings;

  GetPortfolioResponse({
    required this.account,
    required this.histories,
    required this.stock_holdings,
  });

  factory GetPortfolioResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPortfolioResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPortfolioResponseToJson(this);
}
