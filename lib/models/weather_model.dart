import 'package:flutter/material.dart';
import 'package:weather_app/provider/weather_provider.dart';

class weathermodel1 {
  String date;
  double temp;
  double Maxtemp;
  double mintemp;
  String weatherStateName;
  String icon;
  weathermodel1({
    required this.date,
    required this.temp,
    required this.Maxtemp,
    required this.mintemp,
    required this.weatherStateName,
    required this.icon,
  });

  factory weathermodel1.formjson(dynamic data) {
    var josnData = data['forecast']['forecastday'][0]['day'];
    var josnData2 = data['forecast']['forecastday'][0]['hour'][0];

    return weathermodel1(
      date: data['location']['localtime'],
      temp: josnData['avgtemp_c'],
      Maxtemp: josnData['maxtemp_c'],
      mintemp: josnData['mintemp_c'],
      weatherStateName: josnData2['condition']['text'],
      icon: josnData2['condition']['icon'],
    );
  }
  @override
  String toString() {
    return 'temp=$temp mintemp=$mintemp Maxtemp=$Maxtemp date=$date icon=$icon ';
  }

  /*String getImage() {
    if (weatherStateName == 'Sunny' || weatherStateName == 'Clear' ||  weatherStateName == 'partly sunny') {
      return 'assets/images/clear.png';
    } else if (

    weatherStateName == 'Blizzard' ||  weatherStateName == 'Patchy snow possible'  ||  weatherStateName == 'Patchy sleet possible' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow'||weatherStateName=='Snowy') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||  weatherStateName == 'Heavy Cloud' || weatherStateName == 'Mist' || weatherStateName == 'Fog'|| weatherStateName == 'Overcast'|| weatherStateName == 'Partly cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' ) {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }*/
  MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'partly sunny') {
      return Colors.orange;
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow' ||
        weatherStateName == 'Snowy') {
      return Colors.blue;
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Overcast' ||
        weatherStateName == 'Partly cloudy') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
