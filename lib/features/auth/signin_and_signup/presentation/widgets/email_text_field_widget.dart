import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recommendation/core/utils/app_strings.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/presentation/widgets/auth_form_field.dart';

class EmailTextFieldWidget extends StatelessWidget {
  final TextEditingController emailController;
  const EmailTextFieldWidget({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        AuthTextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return AppString.invalidEmailMessage;
            }
            return null;
          },
          text: AppString.emailAdd,
          prefixIcon: Icons.person,
          controller: emailController,
        )
      ],
    );
  }
}