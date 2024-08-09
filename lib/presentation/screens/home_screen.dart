import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/logic/bloc/weather/weather_bloc.dart';
import 'package:my_weather/logic/repositories/weather_repository.dart';
import 'package:my_weather/presentation/widgets/daily_weather_part.dart';
import 'package:my_weather/presentation/widgets/main_weather_part.dart';
import 'package:my_weather/presentation/widgets/weather_information_part.dart';
import 'package:my_weather/presentation/widgets/weekly_weather_part.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _opacity = 1;
  double _appbarOpacity = 0;

  void toggleOpacity() {
    setState(() {
      _opacity = 0;
      _appbarOpacity = 1;
    });
  }

  void reverseOpacity() {
    setState(() {
      _opacity = 1;
      _appbarOpacity = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(getWeatherEvent(city: "Jizzax"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocConsumer<WeatherBloc, WeatherState>(listener: (context, state) {
        if (state is WeatherError) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Xatolik"),
                content: Text(state.message),
              );
            },
          );
        }
      }, builder: (context, state) {
        if (state is WeatherLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is WeatherLoaded) {
          final weather = state.weather;
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Image.png"),
                fit: BoxFit.cover,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                PreferredSize(
                  preferredSize: Size(MediaQuery.of(context).size.width, 64),
                  child: BlurryContainer(
                    blur: 1,
                    child: AppBar(
                      centerTitle: true,
                      title: AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: _appbarOpacity,
                        child: Text(
                          weather.city,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                      actions: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ),
                SlidingUpPanel(
                  parallaxOffset: 1,
                  parallaxEnabled: true,
                  minHeight: 350,
                  maxHeight: MediaQuery.of(context).size.height - 110,
                  color: Colors.transparent,
                  border: Border.all(color: Colors.transparent),
                  boxShadow: const [BoxShadow(color: Colors.transparent)],
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  onPanelOpened: () {
                    toggleOpacity();
                  },
                  onPanelClosed: () {
                    reverseOpacity();
                  },
                  body: MainWeatherPart(
                    opacity: _opacity,
                    city: weather.city,
                    main: weather.currentMain,
                    temp: weather.currentTemp,
                    temp_min: weather.currentTempFeelsLike,
                    temp_max: weather.currentTempMax,
                  ),
                  panelBuilder: (sc) {
                    return SingleChildScrollView(
                      controller: sc,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            DailyWeatherPart(),
                            const SizedBox(
                              height: 16,
                            ),
                            WeeklyWeatherPart(),
                            const SizedBox(
                              height: 16,
                            ),
                            WeatherInformationPart()
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        } else {
          return SizedBox(
            child: Text("Nimadir"),
          );
        }
      }),
    );
  }
}
