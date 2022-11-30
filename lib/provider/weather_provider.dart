import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';

class weatherProvider extends ChangeNotifier {
  weathermodel1? _weatherData;

  String? cityName;
  set weatherData(weathermodel1? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  weathermodel1? get weatherData => _weatherData;
}
