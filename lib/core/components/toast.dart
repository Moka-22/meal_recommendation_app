import 'package:flutter/material.dart';

void showMessage({
  required String message,
  required ToastStates state,
  required BuildContext context,
}) => ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    duration: const Duration(seconds: 5),
    behavior: SnackBarBehavior.floating,
    backgroundColor: chooseToastColor(state),
    showCloseIcon: true,
    closeIconColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    content: Container(
      padding: const EdgeInsets.all(5),
      child: Text(
        message,
        // style: AppStyles.white500TextSize14,
      ),
    ),
  ),
);
Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = const Color.fromARGB(255, 130, 100, 13);
      break;
    case ToastStates.white:
      color = Colors.white;
      break;
    case ToastStates.primary:
      color = Colors.indigo;
      break;
  }
  return color;
}

enum ToastStates { success, error, warning, white, primary }
