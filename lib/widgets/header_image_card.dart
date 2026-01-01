import 'package:flutter/material.dart';

import '../app_theme.dart';

class HeaderImageCard extends StatelessWidget {
  const HeaderImageCard({
    super.key,
    required this.imageAsset,
    required this.topTitle,
    required this.bottomTitle,
    this.showBack = false,
    this.onBack,
  });

  final String imageAsset;
  final String topTitle;
  final String bottomTitle;
  final bool showBack;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(imageAsset, fit: BoxFit.cover),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xAA0E0E0E),
                    Color(0x000E0E0E),
                    Color(0xCC0E0E0E),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 12,
              left: 12,
              right: 12,
              child: Row(
                children: [
                  if (showBack)
                    InkWell(
                      onTap: onBack,
                      borderRadius: BorderRadius.circular(20),
                      child: const CircleAvatar(
                        radius: 18,
                        backgroundColor: AppColors.red,
                        child: Icon(Icons.arrow_back, size: 20),
                      ),
                    )
                  else
                    const SizedBox(width: 36),
                  const Spacer(),
                  Text(
                    topTitle,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 36),
                ],
              ),
            ),
            Positioned(
              left: 16,
              bottom: 16,
              right: 16,
              child: Text(
                bottomTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
