import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/provider/weather_provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context){
        return weatherProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
weathermodel1? weather;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<weatherProvider>(context).weatherData?.getThemeColor()==null? Colors.cyan
            :
        Provider.of<weatherProvider>(context).weatherData!.getThemeColor()
      ),
debugShowCheckedModeBanner: false,
      home:homepage(),
    );
  }
}


