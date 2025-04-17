import 'package:flutter/material.dart';
import 'package:meals_recommendation/core/utils/app_colors.dart';
import 'package:meals_recommendation/core/utils/app_text_style.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.hidePassword = false,
    this.hintSize,
    this.validator,
    this.bordercolor,
    this.textcolor,
    this.suffixiconcolor,
    this.prefixcolor,
    this.hintcolor,
  });
  final Color? bordercolor;
  final Color? textcolor;
  final Color? suffixiconcolor;
  final Color? hintcolor;
  final Color? prefixcolor;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool hidePassword;
  final TextEditingController controller;
  final double? hintSize;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;
  void hidePass() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      style: AppTextStyle.styleRegular18(
        context,
      ).copyWith(color: widget.textcolor),
      controller: widget.controller,
      obscureText: widget.hidePassword ? obscureText : false,
      cursorColor: widget.textcolor ?? AppColors.subTitleColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),
        suffixIcon:
            widget.hidePassword
                ? IconButton(
                  icon: Icon(
                    obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: hidePass,
                )
                : null,
        prefixIcon: widget.prefixIcon,
        prefixIconColor: widget.prefixcolor ?? AppColors.subTitleColor,
        suffixIconColor: widget.suffixiconcolor ?? AppColors.subTitleColor,
        hintText: widget.hintText,
        hintStyle: AppTextStyle.styleRegular18(
          context,
        ).copyWith(fontSize: 20, color: AppColors.subTitleColor),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 1,
        color: widget.bordercolor ?? AppColors.subTitleColor,
      ),
    );
  }
}
