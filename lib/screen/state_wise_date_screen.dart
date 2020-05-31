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
      backgroundColor: kBackgroundColor,
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
            Container(
              margin: EdgeInsets.only(
                left: 4,
              ),
              child: Text(
                'Statewise Data',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  _ContainerWithColorFillAndText(
                    iconFillColor: kActiveColor,
                    labelText: 'Active',
                  ),
                  _ContainerWithColorFillAndText(
                    iconFillColor: kDeathColor,
                    labelText: 'Death',
                  ),
                  _ContainerWithColorFillAndText(
                    iconFillColor: kRecoveredColor,
                    labelText: 'Recovered',
                  ),
                  _ContainerWithColorFillAndText(
                    iconFillColor: kAffectedColor,
                    labelText: 'Total',
                  ),
                ],
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

class _ContainerWithColorFillAndText extends StatelessWidget {
  final Color iconFillColor;
  final String labelText;
  const _ContainerWithColorFillAndText({
    this.iconFillColor = Colors.black,
    this.labelText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: iconFillColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            labelText,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

// class _TitleTextLabel extends StatelessWidget {
//   final String label;
//   final Color color;
//   final int flex;
//   final TextAlign textAlign;
//   const _TitleTextLabel({
//     this.label,
//     this.color = Colors.white,
//     this.flex = 1,
//     this.textAlign = TextAlign.center,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: flex,
//       child: Text(
//         label,
//         textAlign: textAlign,
//         style: TextStyle(
//           color: color,
//           fontSize: 15,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }
