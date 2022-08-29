import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';

late int id;

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temp;
  late String city;
  late String weatherIcon;
  late String weatherMessage;
  late String weatherDescription;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    if (weatherData == null) {
      temp = 0;
      id = 0;
      city = "Error";
      weatherIcon =
          "https://cdn.pixabay.com/photo/2012/04/14/17/05/warning-34621_960_720.png";
      weatherMessage = "Error: Please enter correct City Name";
      weatherDescription = "";
      return;
    }
    temp = weatherData['main']['temp'].round();
    id = weatherData['weather'][0]['id'];
    city = weatherData['name'];
    weatherIcon = WeatherModel().getWeatherIcon(id);
    weatherMessage = WeatherModel().getMessage(temp);
    weatherDescription = WeatherModel().getWeatherDescription(id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: WeatherModel().getWeatherBackground(id),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    OutlinedButton(
                      onPressed: () async {
                        var weatherData =
                            await WeatherModel().getLocationWeather();
                        updateUI(weatherData);
                      },
                      child: const Icon(
                        Icons.near_me,
                        size: 50.0,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CityScreen(),
                            )).then((value) => setState(() {}));
                      },
                      child: const Icon(
                        Icons.travel_explore,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    city,
                    style: kDescriptionTextStyle,
                  ),
                ),
                // LoadImage(),
                Image.network(
                  weatherIcon,
                  scale: 0.5,
                  fit: BoxFit.cover,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherDescription,
                      style: kDescriptionTextStyle,
                    ),
                  ],
                ),
                Text(
                  weatherMessage,
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
