import 'package:flutter/material.dart';
import '../../../API/web_socket/stock_manager.dart';
import '../../../model/stock/response/stock.dart';

// void main() {
//   runApp(Search());
// }

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String stock_name = '';
  final TextEditingController _controller = TextEditingController();

  // Future<List<Stock>>? _stockListFuture; // Updated this line
  late List<Stock> stock_list;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text Input Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 110,
                    child: TextField(
                      controller: _controller,
                      autofocus: true,
                      cursorColor: Color(0xFF0ECB81),
                      decoration: InputDecoration(
                        prefixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? Color(0xFF0ECB81)
                                : Color(0xFFBEBEBE)),
                        labelText: "궁금한 주식을 검색해보세요!",
                        labelStyle:
                            TextStyle(color: Color(0xFFBDBDBD), fontSize: 14),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF0ECB81), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFEBEBEB), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      obscureText: false,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      stock_name = _controller.text;
                      // print("stock_name : " + stock_name.toString());

                      try {
                        final stockManager = StockManager();
                        final response =
                            await stockManager.getStockInfo(stock_name);
                        // print("getStockInfo response: $response");

                        setState(() {
                          stock_list = response as List<Stock>;
                        });
                      } catch (e) {
                        print("Error in getStockInfo: $e");
                        // setState(() {
                        //   _stockListFuture = Future.error(e);
                        // });
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: stock_list?.length ?? 0,
                itemBuilder: (context, index) {
                  final stock = stock_list?[index];
                  return ListTile(
                    title: Text(stock?.stock_name ?? ''),
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
