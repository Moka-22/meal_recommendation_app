import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recommendation/core/components/custom_button.dart';
import 'package:meals_recommendation/core/functions/show_snack_bar.dart';
import 'package:meals_recommendation/core/utils/app_colors.dart';
import 'package:meals_recommendation/core/utils/app_strings.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/domain/entities/user_entity.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/presentation/controller/auth_cubit/cubit/auth_cubit.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/presentation/widgets/email_text_field_widget.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/presentation/widgets/header_text.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              const HeaderWidget(),
              SizedBox(height: 30.h),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: EmailTextFieldWidget(emailController: emailController),
              ),
              SizedBox(height: 20.h),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is ResetPasswordLoadingState) {
                    showDialog(
                      context: context,
                      builder:
                          (context) =>
                              const Center(child: CircularProgressIndicator()),
                    );
                  }
                  if (state is ResetPasswordSuccessState) {
                    Navigator.pop(context);
                    authSnackBar(
                      context: context,
                      message: state.message,
                      color: AppColors.successColor,
                    );
                  }
                  if (state is ResetPasswordErrorState) {
                    Navigator.pop(context);
                    authSnackBar(
                      context: context,
                      message: state.message,
                      color: AppColors.errorColor,
                    );
                  }
                },
                child: CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthCubit>().resetUserPassword(
                        UserEntity(
                          email: emailController.text,
                          password: '',
                          name: '',
                        ),
                      );
                    }
                  },
                  text: AppString.sendCodeButton,
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
