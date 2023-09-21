import 'package:flutter/material.dart';
import 'lecture/ChatTest.dart';

void main(){
  runApp(DongGi());
}
class DongGi extends StatelessWidget {
  const DongGi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DongGiPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> FriendlychatApp()),
                  );
                },
                child: Text('chatting'),
            ),
          ],
        ),
      ),
    );
  }
}
