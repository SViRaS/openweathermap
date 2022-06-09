import 'dart:convert';
import 'dart:developer';

import 'package:apiweathermap/models/weather_daily.dart';
import 'package:apiweathermap/utility/utility.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCity(
      {required String cityName}) async {
    var parameters = {
      'APPID': Constants.Weather_App_Id,
      'units': 'metric',
      'q': cityName,
    };

    var uri = Uri.https(
        Constants.Weather_Map_Org, Constants.Weather_Data, parameters);

     log('request: ${uri.toString()}');

    var response = await http.get(uri);


    log('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}