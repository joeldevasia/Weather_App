import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          duration: Duration(milliseconds: 700),
        ),
      ),
    );
  }
}
// var temp = json['main']['temp'];
// print("Temperature: $temp");
// var id = json['weather'][0]['id'];
// print("Weather No: $id");
// var city = json['name'];
// print("City: $city");
