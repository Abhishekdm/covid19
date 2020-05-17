import './contants.dart';
import 'package:covid19/screen/Statistics_screen.dart';
import 'package:flutter/material.dart';
import './screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageControl(),
    );
  }
}

class PageControl extends StatefulWidget {
  @override
  _PageControlState createState() => _PageControlState();
}

class _PageControlState extends State<PageControl> {
  int _selectedItem = 0;
  var _pages = [HomeScreen(), StatisticsScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text('Welcome'),
      ),
      body: _pages[_selectedItem],
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
        currentIndex: _selectedItem,
        onTap: (index) {
          setState(() {
            _selectedItem = index;
          });
        },
      ),
    );
  }
}
