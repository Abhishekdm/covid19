import 'package:flutter/material.dart';

enum Day { today, yestarday }

const kAppBarColor = Color(0xff473F97);
const kFontColor = Color(0xff0D1333);
const kBackgroundColor = Color(0xFF352F71);
const kAffectedColor = Color(0xFFFFB259);
const kDeathColor = Color(0xFFFF5959);
const kRecoveredColor = Color(0xFF4CD97B);
const kActiveColor = Color(0xFF4DB5FF);
const kSeriousColor = Color(0xFF9059FF);

RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
Function mathFunc = (Match match) => '${match[1]},';
