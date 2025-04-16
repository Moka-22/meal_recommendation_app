import 'package:flutter/material.dart';

import 'package:meals_recommendation/features/onboarding/presentation/widgets/on_boarding_widget.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: OnBoardingWidget()));
  }
}
