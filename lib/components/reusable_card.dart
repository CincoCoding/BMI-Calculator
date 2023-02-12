import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({
    @required this.color,
    this.width,
    this.cardChild,
    this.onPress,
    this.onLongPress,
  });

  final Color color;
  double width;
  final Widget cardChild;
  final Function onPress;
  final Function onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      onLongPress: onLongPress,
      child: Container(
        width: width,
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
