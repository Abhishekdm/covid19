import 'package:flutter/material.dart';

class RoundedButtonWithIcon extends StatelessWidget {
  final String buttonLabel;
  final IconData icon;
  final Function onPressed;
  final Color buttonColor;
  const RoundedButtonWithIcon({
    this.buttonLabel,
    this.icon,
    this.buttonColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        textColor: Colors.white,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: buttonColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 22,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              buttonLabel,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
