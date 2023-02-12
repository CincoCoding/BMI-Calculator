import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({
    this.bmiResult,
    this.resultText,
    this.interpretation,
    @required this.color,
    this.width,
    this.cardChild,
    this.onPress,
    this.onLongPress,
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;

  final Color color;
  double width;
  final Widget cardChild;
  final Function onPress;
  final Function onLongPress;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "images/blueSpace.jpg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Space Calculator"),
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(width: double.infinity, height: 10),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 115, 0),
                  padding: EdgeInsets.only(left: 10.0, top: 0.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Your Result",
                    style: kBigNumber.copyWith(fontSize: 50),
                  ),
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/blackSpace.png'),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    // color: Colors.blue,
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: GestureDetector(
                        onTap: onPress,
                        onLongPress: onLongPress,
                        child: Container(
                          width: width,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  resultText,
                                  style: kLabelTextStyle.copyWith(
                                    color: Colors.green,
                                    fontSize: 60,
                                  ),
                                ),
                                Text(
                                  bmiResult + "lb",
                                  style: kBigNumber.copyWith(
                                    fontSize: 80,
                                  ),
                                ),
                                Text(
                                  interpretation,
                                  style: kLabelTextStyle.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 30),
                                ),
                              ]),
                          margin: EdgeInsets.all(15.0),
                          padding: EdgeInsets.all(20.0),
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/blackSpace.png'),
                              fit: BoxFit.cover,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            // color: Colors.blue,
                          ),
                        ))),
                GestureDetector(
                  onTap: () {
                    Navigator.pop((context));
                  },
                  child: BottomButton(
                    title: "RECALCULATE",
                  ),
                ),
                SizedBox(height: 15, width: double.infinity)
              ]))
    ]);
  }
}
