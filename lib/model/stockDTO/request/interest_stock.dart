import 'package:json_annotation/json_annotation.dart';

// 터미널 명령어 -> flutter pub run build_runner build
part 'interest_stock.g.dart'; // 현재 파일 이름과 같아야 함!!!

@JsonSerializable()
class InterestStock {
  final String email;
  final String stockCode;

  InterestStock(this.email, this.stockCode);

  Map<String, dynamic> toJson() => _$InterestStockToJson(this);

  // JSON 역직렬화를 위한 팩토리 생성자
  factory InterestStock.fromJson(Map<String, dynamic> json) =>
      _$InterestStockFromJson(json);
}

