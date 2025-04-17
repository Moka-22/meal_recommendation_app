import 'package:flutter/material.dart';
import 'package:meals_recommendation/core/utils/app_colors.dart';
import 'package:meals_recommendation/core/utils/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color backgroundColor;
  final double? fontSizeText;
  final FontWeight? fontWeightText;
  final Function()? onPressed;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.backgroundColor,
    this.textColor = AppColors.textColor,
    this.fontWeightText,
    this.fontSizeText,
  });
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width;
    return MaterialButton(
      minWidth: double.infinity,
      height: height * 0.16,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
      color: backgroundColor,
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyle.styleBold21(context).copyWith(
          color: textColor,
          fontSize: fontSizeText,
          fontWeight: fontWeightText,
        ),
      ),
    );
  }
}
