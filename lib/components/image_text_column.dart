import 'package:flutter/material.dart';

class ImageTextColumn extends StatelessWidget {
  final String imageUrl;
  final String imageDescription;
  const ImageTextColumn({this.imageUrl, this.imageDescription});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15, top: 10, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF473F97),
      ),
      width: 105,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage(imageUrl),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            imageDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
