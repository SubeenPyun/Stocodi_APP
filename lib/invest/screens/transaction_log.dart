import 'package:flutter/material.dart';

import '../../styles/widget/custom_appbar.dart';


class TransactionLog extends StatefulWidget{
  const TransactionLog({Key? key}) : super(key: key);

  @override
  _TransactionLogState createState() => _TransactionLogState();
}

class _TransactionLogState extends State<TransactionLog> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        preferredHeight: 64,
        title: "거래일지",
        onSearchPressed: (){},
        showSearchIcon: false, // searchIcon 안 보이게
      ),
    );
  }
}
