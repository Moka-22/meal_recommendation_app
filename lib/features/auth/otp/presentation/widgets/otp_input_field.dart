import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recommendation/core/utils/app_colors.dart';

class OtpInputField extends StatelessWidget {
  final TextEditingController controller;
  final int lastIndex;

  const OtpInputField({
    super.key,
    required this.controller,
    required this.lastIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: 70.w,
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          if (value.length == 1 && lastIndex != 3) {
            FocusScope.of(context).nextFocus();
          }
        },
        validator: (value) => value!.isEmpty ? '' : null,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.textColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.backgroundColor,
          contentPadding: EdgeInsets.zero,
          border: outLineInput(color: AppColors.subTitleColor),
          enabledBorder: outLineInput(color: AppColors.subTitleColor),
          focusedBorder: outLineInput(color: AppColors.textColor, width: 2),
          errorBorder: outLineInput(color: AppColors.errorColor, width: 3),
        ),
      ),
    );
  }
}

OutlineInputBorder outLineInput({required Color color, double width = 1}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide(color: color, width: width.w),
  );
}
