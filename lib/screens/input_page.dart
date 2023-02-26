import 'package:bmi_calculator/components/calculator_brain.dart';
import 'package:bmi_calculator/components/counter_card_v2.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/heavenly_body_card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/celestial_body_data.dart';

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
  internationalSpaceStation,
  blackHole,
  ufo,
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
  CelestialObject.neptune: 1 / earthsGravity,
  CelestialObject.uranus: 1 / earthsGravity,
  CelestialObject.internationalSpaceStation: 0.00,
  CelestialObject.blackHole: double.infinity,
  CelestialObject.ufo: 0.00,
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
                    buildCelestialCard(
                      celestialObject: CelestialObject.sun,
                      celestialObjectImage: "icons/sun.png",
                      celestialObjectName: "SUN",
                    ),
                    buildCelestialCard(
                      celestialObject: CelestialObject.mercury,
                      celestialObjectImage: "icons/mercury.png",
                      celestialObjectName: "MERCURY",
                    ),
                    buildCelestialCard(
                      celestialObject: CelestialObject.earth,
                      celestialObjectImage: "icons/earth.png",
                      celestialObjectName: "EARTH",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildCelestialCard(
                      celestialObject: CelestialObject.moon,
                      celestialObjectImage: "icons/moon.png",
                      celestialObjectName: "MOON",
                    ),
                    buildCelestialCard(
                      celestialObject: CelestialObject.mars,
                      celestialObjectImage: "icons/mars.png",
                      celestialObjectName: "MARS",
                    ),
                    buildCelestialCard(
                      celestialObject: CelestialObject.jupiter,
                      celestialObjectImage: "icons/jupiter.png",
                      celestialObjectName: "JUPITER",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildCelestialCard(
                      celestialObject: CelestialObject.saturn,
                      celestialObjectImage: "icons/saturn.png",
                      celestialObjectName: "SATURN",
                    ),
                    buildCelestialCard(
                      celestialObject: CelestialObject.neptune,
                      celestialObjectImage: "icons/neptune.png",
                      celestialObjectName: "NEPTUNE",
                    ),
                    buildCelestialCard(
                      celestialObject: CelestialObject.uranus,
                      celestialObjectImage: "icons/uranus.png",
                      celestialObjectName: "URANUS",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildCelestialCard(
                      celestialObject:
                          CelestialObject.internationalSpaceStation,
                      celestialObjectImage:
                          "icons/internationalSpaceStation.png",
                      celestialObjectName: "ISS",
                    ),
                    buildCelestialCard(
                      celestialObject: CelestialObject.blackHole,
                      celestialObjectImage: "icons/blackHole.png",
                      celestialObjectName: "BLACK HOLE",
                    ),
                    buildCelestialCard(
                      celestialObject: CelestialObject.ufo,
                      celestialObjectImage: "icons/ufo.png",
                      celestialObjectName: "UFO",
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
                          color: null,
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

  ReusableCard buildCelestialCard(
      {@required CelestialObject celestialObject,
      @required String celestialObjectName,
      @required String celestialObjectImage}) {
    return ReusableCard(
      width: kButtonWidth,
      onPress: () => _selectCelestialObject(celestialObject),
      color: selectedCelestialObject == celestialObject
          ? kActiveCardColor
          : kInactiveCardColor,
      cardChild: HeavenlyBodyCard(
          heavenlyTitle: celestialObjectName,
          heavenlyImage: celestialObjectImage),
    );
  }

  void _selectCelestialObject(CelestialObject celestialObject) {
    setState(() {
      selectedCelestialObject = celestialObject;
    });
  }
}
