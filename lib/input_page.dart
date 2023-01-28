import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'gender_card.dart';

const CardColor = Color(0xFF1D1E33);
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF999999);
const bottomContainerColor = Color(0xFFEB1555);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: Row(children: <Widget>[
            Expanded(
              child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                color: selectedGender == Gender.male
                    ? activeCardColor
                    : inactiveCardColor,
                cardChild: GenderCard(
                  gender: "MALE",
                  icon: FontAwesomeIcons.mars,
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                color: selectedGender == Gender.female
                    ? activeCardColor
                    : inactiveCardColor,
                cardChild: GenderCard(
                  gender: 'FEMALE',
                  icon: FontAwesomeIcons.venus,
                ),
              ),
            ),
          ]),
        ),
        Expanded(
          child: ReusableCard(color: CardColor),
        ),
        Expanded(
          child: Row(children: <Widget>[
            Expanded(
              child: ReusableCard(color: CardColor),
            ),
            Expanded(
              child: ReusableCard(color: CardColor),
            ),
          ]),
        ),
      ]),
    );
  }
}
