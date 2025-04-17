import 'package:flutter/material.dart';
import 'package:meals_recommendation/core/utils/app_strings.dart';
import 'package:meals_recommendation/core/utils/app_text_style.dart';

class OTPSubtitle extends StatelessWidget {
  final String email;

  const OTPSubtitle({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Text(
      "${AppString.otpSubTitle} ($email)",
      textAlign: TextAlign.center,
      style: AppTextStyle.styleMedium14(context),
    );
  }
}
