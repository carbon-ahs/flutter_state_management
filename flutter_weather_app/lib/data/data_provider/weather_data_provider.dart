import 'package:http/http.dart' as http;

import '../../secrets.dart';

class WeatherDataProvider {
  Future<String> getCurrentWeather(String cityName) async {
    try {
      String cityName = 'London';
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey',
        ),
      );

      final data = res.body;
      print("weatherDataProvider data: $data");
      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
