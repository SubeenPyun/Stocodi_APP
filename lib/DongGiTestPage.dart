import 'package:flutter/material.dart';
import 'lecture/ClassRoom.dart';
import 'lecture/Lecture.dart';
import 'lecture/widget/Comment.dart';
void main(){
  runApp(const DongGi());
}
class DongGi extends StatelessWidget {
  const DongGi({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
              child: const Text('classroom'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> Lecture()),
                );
              },
              child: const Text('LectureActivity'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> Comment()),
                );
              },
              child: const Text('MyComment'),
            ),

          ],
        ),
      ),
    );
  }
}
