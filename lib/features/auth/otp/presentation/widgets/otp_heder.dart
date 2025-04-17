import 'package:flutter/material.dart';
import 'package:meals_recommendation/core/components/logo_widget.dart';
import 'package:meals_recommendation/core/utils/app_strings.dart';
import 'package:meals_recommendation/core/utils/app_text_style.dart';

class OTPHeader extends StatelessWidget {
  const OTPHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        const LogoWidget(),
        SizedBox(height: mediaQuery.size.height * 0.01),
        Text(
          AppString.verifyText,
          style: AppTextStyle.styleBold26(context),
        ),
        SizedBox(height: mediaQuery.size.height * 0.01),
      ],
    );
  }
}
