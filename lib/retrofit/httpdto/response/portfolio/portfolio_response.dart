import 'package:json_annotation/json_annotation.dart';
import '../../request/portfolio/account/account_model.dart';
import '../../request/portfolio/history/history_model.dart';
import '../../request/portfolio/stock_holding/stock_holding_model.dart';
import '../../request/portfolio/stock_holding/stock_holding_rate_model.dart';
part "portfolio_response.g.dart";

@JsonSerializable()
class PortfoiloResponse {
  final AccountModel account; // 자산
  final List<HistoryModel> histories; // 최근 거래 기록
  final List<StockHoldingModel> stock_holdings; // 보유 종목
  final List<StockHoldingRateModel>? stock_holding_rates; // 보유 종목 등락

  PortfoiloResponse({
    required this.account,
    required this.histories,
    required this.stock_holdings,
    this.stock_holding_rates,
  });

  factory PortfoiloResponse.fromJson(Map<String, dynamic> json) {
    var account = AccountModel.fromJson(json['account']);
    var histories = (json['histories'] as List)
        .map((history) => HistoryModel.fromJson(history))
        .toList();
    var stockHoldings = (json['stock_holdings'] as List)
        .map((holding) => StockHoldingModel.fromJson(holding))
        .toList();
    var stockHoldingRates = (json['stock_holding_rates'] as List?)
        ?.map(
          (rate) => StockHoldingRateModel.fromJson(rate),
        )
        .toList();

    return PortfoiloResponse(
      account: account,
      histories: histories,
      stock_holdings: stockHoldings,
      stock_holding_rates: stockHoldingRates,
    );
  }
}
