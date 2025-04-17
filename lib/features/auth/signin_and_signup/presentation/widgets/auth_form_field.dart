import 'package:flutter/material.dart';
import 'package:meals_recommendation/core/utils/app_colors.dart';

class AuthTextFormField extends StatelessWidget {
  final String text;
  final IconData prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final IconButton? suffixion;
  final bool isObscure;
  final String? Function(String?)? validator;

  const AuthTextFormField({
    super.key,
    required this.text,
    required this.prefixIcon,
    this.keyboardType,
    required this.controller,
    this.isObscure = false,
    this.validator,
    this.suffixion,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      obscureText: isObscure,
      controller: controller,
      cursorColor: AppColors.textColor,
      style: const TextStyle(color: AppColors.textColor),
      decoration: InputDecoration(
        suffixIcon: suffixion,
        hintText: text,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 17),
        hintStyle: const TextStyle(
            color: AppColors.textColor, fontSize: 18, fontWeight: FontWeight.w400),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: AppColors.subTitleColor, width: 1)),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: AppColors.subTitleColor, width: 1)),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: AppColors.errorColor, width: 1)),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: AppColors.subTitleColor, width: 1)),
        prefixIcon: Icon(
          prefixIcon,
          size: 28,
          color: AppColors.subTitleColor,
        ),
      ),
    );
  }
}