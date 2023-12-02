import 'package:flutter/material.dart';

import '../models/onboarding_model.dart';

class OnboardingContent extends StatelessWidget {
  final PageController pageController;
  final void Function(int index) onPageChanged;
  final List<OnboardingModel> contents;

  const OnboardingContent({
    super.key,
    required this.pageController,
    required this.onPageChanged,
    required this.contents,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        itemCount: contents.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Image.asset(
                    contents[index].image,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  contents[index].text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
