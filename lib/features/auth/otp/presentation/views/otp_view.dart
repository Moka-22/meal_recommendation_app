import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_recommendation/core/app_routes/routes.dart';
import 'package:meals_recommendation/core/components/toast.dart';
import 'package:meals_recommendation/core/di/services_locator.dart';
import 'package:meals_recommendation/core/utils/app_strings.dart';
import 'package:meals_recommendation/core/utils/enum.dart';
import 'package:meals_recommendation/features/auth/otp/presentation/controller/bloc/otp_bloc.dart';
import 'package:meals_recommendation/features/auth/otp/presentation/widgets/otp_actions.dart';
import 'package:meals_recommendation/features/auth/otp/presentation/widgets/otp_form.dart';
import 'package:meals_recommendation/features/auth/otp/presentation/widgets/otp_heder.dart';
import 'package:meals_recommendation/features/auth/otp/presentation/widgets/otp_subtitle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpView extends StatefulWidget {
  final String emailController;
  final String token;

  const OtpView({
    super.key,
    required this.emailController,
    required this.token,
  });

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late List<TextEditingController> controllers;
  late FocusNode firstFieldFocus;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(4, (index) => TextEditingController());
    firstFieldFocus = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          FocusScope.of(context).requestFocus(firstFieldFocus);
        }
      });
    });
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    firstFieldFocus.dispose();
    super.dispose();
  }

  void clearFields() {
    for (var controller in controllers) {
      controller.clear();
    }
    if (formKey.currentState != null) {
      formKey.currentState!.reset();
    }
    FocusScope.of(context).requestFocus(firstFieldFocus);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return OtpBloc(sl(), sl());
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocListener<OtpBloc, OtpState>(
            listener: (context, state) {
              if (state.verifyOtpStatus == RequestState.success) {
                context.go(Routes.signInView);
                sl<SharedPreferences>().setString(
                  AppString.userToken,
                  widget.token,
                );
              }
              if (state.verifyOtpStatus == RequestState.error) {
                showMessage(
                  message: AppString.invalidOtpMessage,
                  state: ToastStates.error,
                  context: context,
                );

                clearFields();

                context.read<OtpBloc>().add(ResetOtpStateEvent());
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.h),
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  const OTPHeader(),
                  SizedBox(height: 16.h),
                  OTPSubtitle(email: widget.emailController),
                  SizedBox(height: 30.h),
                  OTPForm(
                    formKey: formKey,
                    controllers: controllers,
                    firstFieldFocus: firstFieldFocus,
                  ),
                  SizedBox(height: 30.h),
                  OTPActions(
                    formKey: formKey,
                    controllers: controllers,
                    email: widget.emailController,
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
