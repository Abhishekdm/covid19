import '../contants.dart';
import 'package:flutter/material.dart';
import '../components/bar_chat.dart';
import '../services/covid_data.dart';
import '../models/country_data.dart';
import '../models/global_data.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  CovidData getCovidData = CovidData();
  bool isCountry = true;
  int status = 1;
  CountryData countryData;
  GlobalData globalData;
  int indiaDataLength;
  String affected = '0';
  String death = '0';
  String recovered = '0';
  String active = '0';
  String serious = '0';
  List graphLabels;
  List graphValues;

  @override
  void initState() {
    super.initState();
    getIndiaData();
    getGlobalData();
  }

  void getIndiaData() async {
    var data = await getCovidData.indiaHistoricalData();
    countryData = CountryData(data);

    countryUi(countryData);
  }

  void getGlobalData() async {
    var data = await getCovidData.globalData();
    globalData = GlobalData(data);
  }

  void countryUi(CountryData data) {
    setState(() {
      affected = data.totalAffected;
      death = data.totalDeath;
      recovered = data.totalRecovered;
      active = data.currentActive;
      serious = '0';
      graphLabels = data.weekDataLabels;
      graphValues = data.weekDataValues;
    });
  }

  void globalUi(GlobalData data) {
    setState(() {
      affected = data.totalAffected;
      death = data.totalDeath;
      recovered = data.totalRecovered;
      active = data.currentActive;
      serious = data.currentCritical;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
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
                    height: 15,
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
                              countryUi(countryData);
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
                              globalUi(globalData);
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
                          textColor:
                              status == 1 ? Colors.white : Colors.white60,
                          onPressed: () {
                            setState(() {
                              status = 1;
                            });
                          },
                        ),
                        FlatButton(
                          child: Text('Today'),
                          textColor:
                              status == 2 ? Colors.white : Colors.white60,
                          onPressed: () {
                            setState(() {
                              status = 2;
                            });
                          },
                        ),
                        FlatButton(
                          child: Text('Yestarday'),
                          textColor:
                              status == 3 ? Colors.white : Colors.white60,
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
                              numberText: affected,
                              color: Color(0xFFFFB259),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            DescriptionCard(
                              titleText: 'Death',
                              numberText: death,
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
                              numberText: recovered,
                              color: Color(0xFF4CD97B),
                              numberTextFontSize: 20.0,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            DescriptionCard(
                              titleText: 'Active',
                              numberText: active,
                              color: Color(0xFF4DB5FF),
                              numberTextFontSize: 20.0,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            DescriptionCard(
                              titleText: 'Serious',
                              numberText: serious,
                              color: Color(0xFF9059FF),
                              numberTextFontSize: 20.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Daily New Cases',
                      style: TextStyle(
                          color: kFontColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    BarChat(
                      labels: graphLabels,
                      values: graphValues,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionCard extends StatelessWidget {
  final String titleText;
  final String numberText;
  final Color color;
  final double numberTextFontSize;
  const DescriptionCard(
      {this.titleText,
      this.numberText,
      this.color,
      this.numberTextFontSize = 24});

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
                  fontSize: numberTextFontSize,
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
