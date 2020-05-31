import 'package:flutter/material.dart';
import '../contants.dart';

class ListViewItemCard extends StatelessWidget {
  final String state;
  final String active;
  final String death;
  final String recovered;
  final String total;

  const ListViewItemCard(
      {this.state = '',
      this.active = '',
      this.death = '',
      this.recovered = '',
      this.total = ''});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            _CardTextLabel(
              label: state,
              flex: 2,
              textAlign: TextAlign.start,
              color: kFontColor,
            ),
            _CardTextLabel(
              label: active.replaceAllMapped(reg, mathFunc),
              color: kActiveColor,
            ),
            _CardTextLabel(
              label: death.replaceAllMapped(reg, mathFunc),
              color: kDeathColor,
            ),
            _CardTextLabel(
              label: recovered.replaceAllMapped(reg, mathFunc),
              color: kRecoveredColor,
            ),
            _CardTextLabel(
              label: total.replaceAllMapped(reg, mathFunc),
              color: kAffectedColor,
            ),
          ],
        ),
      ),
    );
  }
}

class _CardTextLabel extends StatelessWidget {
  final String label;
  final Color color;
  final int flex;
  final TextAlign textAlign;
  const _CardTextLabel({
    this.label,
    this.color = Colors.white,
    this.flex = 1,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        label,
        textAlign: textAlign,
        style: TextStyle(
          color: color,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
