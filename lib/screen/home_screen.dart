import 'package:flutter/material.dart';
import '../components/rounded_button.dart';
import '../contants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 20.0,
                right: 20.0,
                bottom: 20.0,
                left: 20.0,
              ),
              decoration: BoxDecoration(
                color: Color(0xFF473F97),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Covid-19',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(),
                            SizedBox(
                              width: 10.0,
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton(
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                    fontSize: 15.0),
                                value: "USA",
                                items: [
                                  DropdownMenuItem(
                                    child: Text('USA'),
                                    value: 'USA',
                                  ),
                                  DropdownMenuItem(
                                    child: Text('IND'),
                                    value: 'IND',
                                  ),
                                ],
                                onChanged: (value) {
                                  print(value);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'Are you feeling sick?',
                    style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'If you feel sick with any of covid-19 symptoms please call or SMS us immediately for help.',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: <Widget>[
                      RoundedButton(
                        buttonLabel: 'Call Now',
                        icon: Icons.phone,
                        buttonColor: Color(0xFFFF4D58),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      RoundedButton(
                        buttonLabel: 'Send SMS',
                        icon: Icons.sms,
                        buttonColor: Color(0xFF4D79FF),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Prevention',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: kFontColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      ImageTextColumn(
                        imageUrl: 'images/avoid_close_contact.jpg',
                        imageDescription: 'Await close contact',
                      ),
                      ImageTextColumn(
                        imageUrl: 'images/wash_hands.jpg',
                        imageDescription: 'Clean your hands often',
                      ),
                      ImageTextColumn(
                        imageUrl: 'images/wear_mask.jpg',
                        imageDescription: 'Wear a facemask',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}

class ImageTextColumn extends StatelessWidget {
  final String imageUrl;
  final String imageDescription;
  const ImageTextColumn({this.imageUrl, this.imageDescription});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage(imageUrl),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            imageDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kFontColor,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
