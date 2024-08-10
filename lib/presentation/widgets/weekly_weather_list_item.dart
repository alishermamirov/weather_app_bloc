// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WeeklyWeatherListItem extends StatelessWidget {
  final String day;
  final String main;
  final String icon;
  final double tempMax;

  const WeeklyWeatherListItem({
    super.key,
    required this.day,
    required this.main,
    required this.icon,
    required this.tempMax,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 70,
      leading: Text(
        day,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      title: Row(
        children: [
          SizedBox(
            width: 30,
            child: Image.asset(
              "assets/images/$icon.png",
              fit: BoxFit.cover,
            ),
          ),
          Text(
            main,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
      trailing: Text(
        "${tempMax.toStringAsFixed(0)}°",
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
