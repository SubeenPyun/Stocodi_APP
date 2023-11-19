// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortfoiloResponse _$PortfoiloResponseFromJson(Map<String, dynamic> json) =>
    PortfoiloResponse(
      AccountModel.fromJson(json['account'] as Map<String, dynamic>),
      (json['histories'] as List<dynamic>)
          .map((e) => HistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['stock_holdings'] as List<dynamic>)
          .map((e) => StockHoldingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['stock_holding_rates'] as List<dynamic>)
          .map((e) => StockHoldingRateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PortfoiloResponseToJson(PortfoiloResponse instance) =>
    <String, dynamic>{
      'account': instance.account,
      'histories': instance.histories,
      'stock_holdings': instance.stock_holdings,
      'stock_holding_rates': instance.stock_holding_rates,
    };
