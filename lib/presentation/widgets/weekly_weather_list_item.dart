// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WeeklyWeatherListItem extends StatelessWidget {
  final String day;
  const WeeklyWeatherListItem({
    Key? key,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 70,
      leading: Text(
        day,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
      title: Row(
        children: [
          SizedBox(
            width: 30,
            child: Image.asset(
              "assets/images/Moon cloud mid rain.png",
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "Yomg'irli",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "33°",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            "/",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Text(
            "25°",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
