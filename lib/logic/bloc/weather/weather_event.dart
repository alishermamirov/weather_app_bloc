part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class getWeatherEvent extends WeatherEvent{
  final String? city;

  getWeatherEvent({ this.city});
}