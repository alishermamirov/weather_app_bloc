import 'package:flutter/material.dart';
import 'package:my_weather/presentation/widgets/information_item.dart';

class WeatherInformationPart extends StatelessWidget {
  const WeatherInformationPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        3,
        (index) {
          return const Row(
            children: [
              InformationItem(),
              SizedBox(
                width: 8,
              ),
              InformationItem(),
            ],
          );
        },
      ),
    );
  }
}
