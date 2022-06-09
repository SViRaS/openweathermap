import 'package:apiweathermap/models/weather_daily.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:apiweathermap/models/weather_daily.dart';

class TempView extends StatelessWidget {
  const TempView({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var icon = forecastList![0].getIconUrl();
    var temp = forecastList[0].temp!.day?.toStringAsFixed(0);
    var description = forecastList[0].weather![0].description?.toUpperCase();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(icon, scale: 0.4,),
          SizedBox(width: 20.0,),
          Column(
            children: [
              Text('$temp °C', style: TextStyle(fontSize: 54.0, color: Colors.black),),
              Text('$description', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    );
  }
}


