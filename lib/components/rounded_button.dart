import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String buttonLabel;
  final IconData icon;
  final Function onPressed;
  final Color buttonColor;
  const RoundedButton({
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
        padding: EdgeInsets.all(13.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: buttonColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon),
            SizedBox(
              width: 10,
            ),
            Text(
              buttonLabel,
              style: TextStyle(
                fontSize: 16,
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
