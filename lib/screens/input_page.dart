import 'package:bmi_calculator/screens/CalculatorBrain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/gender_card.dart';
import '../constants.dart';
import '../components/counter_card.dart';
import '../components/BottomButton.dart';

enum CelestialObject {
  sun,
  mercury,
  venus,
  earth,
  moon,
  mars,
  jupiter,
  saturn,
  uranus,
  neptune,
  blackHole
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  CelestialObject selectedCelestialObject;
  int kAge = 27;
  int weight = 95;
  int height = 178;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/blueSpace.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Center(
              child: Text('SPACE CALCULATOR',
                  style: kLabelTextStyle.copyWith(color: Colors.white)),
            ),
          ),
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                    child: Row(
                  children: <Widget>[
                    ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedCelestialObject = CelestialObject.mercury;
                        });
                      },
                      color: selectedCelestialObject == CelestialObject.mercury
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: HeavenlyBodyCard(
                          celestialObject: "MERCURY",
                          image: "icons/icons8-planet-60.png"),
                    ),
                    ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedCelestialObject = CelestialObject.venus;
                        });
                      },
                      color: selectedCelestialObject == CelestialObject.venus
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: HeavenlyBodyCard(
                          celestialObject: "VENUS",
                          image: "icons/icons8-planet-60.png"),
                    ),
                    ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedCelestialObject = CelestialObject.earth;
                        });
                      },
                      color: selectedCelestialObject == CelestialObject.earth
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: HeavenlyBodyCard(
                          celestialObject: "EARTH",
                          image: "icons/icons8-earth-128(-xxxhdpi).png"),
                    ),
                  ],
                ))
              ]),
        ),
      ],
    );
  }
}
