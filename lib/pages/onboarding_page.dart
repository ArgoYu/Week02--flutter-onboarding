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
    // TODO(student):
    // 1) 如果不是最后一页，切到下一页（animateToPage）
    // 2) 如果是最后一页，跳转到 HomePage
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
              // TODO(student): 在 onPageChanged 更新 currentIndex
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
            // TODO(student): 当前页高亮，其余页灰色
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
    // TODO(student): 设计一个简单的首页占位界面
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(
        child: Text('TODO: Welcome to Home Page'),
      ),
    );
  }
}
