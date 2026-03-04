import 'package:flutter/material.dart';

import '../models/onboarding_item.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({
    super.key,
    required this.item,
  });

  final OnboardingItem item;

  @override
  Widget build(BuildContext context) {
    // TODO(student): Build this card using the model fields (image, title,
    // description) instead of hard-coded placeholder text.
    // Match the README expectation of clean Flutter layout structure:
    // - keep a Column-based hierarchy
    // - use SizedBox for spacing
    // - keep the visual container styled and readable
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 240,
            width: 240,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: const Text('TODO(student): Render item.image here'),
          ),
          const SizedBox(height: 24),
          Text(
            'TODO(student): Render item.title here',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'TODO(student): Render item.description here',
            style: TextStyle(fontSize: 16, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
