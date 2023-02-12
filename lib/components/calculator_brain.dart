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
