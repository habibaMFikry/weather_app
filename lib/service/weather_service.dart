import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class weatherservice {
  String baseurl = 'http://api.weatherapi.com/v1';
  String Apikey = '3c7f9619009a462bb8f140029222111';

  Future<weathermodel1> getweather({required String cityName}) async {
    Uri url =
        Uri.parse('$baseurl/forecast.json?key=$Apikey&q=$cityName&days=1');

    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    weathermodel1 weather = weathermodel1.formjson(data);

    return weather;
  }
}
