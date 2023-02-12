import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class HeavenlyBodyCard extends StatelessWidget {
  HeavenlyBodyCard({@required this.celestialObject, @required this.image});
  final String celestialObject;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(image, width: 100),
        SizedBox(
          height: 5.0,
        ),
        Text(
          celestialObject,
          style: kLabelTextStyle.copyWith(color: Colors.black, fontSize: 20),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
