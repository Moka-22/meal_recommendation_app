import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_recommendation/core/app_routes/routes.dart';
import 'package:meals_recommendation/core/utils/app_colors.dart';
import 'package:meals_recommendation/core/utils/app_strings.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/domain/entities/user_entity.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/presentation/controller/auth_cubit/cubit/auth_cubit.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/presentation/widgets/auth_button.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({
    super.key,
    required this.formkey,
    required this.fullNameController,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formkey;
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpErrorState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: AppColors.errorColor,
            ),
          );
        }
        if (state is SignUpSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.successColor,
            ),
          );
          
          GoRouter.of(context).go(
            Routes.sendEmailView,
            extra: {'email': emailController.text, 'token': state.token},
          );
        }
        if (state is SignUpLoadingState) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder:
                (context) => const Center(child: CircularProgressIndicator()),
          );
        }
      },
      child: AuthButton(
        text: AppString.signUpText,
        onPressed: () {
          if (formkey.currentState!.validate()) {
            context.read<AuthCubit>().signUpUser(
              UserEntity(
                name: fullNameController.text,
                email: emailController.text,
                password: passwordController.text,
              ),
            );
          }
        },
      ),
    );
  }
}
