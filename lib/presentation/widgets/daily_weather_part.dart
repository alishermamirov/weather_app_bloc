import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_weather/data/constants/color_constants.dart';

import 'package:my_weather/data/models/hourly_weather_model.dart';
import 'package:my_weather/presentation/widgets/daily_weather_item.dart';

class DailyWeatherPart extends StatelessWidget {
  final List<HourlyWeatherModel> hourWeather;

  const DailyWeatherPart({
    super.key,
    required this.hourWeather,
  });



  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: BlurryContainer(
        color: blurContainerColor,
        borderRadius: BorderRadius.circular(24),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              7,
              (index) {
                final weather = hourWeather[index];
                String time = DateFormat("HH:mm").format(
                    DateTime.fromMillisecondsSinceEpoch(
                        hourWeather[index].date * 1000));
                return DailyWeatherItem(
                  icon: weather.icon,
                  time: time,
                  temp: weather.tempMax.toStringAsFixed(0),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
