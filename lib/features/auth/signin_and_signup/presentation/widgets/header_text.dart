import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recommendation/core/utils/app_strings.dart';
import 'package:meals_recommendation/core/utils/app_text_style.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.forgetPassText,
          style: AppTextStyle.styleBold26(context),
        ),
        Text(
          AppString.enterEmailForVerify,
          style: AppTextStyle.styleMedium14(context),
        ),
      ],
    );
  }
}
