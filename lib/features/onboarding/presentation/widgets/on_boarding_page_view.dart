import 'package:flutter/material.dart';
import 'package:meals_recommendation/core/utils/app_images.dart';
import 'package:meals_recommendation/core/utils/app_strings.dart';
import 'package:meals_recommendation/features/onboarding/presentation/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return PageView(
          controller: pageController,
          children: [
            PageViewItem(
              subTitle: AppString.onBoarding1Body,
              title: AppString.onBoarding1Title,
              image: AppImages.onBoarding1,
            ),
            PageViewItem(
              subTitle: AppString.onBoarding2Body,
              title: AppString.onBoarding2Title,
              image: AppImages.onBoarding2,
            ),
            PageViewItem(
              subTitle: AppString.onBoarding3Body,
              title: AppString.onBoarding3Title,
              image: AppImages.onBoarding3,
            ),
          ],
        );
      },
    );
  }
}
