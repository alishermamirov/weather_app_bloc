// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MainWeatherPart extends StatelessWidget {
  final String city;
  final String main;
  final double temp;
  final double temp_min;
  final double temp_max;
  const MainWeatherPart({
    Key? key,
    required this.city,
    required this.main,
    required this.temp,
    required this.temp_min,
    required this.temp_max,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [],
          ),
          SizedBox(
            height: 0,
          ),
          Text(
            city,
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          SizedBox(
            height: 76,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    temp.toStringAsFixed(0),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 120,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "°",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        main,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "Juma ${temp_max.toStringAsFixed(0)}°/${temp_min.toStringAsFixed(0)}°",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: -1,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
