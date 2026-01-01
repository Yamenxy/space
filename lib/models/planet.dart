import 'package:flutter/foundation.dart';

@immutable
class Planet {
  const Planet({
    required this.name,
    required this.heroTitle,
    required this.imageAsset,
    required this.about,
    required this.distanceFromSunKm,
    required this.lengthOfDayHours,
    required this.orbitalPeriodEarthYears,
    required this.radiusKm,
    required this.massKg,
    required this.gravity,
    required this.surfaceAreaKm2,
  });

  final String name;
  final String heroTitle;
  final String imageAsset;

  final String about;

  final double distanceFromSunKm;
  final double lengthOfDayHours;
  final double orbitalPeriodEarthYears;
  final double radiusKm;
  final double massKg;
  final double gravity;
  final double surfaceAreaKm2;
}
