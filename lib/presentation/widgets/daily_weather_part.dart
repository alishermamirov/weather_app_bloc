import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:my_weather/presentation/widgets/daily_weather_item.dart';

class DailyWeatherPart extends StatelessWidget {
  const DailyWeatherPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      color: const Color.fromRGBO(27, 66, 99, 40),
      borderRadius: BorderRadius.circular(24),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            24,
            (index) {
              String time = index < 10 ? "0$index:00" : "$index:00";
              return DailyWeatherItem(
                time: time,
                temp: "${index + 10}",
              );
            },
          ),
        ),
      ),
    );
  }
}
