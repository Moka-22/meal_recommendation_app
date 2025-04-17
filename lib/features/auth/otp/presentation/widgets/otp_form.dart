import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recommendation/features/auth/otp/presentation/widgets/otp_input_field.dart';

class OTPForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<TextEditingController> controllers;
  final FocusNode firstFieldFocus;

  const OTPForm({
    super.key,
    required this.formKey,
    required this.controllers,
    required this.firstFieldFocus,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child:
                    index == 0
                        ? Focus(
                          focusNode: firstFieldFocus,
                          child: OtpInputField(
                            controller: controllers[0],
                            lastIndex: 0,
                          ),
                        )
                        : OtpInputField(
                          controller: controllers[index],
                          lastIndex: index,
                        ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
