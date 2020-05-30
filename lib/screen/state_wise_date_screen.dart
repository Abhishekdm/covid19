import 'package:flutter/material.dart';
import '../components/list_view_item_card.dart';
import '../services/covid_data.dart';
import '../contants.dart';

class StatewiseData extends StatefulWidget {
  @override
  _StatewiseDataState createState() => _StatewiseDataState();
}

class _StatewiseDataState extends State<StatewiseData> {
  CovidData getCovidData = CovidData();
  List<dynamic> listBuilderStateDate;
  int stateDataLength = 0;

  void getIndiaData() async {
    var data = await getCovidData.indiaHistoricalData();
// error handling
    if (data != null) {
      listBuilderStateDate = data['statewise'];

      // removing data at index 17 because it has no value
      listBuilderStateDate
          .removeWhere((element) => element['state'] == 'State Unassigned');
      setState(() {
        stateDataLength = listBuilderStateDate.length - 1;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getIndiaData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              'Statewise Data',
              style: TextStyle(
                color: kFontColor,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              color: kBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _TitleTextLabel(label: 'State'),
                    _TitleTextLabel(label: 'Active'),
                    _TitleTextLabel(label: 'Death'),
                    _TitleTextLabel(label: 'Recover'),
                    _TitleTextLabel(label: 'Total'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: stateDataLength,
                itemBuilder: (context, index) {
                  return ListViewItemCard(
                    state: listBuilderStateDate[index + 1]['state'],
                    active: listBuilderStateDate[index + 1]['active'],
                    death: listBuilderStateDate[index + 1]['deaths'],
                    recovered: listBuilderStateDate[index + 1]['recovered'],
                    total: listBuilderStateDate[index + 1]['confirmed'],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TitleTextLabel extends StatelessWidget {
  final String label;
  final Color color;
  const _TitleTextLabel({this.label, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
