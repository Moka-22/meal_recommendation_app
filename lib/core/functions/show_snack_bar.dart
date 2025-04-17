import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> authSnackBar({
  required BuildContext context,
  required String message,
  required Color color,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: ShapeBorder.lerp(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        1,
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      duration: const Duration(seconds: 4),
      backgroundColor: color,
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(16),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
