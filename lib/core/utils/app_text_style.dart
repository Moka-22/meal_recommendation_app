import 'package:flutter/material.dart';
import 'package:meals_recommendation/core/utils/app_colors.dart';

abstract class AppTextStyle {
  static TextStyle styleBold13(BuildContext context) {
    return TextStyle(
      fontSize: getResponsive(context, fontSize: 13),
      fontWeight: FontWeight.w700,
      color: const Color(0xff001A3F),
    );
  }

  static TextStyle styleBold14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsive(context, fontSize: 14),
      fontWeight: FontWeight.w700,
      color: const Color(0xff001A3F),
    );
  }

  static TextStyle styleBold17(BuildContext context) {
    return TextStyle(
      fontSize: getResponsive(context, fontSize: 17),
      fontWeight: FontWeight.w700,
      color: const Color(0xff001A3F),
    );
  }

  static TextStyle styleBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsive(context, fontSize: 20),
      fontWeight: FontWeight.w700,
      color: const Color(0xff001A3F),
    );
  }

  static TextStyle styleBold21(BuildContext context) {
    return TextStyle(
      fontSize: getResponsive(context, fontSize: 21),
      fontWeight: FontWeight.w700,
      color: const Color(0xff001A3F),
    );
  }

  static TextStyle styleBold24(BuildContext context) {
    return TextStyle(
      fontSize: getResponsive(context, fontSize: 24),
      fontWeight: FontWeight.w700,
      color: Colors.black,
      letterSpacing: 0.7,
    );
  }

  static TextStyle styleBold26(BuildContext context) {
    return TextStyle(
      fontSize: getResponsive(context, fontSize: 26),
      fontWeight: FontWeight.w700,
      color: AppColors.textColor,
    );
  }

  static TextStyle styleRegular18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsive(context, fontSize: 18),
      fontWeight: FontWeight.w400,
      color: AppColors.textColor,
    );
  }

  static TextStyle styleRegular20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsive(context, fontSize: 20),
      fontWeight: FontWeight.w400,
      color: const Color(0xffADADAD),
    );
  }

  static TextStyle styleMedium18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsive(context, fontSize: 18),
      fontWeight: FontWeight.w500,
      color: const Color(0xffFFFFFF),
    );
  }

  static TextStyle styleMedium11(BuildContext context) {
    return TextStyle(
      fontSize: getResponsive(context, fontSize: 11),
      fontWeight: FontWeight.w500,
      color: const Color(0xffFFFFFF),
    );
  }

  static TextStyle styleMedium14(BuildContext context) {
    return TextStyle(
      height: 1.5,
      fontSize: getResponsive(context, fontSize: 14),
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
    );
  }
}

double getResponsive(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = scaleFactor * fontSize;
  double lowerLimit = responsiveFontSize * 0.8;
  double upperLimit = responsiveFontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}
