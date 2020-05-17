import '../contants.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  bool isCountry = true;
  int status = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Statistics',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 5,
                  right: 5,
                  top: 2,
                  bottom: 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0x30FFFFFF),
                ),
                child: Row(
                  children: <Widget>[
                    RoundedButton(
                      buttonLabel: 'My Country',
                      color: isCountry ? kFontColor : Color(0xFFFFFFFF),
                      buttonColor:
                          isCountry ? Color(0xFFFFFFFF) : Color(0x00FFFFFF),
                      onPressed: () {
                        setState(() {
                          isCountry = true;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RoundedButton(
                      buttonLabel: 'Global',
                      color: isCountry ? Color(0xFFFFFFFF) : kFontColor,
                      buttonColor:
                          isCountry ? Color(0x00FFFFFF) : Color(0xFFFFFFFF),
                      onPressed: () {
                        setState(() {
                          isCountry = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      child: Text('Total'),
                      textColor: status == 1 ? Colors.white : Colors.white60,
                      onPressed: () {
                        setState(() {
                          status = 1;
                        });
                      },
                    ),
                    FlatButton(
                      child: Text('Today'),
                      textColor: status == 2 ? Colors.white : Colors.white60,
                      onPressed: () {
                        setState(() {
                          status = 2;
                        });
                      },
                    ),
                    FlatButton(
                      child: Text('Yestarday'),
                      textColor: status == 3 ? Colors.white : Colors.white60,
                      onPressed: () {
                        setState(() {
                          status = 3;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        DescriptionCard(
                          titleText: 'Affected',
                          numberText: '345,678',
                          color: Color(0xFFFFB259),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        DescriptionCard(
                          titleText: 'Death',
                          numberText: '345,678',
                          color: Color(0xFFFF5959),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        DescriptionCard(
                          titleText: 'Recovered',
                          numberText: '345,678',
                          color: Color(0xFF4CD97B),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        DescriptionCard(
                          titleText: 'Active',
                          numberText: '345,678',
                          color: Color(0xFF4DB5FF),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        DescriptionCard(
                          titleText: 'Serious',
                          numberText: '345,678',
                          color: Color(0xFF9059FF),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DescriptionCard extends StatelessWidget {
  final String titleText;
  final String numberText;
  final Color color;
  const DescriptionCard({this.titleText, this.numberText, this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              titleText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(numberText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                )),
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String buttonLabel;
  final Function onPressed;
  final Color color;
  final Color buttonColor;
  const RoundedButton({
    this.buttonLabel,
    this.onPressed,
    this.color,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        padding: EdgeInsets.all(12),
        child: Text(
          buttonLabel,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        textColor: color,
        color: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
