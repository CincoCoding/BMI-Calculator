import 'package:bmi_calculator/screens/CalculatorBrain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/gender_card.dart';
import '../constants.dart';
import '../components/counter_card.dart';
import '../components/BottomButton.dart';

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
  int kAge = 27;
  int weight = 95;
  int height = 178;

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
                          height.toString(),
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
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        // activeColor: Colors.red,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
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
                      textVariable: weight.toString(),
                      onPressed1: () {
                        setState(() {
                          weight--;
                        });
                      },
                      icon1: Icon(FontAwesomeIcons.minus),
                      onPressed2: () {
                        setState(() {
                          weight++;
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
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
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
    );
  }
}
