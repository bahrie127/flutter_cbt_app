import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../core/constants/colors.dart';
import 'result_value.dart';

class QuizResultLast extends StatelessWidget {
  const QuizResultLast({super.key});

  @override
  Widget build(BuildContext context) {
    const correct = 23;
    const wrong = 12;
    const totalQuestion = correct + wrong;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Hasil Tes Terakhir',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16.0),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            shadows: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.14),
                blurRadius: 17,
                offset: const Offset(0, 8),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            children: [
              const Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Semua Tes',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 18.0),
                    ResultValue.correct(correct),
                    SizedBox(height: 18.0),
                    ResultValue.wrong(wrong),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    CircularStepProgressIndicator(
                      totalSteps: totalQuestion,
                      currentStep: correct,
                      stepSize: 10,
                      selectedColor: AppColors.green,
                      unselectedColor: AppColors.primary,
                      padding: 0,
                      width: 140,
                      height: 140,
                      selectedStepSize: 24,
                      unselectedStepSize: 24,
                      roundedCap: (_, __) => true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
