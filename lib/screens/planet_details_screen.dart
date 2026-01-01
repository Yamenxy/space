import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../models/planet.dart';
import '../widgets/header_image_card.dart';

class PlanetDetailsScreen extends StatelessWidget {
  const PlanetDetailsScreen({super.key, required this.planet});

  final Planet planet;

  String _formatNumber(double value) {
    final isInt = value == value.roundToDouble();
    if (isInt) return value.toStringAsFixed(0);
    return value.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 14),
              HeaderImageCard(
                imageAsset: 'assets/images/Frame 1.png',
                topTitle: planet.name,
                bottomTitle: planet.heroTitle,
                showBack: true,
                onBack: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: 18),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    color: AppColors.background,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Image.asset(
                                planet.imageAsset,
                                height: 220,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'About',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            planet.about,
                            style: TextStyle(
                              color: AppColors.white.withValues(alpha: 0.7),
                              height: 1.35,
                            ),
                          ),
                          const SizedBox(height: 14),
                          _InfoLine(
                            label: 'Distance from Sun (km):',
                            value: _formatNumber(planet.distanceFromSunKm),
                          ),
                          _InfoLine(
                            label: 'Length of Day (hours):',
                            value: _formatNumber(planet.lengthOfDayHours),
                          ),
                          _InfoLine(
                            label: 'Orbital Period (Earth years):',
                            value: _formatNumber(
                              planet.orbitalPeriodEarthYears,
                            ),
                          ),
                          _InfoLine(
                            label: 'Radius (km):',
                            value: _formatNumber(planet.radiusKm),
                          ),
                          _InfoLine(
                            label: 'Mass (kg):',
                            value: planet.massKg.toStringAsExponential(3),
                          ),
                          _InfoLine(
                            label: 'Gravity (m/s²):',
                            value: _formatNumber(planet.gravity),
                          ),
                          _InfoLine(
                            label: 'Surface Area (km²):',
                            value: planet.surfaceAreaKm2.toStringAsExponential(
                              2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoLine extends StatelessWidget {
  const _InfoLine({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$label ',
              style: TextStyle(
                color: AppColors.white.withValues(alpha: 0.7),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
