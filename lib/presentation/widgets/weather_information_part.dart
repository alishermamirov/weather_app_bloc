// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_weather/data/models/weather_model.dart';
import 'package:my_weather/presentation/widgets/information_item.dart';

class WeatherInformationPart extends StatelessWidget {
  final WeatherModel weather;
  const WeatherInformationPart({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(children: [
        Row(
          children: [
            InformationItem(
              icon: 'assets/images/thermometer.png',
              title: 'kabi seziladi',
              desc: weather.currentTempFeelsLike.toStringAsFixed(0),
              trailing: "°",
            ),
            SizedBox(
              width: 8,
            ),
            InformationItem(
              icon: 'assets/images/wind.png',
              title: "Shamol tezligi",
              desc: weather.currentWindSpeed.toStringAsFixed(0),
              trailing: "m/s",
            ),
          ],
        ),
        Row(
          children: [
            InformationItem(
              icon: 'assets/images/humidity.png',
              title: 'Namlik',
              desc: weather.currentHumidity.toStringAsFixed(0),
              trailing: "%",
            ),
            SizedBox(
              width: 8,
            ),
            InformationItem(
              icon: 'assets/images/uv.png',
              title: "UV",
              desc: weather.currentWindSpeed.toStringAsFixed(0),
              trailing: "",
            ),
          ],
        ),
        Row(
          children: [
            InformationItem(
              icon: 'assets/images/visibility.png',
              title: "Ko'ruvchanlik",
              desc: weather.currentVisibility.toStringAsFixed(0),
              trailing: "m",
            ),
            SizedBox(
              width: 8,
            ),
            InformationItem(
              icon: 'assets/images/pressure.png',
              title: "Havo bosimi",
              desc: weather.currentpressure.toStringAsFixed(0),
              trailing: "hPa",
            ),
          ],
        ),
      ]),
    );
  }
}
