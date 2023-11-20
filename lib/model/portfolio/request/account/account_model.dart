import 'package:json_annotation/json_annotation.dart';
part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  final String account_name;
  final int total_asset_evaluation; // 총 평가 자산 = 보유 현금 + 주식 평가금
  final double cumulative_returns; // 누적 수익률 = 총 평가 자산 x 100 / 초기 자산
  final int remain_cash; // 보유 현금
  final int unrealized_gain; // 평가 수익금 = 평가 자산(총 평가 자산) 대비 초기 자산
  final int stock_valuation; // 주식 평가금


  AccountModel(
      this.account_name,
      this.total_asset_evaluation,
      this.cumulative_returns,
      this.remain_cash,
      this.unrealized_gain,
      this.stock_valuation);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return _$AccountModelFromJson(json);
  }
}
