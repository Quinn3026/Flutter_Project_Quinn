import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'RubikWetPaint',
  fontSize: 80.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'RubikWetPaints',
  fontSize: 50.0,

);

const kButtonTextStyle = TextStyle(backgroundColor: Color(0x7FFFFFFF),color: Colors.blue,
  fontSize: 30.0,
  fontFamily: 'RubikWetPaint',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextfieldInputdecoration = InputDecoration(
  filled: true,
  fillColor:  Colors.white,
  icon: Icon(Icons.location_city, color: Colors.white,),
  hintText: 'Enter City Name',hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0),),
    borderSide: BorderSide.none,
  ),

);
