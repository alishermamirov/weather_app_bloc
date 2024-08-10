import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:my_weather/data/constants/color_constants.dart';
import 'package:my_weather/data/models/hourly_weather_model.dart';
import 'package:my_weather/presentation/widgets/weekly_weather_list_item.dart';

class WeeklyWeatherPart extends StatelessWidget {
  final List<HourlyWeatherModel> weather;
  const WeeklyWeatherPart({
    super.key,
    required this.weather,
  });

  List<HourlyWeatherModel> getweekly() {
    var date = DateFormat("yyyy MMMM dd HH")
        .format(DateTime.parse("2060-02-27 02:00"));
    return weather.where((element) {
      if (DateFormat("yyyy MMMM dd").format(
                  DateTime.fromMillisecondsSinceEpoch(element.date * 1000)) !=
              date &&
          DateFormat("HH").format(
                  DateTime.fromMillisecondsSinceEpoch(element.date * 1000)) ==
              DateFormat("HH").format(DateTime.parse("2060-02-27 11:00"))) {
        date = DateFormat("yyyy MMMM dd")
            .format(DateTime.fromMillisecondsSinceEpoch(element.date * 1000));
        return true;
      }
      return false;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: BlurryContainer(
        color: blurContainerColor,
        borderRadius: BorderRadius.circular(24),
        child: Column(
          children: List.generate(
            getweekly().length,
            (index) {
              final _weather = getweekly()[index];
              final day = DateFormat("EEE").format(
                  DateTime.fromMillisecondsSinceEpoch(_weather.date * 1000));
              return WeeklyWeatherListItem(
                day: day,
                icon: _weather.icon,
                main: _weather.main,
                tempMax: _weather.tempMax,
              );
            },
          ),
        ),
      ),
    );
  }
}
