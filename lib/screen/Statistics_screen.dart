import 'package:flutter/material.dart';
import '../components/bar_chat.dart';
import '../components/rounded_button.dart';
import '../components/description_card.dart';
import '../services/covid_data.dart';
import '../models/country_data.dart';
import '../models/global_data.dart';
import '../contants.dart';

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
  WeekData globalHistoricalData;
  int indiaDataLength;
  String affected = '0';
  String death = '0';
  String recovered = '0';
  String active = '0';
  String serious = '0';
  String lastupDated = '';
  List graphLabels;
  List graphValues;
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    getIndiaData();
    getGlobalData();
  }

// fetching indai country data from api
  void getIndiaData() async {
    var data = await getCovidData.indiaHistoricalData();
// error handling
    if (data != null) {
      countryData = CountryData(data);
      countryUi(countryData);
    }
  }

// fetching world data from api
  void getGlobalData() async {
    var globaldata = await getCovidData.globalData();
    // error handling
    if (globaldata != null) {
      globalData = GlobalData(globaldata);
    }

    var historicaldata = await getCovidData.globalHistoricalData();
    // error handling
    if (historicaldata != null) {
      globalHistoricalData = historicaldata;
    }
  }

  void emptyData() {
    setState(() {
      affected = '0';
      death = '0';
      recovered = '0';
      active = '0';
      serious = '0';
      lastupDated = '';
    });
  }

// function used to build the ui for country data
  void countryUi(CountryData data) {
    if (data == null) {
      emptyData();
    } else
      setState(() {
        affected = data.totalAffected;
        death = data.totalDeath;
        recovered = data.totalRecovered;
        active = data.currentActive;
        serious = '0';
        lastupDated = data.lastupDated;
        graphLabels = data.weekDataLabels;
        graphValues = data.weekDataValues;
      });
  }

// function used to build the ui for global data
  void globalUi(GlobalData data) {
    if (data == null) {
      emptyData();
    } else
      setState(() {
        affected = data.totalAffected;
        death = data.totalDeath;
        recovered = data.totalRecovered;
        active = data.currentActive;
        serious = data.currentCritical;
        graphValues = globalHistoricalData.weekDataAffected;
      });
  }

// function to handle today and yesterday data for country and global
  void uiTodayAndYestarday(Day day) {
    if (isCountry) {
      if (day == Day.today) {
        setState(() {
          affected = countryData.previousDayData[0].dailyAffected;
          death = countryData.previousDayData[0].dailyDeath;
          recovered = countryData.previousDayData[0].dailyRecovered;
        });
      } else {
        setState(() {
          affected = countryData.previousDayData[1].dailyAffected;
          death = countryData.previousDayData[1].dailyDeath;
          recovered = countryData.previousDayData[1].dailyRecovered;
        });
      }
    } else {
      if (day == Day.today) {
        setState(() {
          affected = globalData.todayAffected;
          death = globalData.todayDeath;
          recovered =
              globalHistoricalData.weekDataRecovered[0].toStringAsFixed(0);
        });
      } else {
        setState(() {
          affected =
              globalHistoricalData.weekDataAffected[0].toStringAsFixed(0);
          death = globalHistoricalData.weekDataDeath[0].toStringAsFixed(0);
          recovered =
              globalHistoricalData.weekDataRecovered[0].toStringAsFixed(0);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    bottom: 20,
                  ),
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
                              buttonColor: isCountry
                                  ? Color(0xFFFFFFFF)
                                  : Color(0x00FFFFFF),
                              onPressed: () {
                                setState(() {
                                  isCountry = true;
                                  countryUi(countryData);
                                  status = 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundedButton(
                              buttonLabel: 'Global',
                              color: isCountry ? Color(0xFFFFFFFF) : kFontColor,
                              buttonColor: isCountry
                                  ? Color(0x00FFFFFF)
                                  : Color(0xFFFFFFFF),
                              onPressed: () {
                                setState(() {
                                  isCountry = false;
                                  globalUi(globalData);
                                  status = 1;
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
                                  isCountry
                                      ? countryUi(countryData)
                                      : globalUi(globalData);
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
                                  uiTodayAndYestarday(Day.today);
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
                                  uiTodayAndYestarday(Day.yestarday);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Updated at $lastupDated ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
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
                                  color: kAffectedColor,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                DescriptionCard(
                                  titleText: 'Death',
                                  numberText: death,
                                  color: kDeathColor,
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
                                  color: kRecoveredColor,
                                  numberTextFontSize: 20.0,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                DescriptionCard(
                                  titleText: 'Active',
                                  numberText: active,
                                  color: kActiveColor,
                                  numberTextFontSize: 20.0,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                DescriptionCard(
                                  titleText: 'Serious',
                                  numberText: serious,
                                  color: kSeriousColor,
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
                Container(
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 22,
                    left: 20,
                    right: 20,
                  ),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
