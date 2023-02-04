import 'package:flutter/material.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
            style: kLabelTextStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    'Your Result',
                    style: kBigNumber,
                  ),
                ),
                Container(
                  color: Colors.grey[900],
                  padding: EdgeInsets.only(
                      top: kSizedBoxHeight, bottom: kSizedBoxHeight),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Overweight", style: kLabelTextStyle),
                      SizedBox(height: 10),
                      Text("26.7", style: kBigNumber),
                      SizedBox(height: 10),
                      Text(
                          "You have a higher than normal body weight. Try to Exercise more!",
                          style: kLabelTextStyle),
                    ],
                  ),
                ),
                Container(
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
              ]),
        ),
      ]),
    );
  }
}
