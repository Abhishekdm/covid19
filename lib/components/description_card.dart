import 'package:flutter/material.dart';
import '../contants.dart';

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
            Text(numberText.replaceAllMapped(reg, mathFunc),
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
