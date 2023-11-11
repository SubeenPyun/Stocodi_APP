// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolios_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountResponse _$AccountResponseFromJson(Map<String, dynamic> json) =>
    AccountResponse(
      account_name: json['account_name'] as String,
      total_asset_evaluation: json['total_asset_evaluation'] as int,
      cumulative_returns: (json['cumulative_returns'] as num).toDouble(),
      remain_cash: json['remain_cash'] as int,
      unrealized_gain: json['unrealized_gain'] as int,
      stock_valuation: json['stock_valuation'] as int,
    );

Map<String, dynamic> _$AccountResponseToJson(AccountResponse instance) =>
    <String, dynamic>{
      'account_name': instance.account_name,
      'total_asset_evaluation': instance.total_asset_evaluation,
      'cumulative_returns': instance.cumulative_returns,
      'remain_cash': instance.remain_cash,
      'unrealized_gain': instance.unrealized_gain,
      'stock_valuation': instance.stock_valuation,
    };

PortfolioHistoryResponse _$PortfolioHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    PortfolioHistoryResponse();

Map<String, dynamic> _$PortfolioHistoryResponseToJson(
        PortfolioHistoryResponse instance) =>
    <String, dynamic>{};

StockHoldingResponse _$StockHoldingResponseFromJson(
        Map<String, dynamic> json) =>
    StockHoldingResponse();

Map<String, dynamic> _$StockHoldingResponseToJson(
        StockHoldingResponse instance) =>
    <String, dynamic>{};

GetPortfolioResponse _$GetPortfolioResponseFromJson(
        Map<String, dynamic> json) =>
    GetPortfolioResponse(
      account:
          AccountResponse.fromJson(json['account'] as Map<String, dynamic>),
      histories: (json['histories'] as List<dynamic>)
          .map((e) =>
              PortfolioHistoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      stock_holdings: (json['stock_holdings'] as List<dynamic>)
          .map((e) => StockHoldingResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPortfolioResponseToJson(
        GetPortfolioResponse instance) =>
    <String, dynamic>{
      'account': instance.account,
      'histories': instance.histories,
      'stock_holdings': instance.stock_holdings,
    };
