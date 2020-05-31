import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/rounded_button_with_icon.dart';
import '../components/image_text_column.dart';
import '../contants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            _MainPart(),
          ],
        ),
      ),
    );
  }
}

class _MainPart extends StatelessWidget {
  const _MainPart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 20.0,
            right: 20.0,
            bottom: 20.0,
            left: 20.0,
          ),
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Covid-19',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('images/india_flag.png'),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'IND',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                              fontSize: 15.0),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Are you feeling sick?',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'If you feel sick with any of the covid-19 symptoms please call or SMS 1075 immediately for help.',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  RoundedButtonWithIcon(
                    buttonLabel: 'Call Now',
                    icon: Icons.phone,
                    buttonColor: Color(0xFFFF4D58),
                    onPressed: () {
                      launch("tel:1075");
                    },
                  ),
                ],
              )
            ],
          ),
        ),
        _PreventionListView(),
        _SymptomsListView()
      ],
    );
  }
}

class _SymptomsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Symptoms',
            style: TextStyle(
              fontSize: 22.0,
              color: kFontColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 181,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                ImageTextColumn(
                  imageUrl: 'images/fever.png',
                  imageDescription: 'Fever',
                ),
                ImageTextColumn(
                  imageUrl: 'images/dry_cough.png',
                  imageDescription: 'Dry Cough',
                ),
                ImageTextColumn(
                  imageUrl: 'images/head_ache.png',
                  imageDescription: 'Headache',
                ),
                ImageTextColumn(
                  imageUrl: 'images/breath_less.png',
                  imageDescription: 'Breathless',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PreventionListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Prevention',
            style: TextStyle(
              fontSize: 22.0,
              color: kFontColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 180,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                ImageTextColumn(
                  imageUrl: 'images/distance.png',
                  imageDescription: 'Avoid close contact',
                ),
                ImageTextColumn(
                  imageUrl: 'images/wash_hands.png',
                  imageDescription: 'Wash hands',
                ),
                ImageTextColumn(
                  imageUrl: 'images/wear_mask.png',
                  imageDescription: 'Wear a facemask',
                ),
                ImageTextColumn(
                  imageUrl: 'images/cover_sneeze.png',
                  imageDescription: 'Cover while sneezing',
                ),
                ImageTextColumn(
                  imageUrl: 'images/sanitize.png',
                  imageDescription: 'Sanitize all objects',
                ),
                ImageTextColumn(
                  imageUrl: 'images/stay_home.png',
                  imageDescription: 'Stay home and be safe',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
