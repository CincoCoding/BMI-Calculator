import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class HeavenlyBodyCard extends StatelessWidget {
  HeavenlyBodyCard(
      {@required this.heavenlyTitle, @required this.heavenlyImage});
  final String heavenlyTitle;
  final String heavenlyImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(heavenlyImage, width: 100),
        SizedBox(
          height: 5.0,
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            heavenlyTitle,
            style: kLabelTextStyle.copyWith(color: Colors.black, fontSize: 20),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
