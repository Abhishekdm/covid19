import 'package:flutter/material.dart';

enum Day { today, yestarday }

const kFontColor = Color(0xff0D1333);
const kBackgroundColor = Color(0xFF473F97);

RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
Function mathFunc = (Match match) => '${match[1]},';
