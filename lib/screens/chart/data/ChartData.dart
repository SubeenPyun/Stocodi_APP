class ChartData {
  final DateTime x;
  final double open;
  late double high;
  late double low;
  final double close;
  final double volume;

  ChartData({
    required this.x,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
  });
}
