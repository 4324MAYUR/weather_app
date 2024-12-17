import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_project/screen/weathermodal/weather_modal.dart';

class WeatherHelper {

  Future<WeatherResponse?> weatherAPI(String city) async {
    String link = "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=77b5664db751a5cd4ac74d421b8ab2be&units=metric";

       http.Response res = await http.get(Uri.parse(link));

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

         return WeatherResponse.fromJson(data);
       }
   }


}
