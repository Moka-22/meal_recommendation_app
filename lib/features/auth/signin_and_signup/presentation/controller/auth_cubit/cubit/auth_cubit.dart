import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meals_recommendation/core/di/services_locator.dart';
import 'package:meals_recommendation/core/utils/app_strings.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/data/models/user_model.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/domain/entities/user_entity.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/domain/repo/auth_repo.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/domain/use_cases/rest_password_use_case.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/domain/use_cases/sign_in_user_use_case.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/domain/use_cases/sign_up_user_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.signUpUserUseCase,
    required this.signinUserUseCase,
    required this.baseAuthUserRepo,
    required this.resetUserPasswordUseCase,
  }) : super(SignUpInitial());
  final SignUpUserUseCase signUpUserUseCase;
  final SignInUserUseCase signinUserUseCase;
  final AuthRepo baseAuthUserRepo;
  final ResetPasswordUseCase resetUserPasswordUseCase;
  void signUpUser(UserEntity user) async {
      print("AuthCubit: signUpUser called for email: ${user.email}"); 
    emit((SignUpLoadingState()));
    var result = await signUpUserUseCase.call(user);
    result.fold((l) => emit(SignUpErrorState(l.errorMessage)), (token) async {
      emit(SignUpSuccessState(message: 'Sign up successful', token: token));
    });
  }

  void signinUser(UserEntity user) async {
    emit(SigninLoadingState());
    var result = await signinUserUseCase.call(user);
    result.fold((l) => emit(SigninErrorState(l.errorMessage)), (token) async {
      await sl<SharedPreferences>().setString(AppString.userToken, token);
      emit(const SigninSuccessState('Login successful'));
    });
  }

  void getUserData() async {
    emit(GetUserLoadingState());
    var userData = await baseAuthUserRepo.getUserData();
    userData.fold((l) => emit(GetUserErrorState(l.errorMessage)), (user) async {
      emit(GetUserSuccessState(user));
    });
  }

  void resetUserPassword(UserEntity user) async {
    emit(ResetPasswordLoadingState());
    var result = await resetUserPasswordUseCase.call(user);
    result.fold(
      (l) => emit(ResetPasswordErrorState(l.errorMessage)),
      (r) => emit(ResetPasswordSuccessState(r)),
    );
  }
}
