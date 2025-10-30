import 'dart:convert';

import 'package:flutter_weather_app/data/data_provider/weather_data_provider.dart';
import 'package:flutter_weather_app/data/models/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);

  Future<WeatherModel> getCurrentWeatherModel() async {
    try {
      String cityName = 'London';
      final weatherData = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }
      print("weather repository:  $data");

      // final weatherModel = WeatherModel.fromJson(data);
      final weatherModelFromMap = WeatherModel.fromMap(data);

      print("weatherModelFromMap:  $weatherModelFromMap");

      return weatherModelFromMap;
    } catch (e) {
      throw e.toString();
    }
  }
}
