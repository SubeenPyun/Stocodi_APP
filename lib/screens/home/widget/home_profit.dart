import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/home/widget/home_manage.dart';
import 'package:stocodi_app/screens/home/widget/home_transaction.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeProfit extends StatefulWidget {
  HomeProfit({super.key});

  @override
  State<HomeProfit> createState() => _HomeProfitState();
}

class _HomeProfitState extends State<HomeProfit> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  List<Color> color = <Color>[];
  List<double> stops = <double>[];
  LinearGradient gradientColors = LinearGradient(colors: [], stops: []);

  @override
  void initState() {
    data = [
      _ChartData('CHN', 12),
      _ChartData('GER', 15),
      _ChartData('RUS', 30),
      _ChartData('BRZ', 6.4),
      _ChartData('IND', 14),
      _ChartData('a', 15),
      _ChartData('b', 15),
      _ChartData('c', 15),
      _ChartData('d', 15),
      _ChartData('e', 15),
      _ChartData('f', 15),
      _ChartData('g', 15),
    ];

    color.add(Color(0xFF0ECB81).withOpacity(0));
    color.add(Color(0xFF0ECB81).withOpacity(0.1));
    color.add(Color(0xFF0ECB81).withOpacity(0.3));

    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    gradientColors = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: color,
      stops: stops,
    );

    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      //height: MediaQuery.of(context).size.height - 450,
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "수익률 통계",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Image.asset('assets/images/next.png')
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 25),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Image.asset(
                    'assets/images/stocodilogo.png',
                    width: 24.58,
                  ),
                ),
                Text(
                  '초록증권 ',
                  style: TextStyle(fontSize: 15),
                ),
                Text('123-2314-2341', style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          //그래프자리
          AspectRatio(
            aspectRatio: 1.0 / 0.6,
            child: SfCartesianChart(
                enableAxisAnimation: true,
                plotAreaBorderWidth: 0,
                primaryXAxis: CategoryAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  minorGridLines: MinorGridLines(width: 0),
                ),
                primaryYAxis: NumericAxis(
                  minimum: 0,
                  maximum: 30,
                  interval: 10,
                  majorGridLines: MajorGridLines(width: 0),
                  minorGridLines: MinorGridLines(width: 0),
                ),
                zoomPanBehavior: ZoomPanBehavior(
                  enablePanning: true,
                ),
                tooltipBehavior: _tooltip,
                series: <ChartSeries<_ChartData, String>>[
                  AreaSeries<_ChartData, String>(
                    borderColor: Color(0xFF0ECB81),
                    borderWidth: 2,
                    dataSource: data,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    gradient: gradientColors,
                  )
                ]),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 6),
                  child: HomeManage(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: HomeTransaction(),
                ),
              ),
            ],
          ),
          //강의목록
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
