import 'package:flutter/material.dart';
import '../contants.dart';

class InfoScreen extends StatelessWidget {
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
              'StateWise Data',
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
                    CardTextLabel(label: 'State'),
                    CardTextLabel(label: 'Active'),
                    CardTextLabel(label: 'Death'),
                    CardTextLabel(label: 'Recovered'),
                    CardTextLabel(label: 'Total'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  CustomDesignedCard(),
                  CustomDesignedCard(),
                  CustomDesignedCard(),
                  CustomDesignedCard(),
                  CustomDesignedCard(),
                  CustomDesignedCard(),
                  CustomDesignedCard(),
                  CustomDesignedCard(),
                  CustomDesignedCard(),
                  CustomDesignedCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomDesignedCard extends StatelessWidget {
  const CustomDesignedCard({
    Key key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            CardTextLabel(label: 'Maharashtra'),
            CardTextLabel(label: '37,136'),
            CardTextLabel(label: '261,72'),
            CardTextLabel(label: '9,639'),
            CardTextLabel(label: '1,325'),
          ],
        ),
      ),
    );
  }
}

class CardTextLabel extends StatelessWidget {
  final String label;
  final Colors colors;
  const CardTextLabel({this.label, this.colors});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
