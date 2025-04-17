import 'package:flutter/material.dart';
import 'package:meals_recommendation/core/utils/app_colors.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const AuthButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 57,
      child: ElevatedButton(
        onPressed: onPressed,
        style: const ButtonStyle(),
        child: Text(
          text,
          style: const TextStyle(
              color: AppColors.textColor,
              fontSize: 21,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}