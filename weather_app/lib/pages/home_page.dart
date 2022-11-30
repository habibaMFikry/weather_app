import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/provider/weather_provider.dart';

class homepage extends StatefulWidget {
   homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}
class _homepageState extends State<homepage> {
void updateui(){
  setState(() {
  });
}
weathermodel1? weatherData;
  @override
  Widget build(BuildContext context) {
  weatherData=Provider.of<weatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.teal,
        title: Text('Weather App'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:(BuildContext context){
              return searchpage(updateui: updateui,);
            },
            ));
          },
              icon:Icon(Icons.search)),
        ],
      ),
      body:Provider.of<weatherProvider>(context).weatherData==null?
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('there is no weather😔start',style: TextStyle(
              fontSize: 30,
            ),),
            Text('searching now 🔍',style: TextStyle(
              fontSize: 30,
            ),),
          ],
        ),
      )
          :Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                weatherData!.getThemeColor(),
                weatherData!.getThemeColor()[300]!,
                weatherData!.getThemeColor()[100]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 3,),
             Text(
               Provider.of<weatherProvider>(context).cityName!,
               style: TextStyle(
               fontSize: 32,
               fontWeight: FontWeight.bold),
             ),
            Text('Updated:${weatherData!.date}',
              style: TextStyle(
                fontSize: 20,),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

               Image.network('https:${weatherData!.icon}',),
                Text(weatherData!.temp.toInt().toString(),
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text('maxTemp:${weatherData!.Maxtemp.toInt()}',
                      style: TextStyle(
                      ),
                    ),
                    Text('minTemp:${weatherData!.mintemp.toInt()}',
                      style: TextStyle(
                        ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Text(weatherData!.weatherStateName,
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(flex: 5,),
          ],
        ),
      ),
    );
  }
}
