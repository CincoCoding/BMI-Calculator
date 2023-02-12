import 'package:bmi_calculator/components/calculator_brain.dart';
import 'package:bmi_calculator/components/counter_card_v2.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/heavenly_body_card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';

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

Map<CelestialObject, double> gravityFactor = {
  CelestialObject.sun: 274 / earthsGravity,
  CelestialObject.mercury: 3.7 / earthsGravity,
  CelestialObject.venus: 8.87 / earthsGravity,
  CelestialObject.earth: earthsGravity / earthsGravity,
  CelestialObject.moon: 1.62 / earthsGravity,
  CelestialObject.mars: 3.71 / earthsGravity,
  CelestialObject.jupiter: 24.92 / earthsGravity,
  CelestialObject.saturn: 10.44 / earthsGravity,
};

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  CelestialObject selectedCelestialObject;
  int weight = 180;

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
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                CounterCardTwoButtonsV2(
                  text: "WEIGHT",
                  textVariable: weight.toString(),
                  onPressed1: () {
                    setState(() {
                      weight--;
                    });
                  },
                  onLongPress1: () {
                    setState(() {
                      weight = weight - 10;
                    });
                  },
                  icon1: Icon(FontAwesomeIcons.minus),
                  onPressed2: () {
                    setState(() {
                      weight++;
                    });
                  },
                  onLongPress2: () {
                    setState(() {
                      weight = weight + 10;
                    });
                  },
                  icon2: Icon(FontAwesomeIcons.plus),
                  image: "images/blackSpace.png",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ReusableCard(
                      width: kButtonWidth,
                      onPress: () {
                        setState(() {
                          selectedCelestialObject = CelestialObject.sun;
                        });
                      },
                      color: selectedCelestialObject == CelestialObject.sun
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: HeavenlyBodyCard(
                          celestialObject: "SUN", image: "icons/sun.png"),
                    ),
                    ReusableCard(
                      width: kButtonWidth,
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
                          image: "icons/mercury.png"),
                    ),
                    ReusableCard(
                      width: kButtonWidth,
                      onPress: () {
                        setState(() {
                          selectedCelestialObject = CelestialObject.venus;
                        });
                      },
                      color: selectedCelestialObject == CelestialObject.venus
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: HeavenlyBodyCard(
                          celestialObject: "VENUS", image: "icons/venus.png"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ReusableCard(
                      width: kButtonWidth,
                      onPress: () {
                        setState(() {
                          selectedCelestialObject = CelestialObject.mars;
                        });
                      },
                      color: selectedCelestialObject == CelestialObject.mars
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: HeavenlyBodyCard(
                          celestialObject: "MARS", image: "icons/mars.png"),
                    ),
                    ReusableCard(
                      width: kButtonWidth,
                      onPress: () {
                        setState(() {
                          selectedCelestialObject = CelestialObject.jupiter;
                        });
                      },
                      color: selectedCelestialObject == CelestialObject.jupiter
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: HeavenlyBodyCard(
                          celestialObject: "JUPITER",
                          image: "icons/jupiter.png"),
                    ),
                    ReusableCard(
                      width: kButtonWidth,
                      onPress: () {
                        setState(() {
                          selectedCelestialObject = CelestialObject.saturn;
                        });
                      },
                      color: selectedCelestialObject == CelestialObject.saturn
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: HeavenlyBodyCard(
                          celestialObject: "SATURN", image: "icons/saturn.png"),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    CalculatorBrain calc = CalculatorBrain(
                        weight: weight.toDouble(),
                        gravityFactor: gravityFactor[selectedCelestialObject]);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsPage(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretation(),
                        ),
                      ),
                    );
                  },
                  child: BottomButton(title: "CALCULATE"),
                )
              ]),
        ),
      ],
    );
  }
}
