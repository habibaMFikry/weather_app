import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/service/weather_service.dart';
class searchpage extends StatelessWidget {
  String? cityName;
   searchpage({this.updateui});
   VoidCallback? updateui;

//كدا انا عملت variable cityname عشان اخزن فيه ال data الي في ال onsubmitted
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.cyan,
  title: Text('Search a City'),
),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                onChanged: (data)
                {
                  cityName = data;
                },
               // onChanged: (data){print(data);},
                onSubmitted: (data) async{

                  /// دي كدا ال داتا الي انا بدخلها بتتخزن في ال cityname الي انا عملتلها create في الاول فوق
                  cityName=data;
                  /// weatherserviceبفعل ال class الي بيقدملي الخدمه
                  /// وبعمل اكسس علي الfunction الي بتجيبلي الداتا لما بدخلها اسم المدينه

                  weatherservice service=weatherservice();
                  weathermodel1 weather = await service.getweather(cityName: cityName!);
                  ///حطيت الداتا الي جت قي ال weather نقلتها في ال global var weatherdata
                  Provider.of<weatherProvider>(context,listen: false).weatherData=weather;
                  Provider.of<weatherProvider>(context,listen: false).cityName=cityName;
                  Navigator.pop(context);
                  },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                  label: Text('search'),
                  hintText: 'Enter City Name',
                  hintStyle:TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.cyan),
                  suffixIcon: GestureDetector(
                      onTap : () async
                      {
                        weatherservice service = weatherservice();

                        weathermodel1? weather =
                        await service.getweather(cityName: cityName!);

                        Provider.of<weatherProvider>(context,listen: false).weatherData = weather;
                        Provider.of<weatherProvider>(context,listen: false).cityName = cityName;

                        Navigator.pop(context);
                      },
                      child: Icon(Icons.search)),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.cyan,)),
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
