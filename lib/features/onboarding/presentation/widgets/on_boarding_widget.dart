import 'package:flutter/material.dart';
import 'package:meals_recommendation/core/utils/app_strings.dart';
import 'package:meals_recommendation/features/onboarding/presentation/widgets/dot_indicator_widget.dart';
import 'package:meals_recommendation/features/onboarding/presentation/widgets/on_boarding_page_view.dart';
import 'package:meals_recommendation/features/onboarding/presentation/widgets/text_button_widget.dart';

class OnBoardingWidget extends StatefulWidget {
  const OnBoardingWidget({super.key});

  @override
  State<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  late final PageController pageController;
  int currentPage = 0;
  static const int totalPages = 3;

  @override
  void initState() {
    super.initState();
    pageController =
        PageController()..addListener(() {
          setState(() {
            currentPage = pageController.page!.round();
          });
        });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (currentPage < totalPages - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to main app screen
      // Navigator.pushReplacement(...);
    }
  }

  void _onSkipPressed() {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Skip to main screen
      // Navigator.pushReplacement(...);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final buttonSpacing = constraints.maxHeight * 0.03;

        return Column(
          children: [
            // PageView Section
            Expanded(child: OnBoardingPageView(pageController: pageController)),
            SizedBox(height: buttonSpacing * .5),

            // Dots Indicator
            DotsIndicatorWidget(
              totalPages: totalPages,
              currentPage: currentPage,
            ),
            SizedBox(height: buttonSpacing),

            // Navigation Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButtonWidget(
                    onPressed: _onSkipPressed,
                    text:
                        currentPage > 0 && currentPage < totalPages
                            ? AppString.previousButton
                            : AppString.skipButton,
                  ),
                  TextButtonWidget(
                    onPressed: _onNextPressed,
                    text:
                        currentPage == totalPages - 1
                            ? AppString.registerText
                            : AppString.nextButton,
                  ),
                ],
              ),
            ),
            SizedBox(height: buttonSpacing * 1.5),
          ],
        );
      },
    );
  }
}



