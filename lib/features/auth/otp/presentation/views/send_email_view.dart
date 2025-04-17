import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_recommendation/core/app_routes/routes.dart';
import 'package:meals_recommendation/core/components/logo_widget.dart';
import 'package:meals_recommendation/core/components/toast.dart';
import 'package:meals_recommendation/core/utils/app_colors.dart';
import 'package:meals_recommendation/core/utils/app_strings.dart';
import 'package:meals_recommendation/core/utils/enum.dart';
import 'package:meals_recommendation/features/auth/otp/presentation/controller/bloc/otp_bloc.dart';

class SendEmailView extends StatelessWidget {
  const SendEmailView({
    super.key,
    required this.emailText,
    required this.token,
  });
  final String emailText;
  final String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<OtpBloc, OtpState>(
          listener: (context, state) {
            if (state.sendOtpStatus == RequestState.success) {
              context.pushReplacement(
                Routes.otpView,
                extra: {'email': emailText, 'token': token},
              );
            }
            if (state.sendOtpStatus == RequestState.error) {
              showMessage(
                message: AppString.invalidEmailMessage,
                state: ToastStates.error,
                context: context,
              );
            }
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoWidget(),
                  Text(
                    textAlign: TextAlign.center,
                    'Sending otp \n Please wait...',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
