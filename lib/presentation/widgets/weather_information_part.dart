import 'package:flutter/material.dart';
import 'package:my_weather/presentation/widgets/information_item.dart';

class WeatherInformationPart extends StatelessWidget {
  const WeatherInformationPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
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
      ),
    );
  }
}
