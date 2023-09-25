import 'package:flutter/material.dart';


class TransactionLog extends StatefulWidget{
  const TransactionLog({Key? key}) : super(key: key);

  @override
  _TransactionLogState createState() => _TransactionLogState();
}

class _TransactionLogState extends State<TransactionLog> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('삼성전자'),
      ),
    );
  }
}
