import 'package:flutter/material.dart';

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
