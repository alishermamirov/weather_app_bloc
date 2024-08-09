import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:my_weather/data/constants/color_constants.dart';
import 'package:my_weather/presentation/widgets/weekly_weather_list_item.dart';

class WeeklyWeatherPart extends StatelessWidget {
  const WeeklyWeatherPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      color: blurContainerColor,
      borderRadius: BorderRadius.circular(24),
      child: Column(
        children: List.generate(
          7,
          (index) {
            return WeeklyWeatherListItem(
              day: "${index + 1}-kun",
            );
          },
        ),
      ),
    );
  }
}
