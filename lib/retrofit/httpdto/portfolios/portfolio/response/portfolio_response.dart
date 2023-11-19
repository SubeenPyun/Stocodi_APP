import 'package:json_annotation/json_annotation.dart';
import '../model/account/account_model.dart';
import '../model/history/history_model.dart';
import '../model/stock_holding/stock_holding_model.dart';
import '../model/stock_holding/stock_holding_rate_model.dart';
part 'portfolio_response.g.dart';

@JsonSerializable()
class PortfoiloResponse {
  final AccountModel account; // 자산
  final List<HistoryModel> histories; // 최근 거래 기록
  final List<StockHoldingModel> stock_holdings; // 보유 종목
  final List<StockHoldingRateModel> stock_holding_rates; // 보유 종목 등락

  PortfoiloResponse(this.account, this.histories, this.stock_holdings,
      this.stock_holding_rates);

  Map<String, dynamic> toJson() => _$PortfoiloResponseToJson(this);

  factory PortfoiloResponse.fromJson(Map<String, dynamic> json) {
    return _$PortfoiloResponseFromJson(json);
  }
}
