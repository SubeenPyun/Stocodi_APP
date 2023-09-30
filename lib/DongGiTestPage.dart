import 'package:flutter/material.dart';
import 'package:stocodi_app/lecture/LectureTabActivity.dart';
import 'lecture/CommentActivity.dart';
import 'lecture/NextVideoActivity.dart';
import 'lecture/Test/ChatTest.dart';
import 'lecture/Test/TabBarTest.dart';
import 'lecture/LectureActivity.dart';
import 'lecture/Test/figmatoflutterTest.dart';
import 'lecture/VideoScreenActivity.dart';
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
                  MaterialPageRoute(builder: (context)=> CommentActivity()),
                );
              },
              child: Text('commentActivity'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> NextVideoActivity()),
                );
              },
              child: Text('nextVideo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> LectureTabActivity()),
                );
              },
              child: Text('LectureTab'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> LectureActivity()),
                );
              },
              child: Text('LectureActivity'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> FriendlychatApp()),
                );
              },
              child: Text('chatting'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> TabBarDemo()),
                );
              },
              child: Text('comment'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> VideoScreenActivity()),
                );
              },
              child: Text('VideoScreen'),
            ),
          ],
        ),
      ),
    );
  }
}
