import 'package:flutter/cupertino.dart';
import 'celestial_body_data.dart';

class CalculatorBrain {
  CalculatorBrain(
      {this.celestialObject, @required this.weight, this.gravityFactor});

  final CelestialObject celestialObject;
  final double weight;
  final double gravityFactor;

  double _newWeight;

  String calculateBMI() {
    // pow is for exponentiation
    _newWeight = weight * gravityFactor;
    return _newWeight.toStringAsFixed(1);
  }

  String getResult() {
    if (_newWeight > weight) {
      return 'Heavier! ';
    } else if (_newWeight == weight) {
      return 'Same Weight';
    } else {
      return 'Lighter!';
    }
  }

  String getInterpretation() {
    if (_newWeight > weight) {
      return 'Watch your step! Be careful not to fall it will hurt much more!';
    } else if (_newWeight == weight) {
      return 'You still weight the same... You must still be on Earth!';
    } else {
      return 'Jump and enjoy your slow descent! Be careful not to disconnect your space suit!';
    }
  }
}
