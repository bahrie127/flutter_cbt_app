import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cbt_app/core/extensions/build_context_ext.dart';
import 'package:flutter_cbt_app/data/models/responses/materi_response_model.dart';

import '../../../core/constants/colors.dart';
import '../models/materi_model.dart';
import '../pages/materi_detail_page.dart';

class MateriCard extends StatelessWidget {
  final Materi data;
  const MateriCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          MateriDetailPage(data: data),
        );
      },
      child: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    data.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  child: CachedNetworkImage(
                    imageUrl: data.image,
                    placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              data.content,
              style: const TextStyle(
                fontSize: 14,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
