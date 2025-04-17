import 'package:flutter/material.dart';
import 'package:meals_recommendation/core/utils/app_images.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 134,
      child: Image.asset(AppImages.logo),
    );
  }
}
