import 'package:flutter/material.dart';
import 'package:stocodi_app/lecture/widget/LectureTab.dart';
import 'lecture/ClassRoom.dart';
import 'lecture/widget/ClassRoomLecture.dart';
import 'lecture/widget/NextVideo.dart';
import 'lecture/Test/ChatTest.dart';
import 'lecture/Test/TabBarTest.dart';
import 'lecture/widget/Lecture.dart';
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
                  MaterialPageRoute(builder: (context)=> ClassRoom()),
                );
              },
              child: Text('classroom'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> ClassRoomLecture()),
                );
              },
              child: Text('classroom package'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> LectureTab()),
                );
              },
              child: Text('LectureTab'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> Lecture()),
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
