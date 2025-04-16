import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:meals_recommendation/core/utils/app_colors.dart';

class DotsIndicatorWidget extends StatelessWidget {
  const DotsIndicatorWidget({
    super.key,
    required this.totalPages,
    required this.currentPage,
  });

  final int totalPages;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: totalPages,
      position: currentPage.toDouble(),
      decorator: DotsDecorator(
        activeColor: AppColors.primaryColor,
        size: const Size(10, 10),
        activeSize: const Size(12, 12),
        spacing: const EdgeInsets.symmetric(horizontal: 4.0),
        color: AppColors.primaryColor.withValues(alpha: .5),
      ),
    );
  }
}
