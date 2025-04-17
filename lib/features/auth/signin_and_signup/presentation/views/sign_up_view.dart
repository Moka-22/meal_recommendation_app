import 'package:flutter/material.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/presentation/widgets/sign_up_view_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 34),
          child: Center(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: SignUpViewWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
