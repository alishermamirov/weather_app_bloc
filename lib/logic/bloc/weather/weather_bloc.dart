import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import 'package:my_weather/data/models/weather_model.dart';
import 'package:my_weather/logic/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({
    required this.weatherRepository,
  }) : super(WeatherInitial()) {
    on<getWeatherEvent>(_getWeather);
  }

  Future<void> _getWeather(
      getWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
    
      final city = event.city;
      final weather =await weatherRepository.getWeather(city!);
      emit(WeatherLoaded(weather: weather));
    } catch (e) {
      emit(WeatherError(message: e.toString()));
    }
  }
 
}
