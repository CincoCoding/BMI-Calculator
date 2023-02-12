import 'package:flutter/cupertino.dart';

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

double earthsGravity = 9.798;

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
    if (_newWeight >= 25) {
      return 'Overweight';
    } else if (_newWeight > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_newWeight >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_newWeight >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
