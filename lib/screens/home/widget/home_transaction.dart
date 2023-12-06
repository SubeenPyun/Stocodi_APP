import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stocodi_app/model/portfolio/portfolio_data.dart';
import 'package:stocodi_app/screens/transaction/screens/transcation_main.dart';

class HomeTransaction extends StatefulWidget {
  const HomeTransaction({super.key});

  @override
  State<HomeTransaction> createState() => _HomeTransactionState();
}

class _HomeTransactionState extends State<HomeTransaction> {
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
              builder: (context) => TransactionMain(),
            ),
          );
        },
        child: Text(
          '거래내역 보기',
          style: TextStyle(fontSize: 16, color: Color(0xFF0ECB81)),
        ),
      ),
    );
  }
}
