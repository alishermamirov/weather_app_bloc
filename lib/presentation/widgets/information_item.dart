
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:my_weather/data/constants/color_constants.dart';

class InformationItem extends StatelessWidget {
  const InformationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: BlurryContainer(
            color: blurContainerColor,
            borderRadius: BorderRadius.circular(24),
            height: 140,
            padding: EdgeInsets.symmetric(
                horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 24,
                  child: Image.asset(
                    "assets/images/Group 35.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "Nimadirlar",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "25°",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
