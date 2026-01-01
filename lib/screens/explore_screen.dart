import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../data/planets.dart';
import '../widgets/header_image_card.dart';
import '../widgets/primary_button.dart';
import 'planet_details_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late final PageController _pageController;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goTo(int newIndex) {
    if (newIndex < 0 || newIndex >= planets.length) return;
    _pageController.animateToPage(
      newIndex,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final current = planets[_index];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 14),
              const HeaderImageCard(
                imageAsset: 'assets/images/Rectangle 4.png',
                topTitle: 'Explore',
                bottomTitle: 'Which planet\nwould you like to explore?',
              ),
              const SizedBox(height: 18),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: planets.length,
                  onPageChanged: (i) => setState(() => _index = i),
                  itemBuilder: (context, i) {
                    final p = planets[i];
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Image.asset(p.imageAsset, fit: BoxFit.contain),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ArrowButton(
                    icon: Icons.arrow_back,
                    onPressed: () => _goTo(_index - 1),
                  ),
                  Text(
                    current.name,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  _ArrowButton(
                    icon: Icons.arrow_forward,
                    onPressed: () => _goTo(_index + 1),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              PrimaryButton(
                title: 'Explore ${current.name}',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => PlanetDetailsScreen(planet: current),
                    ),
                  );
                },
              ),
              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  const _ArrowButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: CircleAvatar(
        radius: 18,
        backgroundColor: AppColors.red,
        child: Icon(icon, color: AppColors.white, size: 22),
      ),
    );
  }
}
