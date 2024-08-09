// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DailyWeatherItem extends StatelessWidget {
  final String time;
  final String temp;
  const DailyWeatherItem({
    super.key,
    required this.time,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            time,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 34,
            child: Image.asset(
              "assets/images/Moon cloud mid rain.png",
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "$temp°",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
