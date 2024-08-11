import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_weather/logic/bloc/weather/weather_bloc.dart';
import 'package:my_weather/presentation/screens/city_manage_screen.dart';
import 'package:my_weather/presentation/widgets/daily_weather_part.dart';
import 'package:my_weather/presentation/widgets/main_weather_part.dart';
import 'package:my_weather/presentation/widgets/weather_information_part.dart';
import 'package:my_weather/presentation/widgets/weekly_weather_part.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() async {
  
    context.read<WeatherBloc>().add(getWeatherEvent(city:  "Jizzax"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocConsumer<WeatherBloc, WeatherState>(listener: (context, state) {
        if (state is WeatherError) {
          print(state.message);
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Xatolik"),
                content: Text(state.message),
              );
            },
          );
        }
      }, builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeatherLoaded) {
          final weather = state.weather;

          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bgimage.png"),
                fit: BoxFit.cover,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: DraggableHome(
                alwaysShowLeadingAndAction: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      print("tap");
                      Navigator.of(context)
                          .pushNamed(CityManageScreen.routeName);
                    },
                    icon: const Icon(
                      Icons.manage_search_rounded,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ),
                ],
                backgroundColor: Colors.transparent,
                appBarColor: Colors.transparent,
                title: AppBar(
                  centerTitle: true,
                  title: Text(
                    weather.city,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  backgroundColor: Colors.transparent,
                ),
                headerWidget: MainWeatherPart(
                  city: weather.city,
                  main: weather.currentMain,
                  temp: weather.currentTemp,
                  temp_min: weather.currentTempFeelsLike,
                  temp_max: weather.currentTempMax,
                ),
                headerExpandedHeight: 0.5,
                body: [
                  DailyWeatherPart(
                    hourWeather: weather.hourlyData,
                  ),
                  WeeklyWeatherPart(
                    weather: weather.hourlyData,
                  ),
                  WeatherInformationPart(
                    weather: weather,
                  )
                ]),
          );
        } else {
          return const SizedBox(
            child: Text("Nimadir"),
          );
        }
      }),
    );
  }
}
