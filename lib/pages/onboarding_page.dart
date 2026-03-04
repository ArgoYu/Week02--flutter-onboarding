import 'package:flutter/material.dart';

import '../data/onboarding_data.dart';
import '../widgets/onboarding_card.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  int currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool get isLastPage => currentIndex == onboardingItems.length - 1;

  void _onNextPressed() {
    // TODO(student): Implement button behavior required by the README flow.
    // 1) If this is NOT the last page, call `animateToPage` to move forward.
    // 2) If this IS the last page, navigate to `HomePage` with Navigator.
    // 3) Keep transition duration/curve user-friendly (e.g. 250-350ms, ease).
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Onboarding')),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingItems.length,
              // TODO(student): Use `onPageChanged` to update `currentIndex`
              // with `setState`, so the indicator and button label stay synced.
              itemBuilder: (context, index) {
                return OnboardingCard(item: onboardingItems[index]);
              },
            ),
          ),
          const SizedBox(height: 12),
          _IndicatorRow(
            count: onboardingItems.length,
            currentIndex: currentIndex,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onNextPressed,
                child: Text(isLastPage ? 'Get Started' : 'Next'),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _IndicatorRow extends StatelessWidget {
  const _IndicatorRow({
    required this.count,
    required this.currentIndex,
  });

  final int count;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: isActive ? 22 : 8,
          decoration: BoxDecoration(
            // TODO(student): Style active vs inactive indicators clearly.
            // Active dot: primary/accent color.
            // Inactive dot: neutral grey.
            color: Colors.grey,
            borderRadius: BorderRadius.circular(999),
          ),
        );
      }),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(student): Replace this placeholder with a simple "Home" screen.
    // The goal is to confirm onboarding completion and provide a clear
    // landing state after tapping "Get Started".
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(
        child: Text('TODO(student): Welcome to Home Page'),
      ),
    );
  }
}
