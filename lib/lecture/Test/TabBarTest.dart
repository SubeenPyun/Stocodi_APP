import 'package:flutter/material.dart';
import 'package:stocodi_app/Style/RoundBox.dart';
import 'package:stocodi_app/theme/AppTheme.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Row(
                    children: [
                      Text('댓글'),
                      RoundedBox(
                        text: '999',
                        backgroundColor: AppTheme.getAppTheme().primaryColor,
                        borderRadius: 10.0,
                        textColor: AppTheme.getAppTheme().hintColor
                      ),
                    ],
                  )
                ),
                Tab(
                  text: '다음 동영상',
                ),
              ],
            ),

              title: const Text('Tabs Demo'),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
            ],
          ),
        ),
      ),
    );
  }
}