import 'package:apiweathermap/api/weather_api.dart';
import 'package:apiweathermap/models/weather_daily.dart';
import 'package:apiweathermap/screens/city_screen.dart';
import 'package:apiweathermap/widgets/temp_view.dart';
import 'package:flutter/material.dart';
import 'package:apiweathermap/main.dart';

import '../widgets/city_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({ Key? key }) : super(key: key);

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecastScreen> {

  late Future<WeatherForecast> forecastObject;
  String _cityName = 'Ekaterinburg';

  @override
  void initState() {
  super.initState();
  forecastObject = WeatherApi().fetchWeatherForecastWithCity( cityName: 'Ekaterinburg');
  forecastObject.then((value) => print(value.list![0].weather![0].main));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('OpenWeatherMap'),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.my_location),
        onPressed: () {},) ,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.location_city), onPressed: () async {
            var tappedName =await Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CityScreen();
            }));
            if(tappedName != null) {
              _cityName = tappedName;
              forecastObject = WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);
            }
          },)
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: FutureBuilder<WeatherForecast>(future: forecastObject,
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    const SizedBox(height: 50.0),
                    CityView(snapshot: snapshot),
                    SizedBox(height: 50,),
                    TempView(snapshot: snapshot)
                    ]);
              } else {
                return Center(
                  
                  child: Text("noob, don't work"),
                );
              }
        
            }),
          )
        ],
      ),
    );
  }
}