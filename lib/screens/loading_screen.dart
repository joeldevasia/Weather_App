import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

String baseText = "";

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
    loadingText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SpinKitCubeGrid(
              color: Colors.white,
              duration: Duration(milliseconds: 700),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(baseText)
        ],
      ),
    );
  }

  void loadingText() async {
    int counter = 0;
    baseText = "Fetching current Location";
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      baseText = baseText + ".";
      if (counter == 3) {
        counter = 0;
        baseText = "Fetching current Location";
      } else {
        counter++;
      }
      setState(() {});
    }
    // baseText = "Fetching current Location";
  }
}
