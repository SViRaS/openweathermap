import 'package:apiweathermap/models/weather_daily.dart';
import 'package:flutter/material.dart';
import 'package:apiweathermap/utility/intl.dart';
import 'package:apiweathermap/utility/intl.dart';
class CityView extends StatelessWidget {

  final AsyncSnapshot<WeatherForecast> snapshot;
  const CityView({required this.snapshot});
  
  @override
  Widget build(BuildContext context) {
   var data = snapshot.data!.list;
   var city = snapshot.data!.city!.name;
   var country = snapshot.data!.city!.country;
   var formatDate = DateTime.fromMillisecondsSinceEpoch(data![0].dt !* 1000);
  
    return Container(
      child: Column(
        children: <Widget>[
          Text('$city, $country', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black
          ),),
          Text('${NoBody.getFormattedDate(formatDate)}')
        ]
      ),
    );
  }
}