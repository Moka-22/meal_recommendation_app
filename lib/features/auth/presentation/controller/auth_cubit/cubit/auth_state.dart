part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends AuthState {}

final class SignUpLoadingState extends AuthState {}

final class SignUpErrorState extends AuthState {
  final String errorMessage;
  const SignUpErrorState(this.errorMessage);
}
final class SignUpSuccessState extends AuthState {
 final String message;
  final String token;
  const SignUpSuccessState({
    required this.message,
    required this.token,
  });
}

class SigninLoadingState extends AuthState{
  @override
  List<Object> get props => [];
}

class SigninSuccessState extends AuthState {
  final String message;

  const SigninSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class SigninErrorState extends AuthState {
  final String message;

  const SigninErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class GetUserLoadingState extends AuthState {}

class GetUserSuccessState extends AuthState {
  final UserModel user;
  const GetUserSuccessState(this.user);
}

class GetUserErrorState extends AuthState {
  final String message;
  const GetUserErrorState(this.message);
}

class ResetPasswordLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class ResetPasswordErrorState extends AuthState {
  final String message;
  const ResetPasswordErrorState(this.message);
  @override
  List<Object> get props => [message];
}

class ResetPasswordSuccessState extends AuthState {
  final String message;
  const ResetPasswordSuccessState(this.message);
  @override
  List<Object> get props => [message];
}