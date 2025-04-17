import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_recommendation/core/app_routes/routes.dart';
import 'package:meals_recommendation/core/components/custom_text_field.dart';
import 'package:meals_recommendation/core/components/logo_widget.dart';
import 'package:meals_recommendation/core/functions/validate_input.dart';
import 'package:meals_recommendation/core/utils/app_strings.dart';
import 'package:meals_recommendation/core/utils/app_text_style.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/presentation/widgets/signin_bloc_listener.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/presentation/widgets/switch_auth_method.dart';

class SigninViewWidget extends StatefulWidget {
  const SigninViewWidget({super.key});

  @override
  State<SigninViewWidget> createState() => _SigninViewWidgetState();
}

class _SigninViewWidgetState extends State<SigninViewWidget> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  var formkey = GlobalKey<FormState>();
  var isObscure = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          const LogoWidget(),
          const SizedBox(height: 20),
          CustomTextField(
            validator: ValidateInput.validateEmail,
            hintText: "Email",
            controller: emailController,
            hidePassword: false,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            validator: ValidateInput.validatePassword,
            hintText: "Password",
            controller: passwordController,
            hidePassword: true,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                GoRouter.of(context).go(Routes.forgetPasswordView);
              },
              child: Text(
                AppString.forgetPassText,
                style: AppTextStyle.styleMedium14(context),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          SigninBlocListener(
            emailController: emailController,
            formkey: formkey,
            passwordController: passwordController,
          ),
          SizedBox(height: 20.h),
          const SwitchMethod(
            screen: Routes.signUpView,
            message: AppString.noAccount,
            method: AppString.signUpText,
          ),
        ],
      ),
    );
  }
}
