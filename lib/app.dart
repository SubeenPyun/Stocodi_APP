import 'package:flutter/material.dart';
import 'package:stocodi_app/invest/screens/invest_experiment.dart';
import 'package:stocodi_app/styles/theme/app_theme.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {

  ThemeData theme = AppTheme.appTheme;

  int _currentPageIndex = 0;

  void initState() {
    super.initState();
    _currentPageIndex = 0;
  }

  final List<Widget> _pages = [
    Container(),
    Container(),
    InvestExperiment(),
    Container(),
    Container(),
  ];

  BottomNavigationBarItem _bottomNavigationBarItem(String iconName, String label){
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Image.asset("assets/icon/${iconName}_off.png", width: 22),
      ),
      activeIcon:  Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Image.asset("assets/icon/${iconName}_on.png", width: 22),
      ),
      label: label,
    );
  }

  Widget _bottomNavigationBarwidget() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        //print(index);
        setState(() {
          _currentPageIndex = index;
        });
      },
      currentIndex: _currentPageIndex,
        items: [
          _bottomNavigationBarItem("home","홈"),
          _bottomNavigationBarItem("home","강의"),
          _bottomNavigationBarItem("home","투자실험"),
          _bottomNavigationBarItem("home","칼럼"),
          _bottomNavigationBarItem("home","더보기"),
        ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: _pages[_currentPageIndex],
      bottomNavigationBar: _bottomNavigationBarwidget(),
    );
  }
}
