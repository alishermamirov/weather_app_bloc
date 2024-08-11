import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/data/constants/color_constants.dart';
import 'package:my_weather/logic/bloc/weather/weather_bloc.dart';

class CityManageScreen extends StatefulWidget {
  const CityManageScreen({super.key});
  static const routeName = "/city-manage";

  @override
  State<CityManageScreen> createState() => _CityManageScreenState();
}

class _CityManageScreenState extends State<CityManageScreen> {
  TextEditingController textController = TextEditingController();
  void getData(String city) {
    context.read<WeatherBloc>().add(getWeatherEvent(city: city));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blurContainerColor,
      appBar: AppBar(
        title: const Text("Shahar qo'shish"),
        actions: [
          AnimSearchBar(
            width: MediaQuery.of(context).size.width,
            textController: textController,
            onSuffixTap: () {
              setState(() {
                textController.clear();
              });
            },
            onSubmitted: (value) {
              print(value);
              getData(value.trim().toString());
            },
          )
        ],
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) async {
          if (state is WeatherError) {
            await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Xatolik"),
                  content: Text(state.message),
                );
              },
            );
            getData("Jizzax");
          }
        },
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            final weather = state.weather;
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  height: 190,
                  margin: const EdgeInsets.all(16),
                  child: CustomPaint(
                    size: Size(MediaQuery.of(context).size.width, 190),
                    painter: RPSCustomPainter(),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 22.0, bottom: 16.0, right: 22.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${weather.currentTemp.toStringAsFixed(0)}°",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 56,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                  width: 144,
                                  height: 144,
                                  child: Image.asset(
                                    "assets/images/Moon cloud mid rain.png",
                                    fit: BoxFit.cover,
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                weather.city,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                weather.currentMain,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const SizedBox(
              child: Text("Nimadir"),
            );
          }
        },
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 74, 49, 160)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.2525000);
    path_0.quadraticBezierTo(size.width * 0.0018750, size.height * -0.0025000,
        size.width * 0.1550000, size.height * 0.0350000);
    path_0.cubicTo(
        size.width * 0.3837500,
        size.height * 0.1212500,
        size.width * 0.6625000,
        size.height * 0.2362500,
        size.width * 0.8912500,
        size.height * 0.3225000);
    path_0.quadraticBezierTo(size.width * 1.0056250, size.height * 0.3887500,
        size.width * 1.0012500, size.height * 0.5350000);
    path_0.quadraticBezierTo(size.width, size.height * 0.6400000, size.width,
        size.height * 0.7575000);
    path_0.quadraticBezierTo(size.width * 0.9975000, size.height * 1.0087500,
        size.width * 0.8750000, size.height * 1.0025000);
    path_0.quadraticBezierTo(size.width * 0.3543750, size.height * 0.9987500,
        size.width * 0.1300000, size.height);
    path_0.quadraticBezierTo(size.width * -0.0031250, size.height * 0.9962500,
        0, size.height * 0.7550000);

    canvas.drawPath(path_0, paint_fill_0);

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
