import 'package:flutter/material.dart';

import '../../../core/components/buttons.dart';
import '../../../core/constants/colors.dart';
import 'answer_choices.dart';

class QuizMultipleChoice extends StatefulWidget {
  const QuizMultipleChoice({super.key});

  @override
  State<QuizMultipleChoice> createState() => _QuizMultipleChoiceState();
}

class _QuizMultipleChoiceState extends State<QuizMultipleChoice> {
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> selectedAnswer = ValueNotifier("");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(24.0),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
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
          child: const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam accumsan sem ut ligula tempus, a vehicula dui ullamcorper. Nunc eget lacinia ',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 34.0),
        ValueListenableBuilder(
          valueListenable: selectedAnswer,
          builder: (context, state, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnswerChoices(
                label: 'Lorem ipsum 1',
                isSelected: state == 'Lorem ipsum 1',
                onChanged: (value) => selectedAnswer.value = value,
              ),
              const SizedBox(height: 16.0),
              AnswerChoices(
                label: 'Lorem ipsum 2',
                isSelected: state == 'Lorem ipsum 2',
                onChanged: (value) => selectedAnswer.value = value,
              ),
              const SizedBox(height: 16.0),
              AnswerChoices(
                label: 'Lorem ipsum 3',
                isSelected: state == 'Lorem ipsum 3',
                onChanged: (value) => selectedAnswer.value = value,
                answerCorrection: AnswerCorrection.none,
              ),
              const SizedBox(height: 16.0),
              AnswerChoices(
                label: 'Lorem ipsum 4',
                isSelected: state == 'Lorem ipsum 4',
                onChanged: (value) => selectedAnswer.value = value,
                answerCorrection: AnswerCorrection.selected,
              ),
            ],
          ),
        ),
        const SizedBox(height: 38.0),
        Button.filled(
          onPressed: () {},
          label: 'Selanjutnya',
        ),
      ],
    );
  }
}
