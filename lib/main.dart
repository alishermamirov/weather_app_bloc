import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart';
import 'package:my_weather/logic/bloc/weather/weather_bloc.dart';
import 'package:my_weather/logic/repositories/weather_repository.dart';
import 'package:my_weather/logic/services/weather_api_service.dart';
import 'package:my_weather/presentation/screens/city_manage_screen.dart';
import 'package:my_weather/presentation/screens/home_screen.dart';

main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(
          weatherApiService: WeatherApiService(client: Client())),
      child: MultiBlocProvider(
        providers: [
        
          BlocProvider(
            create: (context) => WeatherBloc(
              
                weatherRepository: context.read<WeatherRepository>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: GoogleFonts.openSans().fontFamily),
          routes: {
            CityManageScreen.routeName: (context) => const CityManageScreen(),
          },
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
