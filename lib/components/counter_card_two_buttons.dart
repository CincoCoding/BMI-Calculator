import 'package:flutter/material.dart';
import '../constants.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundIconButton extends StatelessWidget {
  // var kWeight = 0;
  RoundIconButton({
    @required this.icon,
    @required this.onPressed,
    @required this.onLongPress,
  });

  final IconData icon;
  final Function onPressed;
  final Function onLongPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 100.0,
      onPressed: onPressed,
      onLongPress: onLongPress,
      shape: CircleBorder(),
      child: Icon(
        icon,
        color: Colors.white,
        size: 35.0,
      ),
      fillColor: Colors.blue,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}

class CounterCardTwoButtons extends StatelessWidget {
  CounterCardTwoButtons({
    @required this.onPressed1,
    @required this.onLongPress1,
    this.icon1,
    @required this.onPressed2,
    @required this.onLongPress2,
    this.icon2,
    this.text,
    this.textVariable,
  });

  final String text;
  final textVariable;
  final Function onPressed1;
  final Function onLongPress1;

  final Icon icon1;
  final Function onPressed2;
  final Function onLongPress2;

  final Icon icon2;

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: kLabelTextStyle,
          ),
          Text(
            textVariable + "lb",
            style: kBigNumber,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RoundIconButton(
                icon: FontAwesomeIcons.minus,
                onPressed: onPressed1,
                onLongPress: onLongPress1,
              ),
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: onPressed2,
                onLongPress: onLongPress2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
