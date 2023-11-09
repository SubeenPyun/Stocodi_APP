import 'package:json_annotation/json_annotation.dart';

// 터미널 명령어 -> flutter pub run build_runner build
part 'change_stock.g.dart'; // 현재 파일 이름과 같아야 함!!!

@JsonSerializable()
class ChangeStock {
  final String stock_name;

  ChangeStock(this.stock_name);

  Map<String, dynamic> toJson() => _$ChangeStockToJson(this);

  // JSON 역직렬화를 위한 팩토리 생성자
  factory ChangeStock.fromJson(Map<String, dynamic> json) =>
      _$ChangeStockFromJson(json);
}

