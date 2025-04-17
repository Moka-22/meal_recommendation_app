import 'package:flutter/material.dart';
import 'package:meals_recommendation/core/app_routes/routes.dart';
import 'package:meals_recommendation/core/components/custom_text_field.dart';
import 'package:meals_recommendation/core/components/logo_widget.dart';
import 'package:meals_recommendation/core/functions/validate_input.dart';
import 'package:meals_recommendation/core/utils/app_strings.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/presentation/widgets/sign_up_bloc_listener.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/presentation/widgets/switch_auth_method.dart';

class SignUpViewWidget extends StatefulWidget {
  const SignUpViewWidget({super.key});

  @override
  State<SignUpViewWidget> createState() => _SignUpViewWidgetState();
}

class _SignUpViewWidgetState extends State<SignUpViewWidget> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController fullNameController;
  var formkey = GlobalKey<FormState>();
  var isObscure = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fullNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LogoWidget(),
          const SizedBox(height: 20),
          CustomTextField(
              validator: ValidateInput.validateUserName,
              hintText: "Full Name",
              controller: fullNameController,
              hidePassword: false),
          const SizedBox(height: 20),
          CustomTextField(
              validator: ValidateInput.validateEmail,
              hintText: "Email",
              controller: emailController,
              hidePassword: false),
          const SizedBox(height: 20),
          CustomTextField(
            validator: ValidateInput.validatePassword,
            hintText: "Password",
            controller: passwordController,
            hidePassword: true,
          ),
          const SizedBox(height: 20),
          SignUpBlocListener(
              formkey: formkey,
              fullNameController: fullNameController,
              emailController: emailController,
              passwordController: passwordController),
          const SizedBox(height: 20),
          const SwitchMethod(
            screen: Routes.signInView,
            message: AppString.haveAccText,
            method: AppString.loginText,
          ),
        ],
      ),
    );
  }
}