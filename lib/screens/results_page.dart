import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/BottomButton.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 10.0, top: 25.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Your Result",
                    style: kBigNumber,
                  ))),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Overweight :(",
                      style: kLabelTextStyle.copyWith(
                        color: Colors.green,
                        fontSize: 35,
                      ),
                    ),
                    Text(
                      "35.0",
                      style: kBigNumber.copyWith(
                        fontSize: 100,
                      ),
                    ),
                    Text(
                      "you're too damn wide.",
                      style: kLabelTextStyle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 30),
                    ),
                  ]),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop((context));
            },
            child: BottomButton(
              title: "RECALCULATE",
            ),
          ),
        ],
      ),
    );
  }
}
