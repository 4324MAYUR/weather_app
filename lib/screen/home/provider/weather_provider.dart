import 'package:flutter/material.dart';
 import 'package:weather_project/helper/weather_helper.dart';
import 'package:weather_project/screen/weathermodal/weather_modal.dart';

class WeatherProvider with ChangeNotifier {
  WeatherResponse? weatherData;
  String city = "";
   String bookMark = "";

  Future<void> getData() async {
    WeatherHelper helper = WeatherHelper();
      final response = await helper.weatherAPI(city);
        weatherData = response;
       notifyListeners();
   }
}
