import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class OnboardingIndicator extends StatelessWidget {
  final int length;
  final int currentPage;

  const OnboardingIndicator({
    super.key,
    required this.length,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: 10,
            width: currentPage == index ? 20 : 10,
            decoration: BoxDecoration(
              color: currentPage == index ? AppColors.primary : AppColors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
          );
        },
      ),
    );
  }
}
