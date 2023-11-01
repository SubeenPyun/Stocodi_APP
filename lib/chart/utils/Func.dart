import '../data/ChartData.dart';

List<num> getMinMax(List<ChartData> data) {
  if (data.isEmpty) {
    return [0, 0];  // 데이터가 비어있을 경우 기본값을 반환
  }

  num min = data[0].low ?? double.infinity;  // 초기값을 무한대로 설정
  num max = data[0].high ?? double.negativeInfinity; // 초기값을 음의 무한대로 설정

  for (final item in data) {
    if (item.low != null && item.low! < min) {
      min = item.low!;  // 최솟값 갱신
    }
    if (item.high != null && item.high! > max) {
      max = item.high!;  // 최댓값 갱신
    }
  }

  return [min, max];
}