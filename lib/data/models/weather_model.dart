// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_weather/data/models/hourly_weather_model.dart';

class WeatherModel {
  final String id;
  final String currentMain;
  final String currentDesc;
  final String currentIcon;
  final double currentpressure;
  final double currentHumidity;
  final double currentVisibility;
  final double currentWindSpeed;
  final double currentTemp;
  final double currentTempMax;
  final double currentTempMin;
  final double currentTempFeelsLike;
  final double sunrise;
  final double sunset;
  final String city;
  final List<HourlyWeatherModel> hourlyData;
  WeatherModel({
    required this.id,
    required this.currentMain,
    required this.currentDesc,
    required this.currentIcon,
    required this.currentpressure,
    required this.currentHumidity,
    required this.currentVisibility,
    required this.currentWindSpeed,
    required this.currentTemp,
    required this.currentTempMax,
    required this.currentTempMin,
    required this.currentTempFeelsLike,
    required this.sunrise,
    required this.sunset,
    required this.city,
    required this.hourlyData,
  });
}
