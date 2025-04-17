import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recommendation/core/components/custom_button.dart';
import 'package:meals_recommendation/core/utils/app_strings.dart';
import 'package:meals_recommendation/core/utils/app_text_style.dart';
import 'package:meals_recommendation/core/utils/enum.dart';
import 'package:meals_recommendation/features/auth/otp/presentation/controller/bloc/otp_bloc.dart';

class OTPActions extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<TextEditingController> controllers;
  final String email;

  const OTPActions({
    super.key,
    required this.formKey,
    required this.controllers,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final otpBloc = context.read<OtpBloc>();

    return Column(
      children: [
        BlocBuilder<OtpBloc, OtpState>(
          buildWhen:
              (previous, current) =>
                  previous.verifyOtpStatus != current.verifyOtpStatus ||
                  previous.sendOtpStatus != current.sendOtpStatus,
          builder: (context, state) {
            bool isLoading =
                state.verifyOtpStatus == RequestState.loading ||
                state.sendOtpStatus == RequestState.loading;

            return isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: CustomButton(
                    text: AppString.continueButton,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final otp =
                            controllers
                                .map((controller) => controller.text)
                                .join();
                        otpBloc.add(VerifyOtpEvent(otp: otp));
                      }
                    },
                  ),
                );
          },
        ),

        SizedBox(height: 20.h),
        BlocBuilder<OtpBloc, OtpState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextButton(
                onPressed:
                    state.sendOtpStatus == RequestState.loading
                        ? null
                        : () {
                          otpBloc.add(SendOtpEvent(email: email));
                        },
                child: Text(
                  AppString.resendOtpText,
                  style: AppTextStyle.styleMedium14(
                    context,
                  ).copyWith(decoration: TextDecoration.underline),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
