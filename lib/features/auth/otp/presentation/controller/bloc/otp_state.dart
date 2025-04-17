part of 'otp_bloc.dart';



@immutable
class OtpState extends Equatable {
  final RequestState sendOtpStatus;
  final String sendOtpMessage;

  final RequestState verifyOtpStatus;
  final String verifyOtpMessage;

  final String concatenatedOtp;

  const OtpState({
    this.sendOtpMessage = '',
    this.sendOtpStatus = RequestState.initial,
    this.verifyOtpMessage = '',
    this.verifyOtpStatus = RequestState.initial,
    this.concatenatedOtp = '',
  });

  OtpState copyWith({
    String? sendOtpMessage,
    RequestState? sendOtpStatus,
    String? verifyOtpMessage,
    RequestState? verifyOtpStatus,
    String? concatenatedOtp,
  }) {
    return OtpState(
      sendOtpMessage: sendOtpMessage ?? this.sendOtpMessage,
      sendOtpStatus: sendOtpStatus ?? this.sendOtpStatus,
      verifyOtpMessage: verifyOtpMessage ?? this.verifyOtpMessage,
      verifyOtpStatus: verifyOtpStatus ?? this.verifyOtpStatus,
      concatenatedOtp: concatenatedOtp ?? this.concatenatedOtp,
    );
  }

  @override
  List<Object?> get props => [
        sendOtpMessage,
        sendOtpStatus,
        verifyOtpMessage,
        verifyOtpStatus,
        concatenatedOtp,
      ];
}
