import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stocodi_app/screens/invest/portfolio.dart';
import 'package:stocodi_app/screens/invest/portfolio/data/portfolio_data.dart';

class HomeManage extends StatefulWidget {
  const HomeManage({super.key});

  @override
  State<HomeManage> createState() => _HomeManageState();
}

class _HomeManageState extends State<HomeManage> {
  late PortfolioData portfolioData;
  @override
  void initState() {
    portfolioData = Provider.of<PortfolioData>(context, listen: false);
    portfolioData.loadPortfolioData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      padding: EdgeInsets.all(17),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFFEDFFEF),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Portfolio(),
            ),
          );
        },
        child: Text(
          '포트폴리오 관리',
          style: TextStyle(fontSize: 16, color: Color(0xFF0ECB81)),
        ),
      ),
    );
  }
}
