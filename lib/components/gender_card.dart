import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class HeavenlyBodyCard extends StatelessWidget {
  HeavenlyBodyCard({@required this.celestialObject, @required this.image});
  final String celestialObject;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(image),
        SizedBox(
          height: 15.0,
        ),
        Text(
          celestialObject,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
