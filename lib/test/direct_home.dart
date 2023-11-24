import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:stocodi_app/screens/tmp/tmp_mypage.dart';
import '../screens/home/home.dart';
import '../screens/invest/invest_experiment.dart';
import '../screens/lecture/classroom.dart';
import '../theme/app_theme.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(ScreenTest()));
}

class ScreenTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScreenTest',
      home: AppScreen(),
    );
  }
}

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  ThemeData theme = AppTheme.appTheme;

  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
  }

  final List<Widget> _pages = [
    Home(),
    const ClassRoom(),
    const InvestExperiment(),
    Container(),
    Tmpmypage(),
  ];

  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 1),
        child: Image.asset(
          "assets/icon/${iconName}_off.png",
          width: 32,
          fit: BoxFit.fill,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 1),
        child: Image.asset(
          "assets/icon/${iconName}_on.png",
          width: 32,
          fit: BoxFit.fill,
        ),
      ),
      label: label,
    );
  }

  Widget _bottomNavigationBarwidget() {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(
        color: Colors.black,
      ),
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        //print(index);
        setState(() {
          _currentPageIndex = index;
        });
      },
      currentIndex: _currentPageIndex,
      items: [
        _bottomNavigationBarItem("home", "홈"),
        _bottomNavigationBarItem("lecture", "강의"),
        _bottomNavigationBarItem("invest", "투자실험"),
        _bottomNavigationBarItem("column", "칼럼"),
        _bottomNavigationBarItem("more", "더보기"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: _pages[_currentPageIndex],
      bottomNavigationBar: _bottomNavigationBarwidget(),
    );
  }
}
