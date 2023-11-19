import 'package:json_annotation/json_annotation.dart';
part 'account_request.g.dart';

@JsonSerializable()
class AccountRequest {
  final String account_name; // 계좌 이름
  final int initial_cash; // 시작 금액

  AccountRequest({
    required this.account_name,
    required this.initial_cash,
  });

  Map<String, dynamic> toJson() => _$AccountRequestToJson(this);

  factory AccountRequest.fromJson(Map<String, dynamic> json) {
    return _$AccountRequestFromJson(json);
  }
}
