part of 'otp_bloc.dart';

@immutable
sealed class OtpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SendOtpEvent extends OtpEvent {
  final String email;

  SendOtpEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

final class VerifyOtpEvent extends OtpEvent {
  final String otp;

  VerifyOtpEvent({required this.otp});
}

class ConcatenateOtpEvent extends OtpEvent {}

class ResetOtpStateEvent extends OtpEvent {}
