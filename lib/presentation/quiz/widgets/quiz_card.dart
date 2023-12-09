import 'package:flutter/material.dart';
import 'package:flutter_cbt_app/core/extensions/build_context_ext.dart';

import '../../../core/constants/colors.dart';
import '../models/quiz_model.dart';
import '../pages/quiz_start_page.dart';
// import '../pages/quiz_start_page.dart';

class QuizCard extends StatefulWidget {
  final QuizModel data;
  const QuizCard({super.key, required this.data});

  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(QuizStartPage(data: widget.data));
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
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
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: Image.asset(
                widget.data.image,
                width: 145.0,
                height: 160.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8.0),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.data.type,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 14.0),
                  Text(
                    widget.data.description,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
