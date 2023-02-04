import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'gender_card.dart';
import 'constants.dart';
import 'counter_card.dart';

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
        title: Center(
          child: Text('BMI CALCULATOR',
              style: kLabelTextStyle.copyWith(color: Colors.white)),
        ),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
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
                        ? kActiveCardColor
                        : kInactiveCardColor,
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
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderCard(
                      gender: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              child: ReusableCard(
                color: kCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: kLabelTextStyle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          kHeight.toString(),
                          style: kBigNumber,
                        ),
                        Text("cm", style: kLabelTextStyle),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFFBDBE98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Colors.blue,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20),
                      ),
                      child: Slider(
                        value: kHeight.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        // activeColor: Colors.red,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            kHeight = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CounterCardTwoButtons(
                      text: "WEIGHT",
                      textVariable: kWeight.toString(),
                      onPressed1: () {
                        setState(() {
                          kWeight--;
                        });
                      },
                      icon1: Icon(FontAwesomeIcons.minus),
                      onPressed2: () {
                        setState(() {
                          kWeight++;
                        });
                      },
                      icon2: Icon(FontAwesomeIcons.plus),
                    ),
                  ),
                  Expanded(
                    child: CounterCardTwoButtons(
                      text: "AGE",
                      textVariable: kAge.toString(),
                      onPressed1: () {
                        setState(() {
                          kAge--;
                        });
                      },
                      icon1: Icon(FontAwesomeIcons.minus),
                      onPressed2: () {
                        setState(() {
                          kAge++;
                        });
                      },
                      icon2: Icon(FontAwesomeIcons.plus),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed((context), '/results');
              },
              child: Container(
                child: Center(
                  child: Text(
                    "CALCUATE",
                    style: kLabelTextStyle.copyWith(
                        color: Colors.white, fontSize: 50),
                  ),
                ),
                color: Color(0xFFEB1555),
                padding: EdgeInsets.only(bottom: 10.0),
              ),
            )
          ]),
    );
  }
}
