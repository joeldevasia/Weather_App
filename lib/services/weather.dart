import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
import 'package:clima/utilities/constants.dart';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    LocateMe location = LocateMe();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getData();
    print(weatherData);
    return weatherData;
  }

  Future<dynamic> getWeatherByCity(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getData();
    print(weatherData);
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time in ';
    } else if (temp > 20) {
      return 'Time for shorts and 👕 in ';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤 in ';
    } else {
      return 'Bring a 🧥 just in case in ';
    }
  }
}
