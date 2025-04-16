import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meals_recommendation/core/utils/app_colors.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.subTitle,
    required this.title,
    required this.image,
  });

  final String image;
  final String subTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageHeight = constraints.maxHeight * 0.5;
        final titleSpacing = constraints.maxHeight * 0.05;
        final subtitleSpacing = constraints.maxHeight * 0.03;
        return Column(
          children: [
            // Image Section
            SizedBox(
              width: double.infinity,
              height: imageHeight,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: SvgPicture.asset(image, fit: BoxFit.contain),
                  ),
                ],
              ),
            ),

            // Title Section
            SizedBox(height: titleSpacing),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: constraints.maxHeight * 0.04,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textColor,
                ),
              ),
            ),

            // Subtitle Section
            SizedBox(height: subtitleSpacing),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37),
              child: Text(
                subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: constraints.maxHeight * 0.02,
                  color: AppColors.subTitleColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
