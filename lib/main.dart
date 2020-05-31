import 'package:flutter/material.dart';
import './screen/home_screen.dart';
import './screen/statistics_screen.dart';
import './screen/state_wise_date_screen.dart';
import './contants.dart';

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
  var _pages = [HomeScreen(), StatisticsScreen(), StatewiseData()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text('Welcome!'),
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
            icon: Icon(Icons.map),
            title: Text(''),
          ),
        ],
        selectedItemColor: kAppBarColor,
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
