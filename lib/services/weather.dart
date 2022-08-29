import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    LocateMe location = LocateMe();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getWeatherByCity(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  List<Color> getWeatherBackground(int condition) {
    if (condition < 300) {
      return [
        Colors.blue,
        Colors.red,
      ];
    } else if (condition < 400) {
      return [
        const Color(0xFFa8c0ff),
        const Color(0xFF3f2b96),
      ];
    } else if (condition < 600) {
      return [
        const Color(0xFFbdc3c7),
        const Color(0xFF2c3e50),
      ];
    } else if (condition < 700) {
      return [
        const Color(0xFF6190E8),
        const Color(0xFFA7BFE8),
      ];
    } else if (condition < 800) {
      return [
        const Color(0xFFB993D6),
        const Color(0xFF8CA6DB),
      ];
    } else if (condition == 800) {
      return [
        const Color(0xFF56CCF2),
        const Color(0xFF2F80ED),
      ];
    } else if (condition <= 804) {
      return [
        const Color(0xFF7474BF),
        const Color(0xFF348AC7),
      ];
    } else {
      return [
        const Color(0xFF114357),
        const Color(0xFFF29492),
      ];
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      // return '🌩';
      return '$openWeatherIconURl/11d$iconSize_Extension';
    } else if (condition < 400) {
      return '$openWeatherIconURl/9d$iconSize_Extension';
    } else if (condition < 600) {
      return '$openWeatherIconURl/10d$iconSize_Extension';
    } else if (condition < 700) {
      return '$openWeatherIconURl/13d$iconSize_Extension';
    } else if (condition < 800) {
      return '$openWeatherIconURl/50d$iconSize_Extension';
    } else if (condition == 800) {
      return '$openWeatherIconURl/01d$iconSize_Extension';
    } else if (condition <= 804) {
      return '$openWeatherIconURl/04d$iconSize_Extension';
    } else {
      return 'https://pixabay.com/vectors/warning-exclamation-caution-sign-34621';
    }
  }

  String getWeatherDescription(int condition) {
    if (condition < 300) {
      return 'Thunderstorm';
    } else if (condition < 400) {
      return 'Drizzle';
    } else if (condition < 600) {
      return 'Rainy';
    } else if (condition < 700) {
      return 'Snowy';
    } else if (condition < 800) {
      return 'misty';
    } else if (condition == 800) {
      return 'Clear sky';
    } else if (condition <= 804) {
      return 'Broken clouds';
    } else {
      return "I don't know";
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
