// ال file دا في الكود المسؤل علي اني اجيب بيانات الطقس
// يعني دا كدا  ال file الي في ال logic code
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:weather_app/models/weather_model.dart';
//بكتب as httpعشان دي كدا keyword بقدر اعمل اكسس للي جواها
class weatherservice{
  String baseurl='http://api.weatherapi.com/v1';
  String Apikey='3c7f9619009a462bb8f140029222111';
// دي ال method الي بتديلي المهمه بتاعتي
// getweather بتاخد اسم المدينه في ({})وبترجعلي ال داتا الخاصه بالمدينه في كير براكيت

  Future<weathermodel1> getweather({required String cityName}) async{
    // ال parse حولتلي ال String ل url object
    Uri url=Uri.parse('$baseurl/forecast.json?key=$Apikey&q=$cityName&days=1');
// ال get دي ال function الي بتسمحلي اني اعمل get request لل data الي جيالي
 //يعني كدا بعمل طلب للبيانات ناقص بقي استلمها عندي ف بستلمها في كلاس اسمه response نوعه future ف هعمل ال getweather method (async)
 // يبقي انا كدا بستقبل البيانات الي في الget في الكلاس response
    http.Response response= await http.get(url);
 //jsonDecode(response.body)
// انا هنا بحول شكل البيانات الي انا مش عارف اقراها لانها علي شكل سترينج لشكل انا عارف اقراه من خلال ال function josndecode
//بعد كدا بستقبل البيانات في map اسمها data
Map<String,dynamic>data= jsonDecode(response.body);
// ال data الي رجعالي بنشأ منها object الي هو ال weather من خلال ال named constructor الي هو weathermodel1.fomjson
weathermodel1 weather=weathermodel1.formjson(data);

return weather;
  }
}