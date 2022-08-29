import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
  textBaseline: TextBaseline.alphabetic,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kDescriptionTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 20.0,
  textBaseline: TextBaseline.alphabetic,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
//Use your own API Key from OpenWeatherMap 😁
String? apiKey = dotenv.env['apiKey'];
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const openWeatherIconURl = 'http://openweathermap.org/img/wn/';
const iconSize_Extension = '@4x.png';
