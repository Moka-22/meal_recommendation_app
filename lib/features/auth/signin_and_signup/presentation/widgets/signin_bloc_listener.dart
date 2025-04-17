import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_recommendation/core/app_routes/routes.dart';
import 'package:meals_recommendation/core/utils/app_colors.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/domain/entities/user_entity.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/presentation/controller/auth_cubit/cubit/auth_cubit.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/presentation/widgets/auth_button.dart';

class SigninBlocListener extends StatelessWidget {
  const SigninBlocListener({
    super.key,
    required this.emailController,
    required this.formkey,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final GlobalKey<FormState> formkey;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) {
        return current is SigninErrorState ||
            current is SigninSuccessState ||
            current is SigninLoadingState;
      },
      listener: (context, state) {
        if (state is SigninLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is SigninErrorState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.errorColor,
            ),
          );
        }
        if (state is SigninSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.successColor,
            ),
          );
          GoRouter.of(context).go(Routes.navigationBarView);
        }
      },
      child: AuthButton(
        text: "Signin",
        onPressed: () {
          if (formkey.currentState!.validate()) {
            context.read<AuthCubit>().signinUser(
                  UserEntity(
                      email: emailController.text,
                      password: passwordController.text,
                      name: ''),
                );
          }
        },
      ),
    );
  }
}