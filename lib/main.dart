import 'package:flutter/material.dart';
import './screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF473F97),
          title: Text('Welcome'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assessment),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              title: Text(''),
            ),
          ],
        ),
        body: HomeScreen(),
      ),
    );
  }
}
