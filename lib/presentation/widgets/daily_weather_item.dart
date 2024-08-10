// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DailyWeatherItem extends StatelessWidget {
  final String time;
  final String temp;
  final String icon;
  const DailyWeatherItem({
    super.key,
    required this.time,
    required this.temp,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            time,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          SizedBox(
            child: Image.asset(
              "assets/images/$icon.png",
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "$temp°",
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
