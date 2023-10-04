import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Nested ListView Example'),
        ),
        body: MyNestedListView(),
      ),
    );
  }
}

class MyNestedListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // 외부 ListView 항목 수
      itemBuilder: (BuildContext outerContext, int outerIndex) {
        return Card(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Text('Outer Item $outerIndex'),
              ),
              Container(
                height: 200, // 내부 ListView의 높이를 조절할 수 있습니다.
                child: ListView.builder(
                  itemCount: 10, // 내부 ListView 항목 수
                  itemBuilder: (BuildContext innerContext, int innerIndex) {
                    return ListTile(
                      title: Text('Inner Item $innerIndex'),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
