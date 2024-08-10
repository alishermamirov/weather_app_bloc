import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_weather/data/constants/contants.dart';
import 'package:my_weather/data/models/hourly_weather_model.dart';
import 'package:my_weather/data/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:my_weather/logic/services/weather_exceptions.dart';

class WeatherApiService {
  final http.Client client;

  WeatherApiService({required this.client});

  Future<WeatherModel> getWeather(String city) async {
    final currentWeatherUrl =
        Uri.parse("${baseUrl}q=$city&units=metric&appid=$ApiKey");
    final hourlyWeatherUrl =
        Uri.parse("${hourly}q=$city&units=metric&appid=$ApiKey");
    try {
      final response = await client.get(currentWeatherUrl);
      final response2 = await client.get(hourlyWeatherUrl);
      if (response.statusCode >= 400) {
        throw WeatherExceptions(message: response.reasonPhrase.toString());
      }

      if (response2.statusCode >= 400) {
        throw WeatherExceptions(message: response2.reasonPhrase.toString());
      }
      if (jsonDecode(response.body) == null &&
          jsonDecode(response2.body) == null) {
        throw WeatherExceptions(message: "Ma'lumot olinmadi");
      }
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final hourlyData = jsonDecode(response2.body) as Map<String, dynamic>;
      final List hourlyWeather = hourlyData["list"];

      final List<HourlyWeatherModel> _hourWeather = [];

      // for (var i = 0; i < hourlyWeather.length; i++) {
      //   print(hourlyWeather[i]["dt"]);
      //   print(hourlyWeather[i]["main"]["temp_max"]);
      //   print(hourlyWeather[i]["main"]["temp_min"]);
      //   print(hourlyWeather[i]element["weather"]);
      //   // print(hourlyWeather[i]["weather"]["main"].toString());
      //   print("niimadir");
      // }
      for (var element in hourlyWeather) {
        _hourWeather.add(
          HourlyWeatherModel(
            id: UniqueKey().toString(),
            date: int.parse(element["dt"].toString()),
            tempMax: double.parse((element["main"]["temp_max"]).toString()),
            main: element["weather"][0]["main"],
            desc: element["weather"][0]["description"],
            icon: element["weather"][0]["icon"],
          ),
        );
      }

      final weatherData = data["weather"][0];
      final maindData = data["main"];
      final weather = WeatherModel(
          id: weatherData["id"].toString(),
          currentMain: weatherData["main"].toString(),
          currentDesc: weatherData["description"].toString(),
          currentIcon: weatherData["icon"].toString(),
          currentHumidity: double.parse(maindData["humidity"].toString()),
          currentVisibility: double.parse(data["visibility"].toString()),
          currentWindSpeed: double.parse(data["wind"]["speed"].toString()),
          currentTemp: double.parse(maindData["temp"].toString()),
          currentTempMax: double.parse(maindData["temp_max"].toString()),
          currentTempMin: double.parse(maindData["temp_min"].toString()),
          currentTempFeelsLike:
              double.parse(maindData["feels_like"].toString()),
          sunrise: double.parse(data["sys"]["sunrise"].toString()),
          sunset: double.parse(data["sys"]["sunset"].toString()),
          city: city,
          hourlyData: _hourWeather);
      return weather;
    } catch (e) {
      rethrow;
    }
  }
}
