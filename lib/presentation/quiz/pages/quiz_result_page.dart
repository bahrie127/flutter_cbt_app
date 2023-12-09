import 'package:flutter/material.dart';
import 'package:flutter_cbt_app/core/extensions/build_context_ext.dart';


import '../../../core/assets/assets.gen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/custom_scaffold.dart';
import '../../../core/constants/colors.dart';
import '../models/quiz_model.dart';
import '../widgets/quiz_available_card.dart';
import '../widgets/quiz_result_last.dart';

class QuizResultPage extends StatelessWidget {
  const QuizResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    const paddingHorizontalSize = 16.0;
    const paddingHorizontal =
        EdgeInsets.symmetric(horizontal: paddingHorizontalSize);

    final List<QuizModel> datas = [
      QuizModel(
        image: Assets.images.materi1.path,
        name: 'Tes Angka',
        type: 'Multiple Choice',
        description:
            'Tes angka adalah suatu jenis tes psikometri yang dirancang untuk mengukur kemampuan individu dalam memahami, menganalisis, dan menyelesaikan masalah yang melibatkan angka dan matematika.',
        duration: 30,
        kategori: 'Numeric'
      ),
      QuizModel(
        image: Assets.images.materi2.path,
        name: 'Tes Logika',
        type: 'Multiple Choice',
        description:
            'Tes logika adalah metode evaluasi yang digunakan untuk mengukur kemampuan seseorang dalam berpikir secara logis, analitis, dan rasional',
        duration: 30,
        kategori: 'Logika',
      ),
      QuizModel(
        image: Assets.images.materi1.path,
        name: 'Tes Verbal',
        type: 'Multiple Choice',
        description:
            'Tes verbal adalah suatu metode evaluasi yang digunakan untuk mengukur kemampuan seseorang dalam menggunakan dan memahami bahasa lisan atau tertulis.',
        duration: 30,
        kategori: 'Verbal',
      ),
    ];

    return CustomScaffold(
      appBarTitle: const Text('Hasil Tes'),
      body: ListView(
        children: [
          const SizedBox(height: 30.0),
          const Padding(
            padding: paddingHorizontal,
            child: QuizResultLast(),
          ),
          const SizedBox(height: 40.0),
          const Padding(
            padding: paddingHorizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tes yang Tersedia',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
                horizontal: paddingHorizontalSize - 8.0),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: datas
                  .map((item) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: QuizAvailableCard(data: item),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 30.0),
        ],
      ),
      bottomNavigationBar: Container(
        color: AppColors.white,
        padding: const EdgeInsets.all(16.0),
        child: Button.filled(
          onPressed: () => context.popToRoot(),
          label: 'Kembali ke Beranda',
        ),
      ),
    );
  }
}
