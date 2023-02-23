import 'package:flutter/material.dart';

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

class CelestialObjectData {
  final CelestialObject celestialObject;
  final String celestialTitle;
  final String celestialImage;

  CelestialObjectData({
    @required this.celestialObject,
    @required this.celestialTitle,
    @required this.celestialImage,
  });
}

final sun = CelestialObjectData(
    celestialObject: CelestialObject.sun,
    celestialTitle: "SUN",
    celestialImage: "../icons/sun.png");

final venus = CelestialObjectData(
    celestialObject: CelestialObject.venus,
    celestialTitle: "VENUS",
    celestialImage: "../icons/venus.png");

final mercury = CelestialObjectData(
    celestialObject: CelestialObject.mercury,
    celestialTitle: "MERCURY",
    celestialImage: "../icons/mercury.png");

final earth = CelestialObjectData(
    celestialObject: CelestialObject.earth,
    celestialTitle: "EARTH",
    celestialImage: "../icons/earth.png");

final moon = CelestialObjectData(
    celestialObject: CelestialObject.moon,
    celestialTitle: "MOON",
    celestialImage: "../icons/moon.png");

final mars = CelestialObjectData(
    celestialObject: CelestialObject.mars,
    celestialTitle: "MARS",
    celestialImage: "../icons/mars.png");

final jupiter = CelestialObjectData(
    celestialObject: CelestialObject.jupiter,
    celestialTitle: "JUPITER",
    celestialImage: "../icons/jupiter.png");

final saturn = CelestialObjectData(
    celestialObject: CelestialObject.saturn,
    celestialTitle: "Saturn",
    celestialImage: "../icons/saturn.png");

final neptune = CelestialObjectData(
    celestialObject: CelestialObject.neptune,
    celestialTitle: "NEPTUNE",
    celestialImage: "../icons/neptune.png");

final uranus = CelestialObjectData(
    celestialObject: CelestialObject.uranus,
    celestialTitle: "URANUS",
    celestialImage: "../icons/uranus.png");

final internationalSpaceStation = CelestialObjectData(
    celestialObject: CelestialObject.sun,
    celestialTitle: "INTERNATIONAL SPACE STATION",
    celestialImage: "../icons/internationalSpaceStation.png");

final blackHole = CelestialObjectData(
    celestialObject: CelestialObject.blackHole,
    celestialTitle: "BLACK HOLE",
    celestialImage: "../icons/blackHole.png");
