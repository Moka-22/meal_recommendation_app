import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_recommendation/core/utils/app_colors.dart';

class SwitchMethod extends StatelessWidget {
  final String message;
  final String method;
  final String screen;

  const SwitchMethod({
    super.key,
    required this.message,
    required this.method,
    required this.screen,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: const TextStyle(color: AppColors.textColor, fontSize: 12),
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).go(screen);
          },
          child: Text(
            method,
            style: const TextStyle(color: AppColors.textColor),
          ),
        ),
      ],
    );
  }
}
