import 'package:my_weather/data/models/weather_model.dart';
import 'package:my_weather/logic/services/weather_api_service.dart';

class WeatherRepository {
  final WeatherApiService weatherApiService;

  WeatherRepository({required this.weatherApiService});

  Future<WeatherModel> getWeather(String city) async {
    return await weatherApiService.getWeather(city);
  }
}
