// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

import 'package:my_weather/data/constants/color_constants.dart';

class InformationItem extends StatelessWidget {
  final String icon;
  final String title;
  final String desc;
  final String trailing;
  const InformationItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.desc,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: BlurryContainer(
            color: blurContainerColor,
            borderRadius: BorderRadius.circular(24),
            height: 140,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    icon,
                    fit: BoxFit.cover,
                    color: Colors.white,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      desc,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      trailing,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
