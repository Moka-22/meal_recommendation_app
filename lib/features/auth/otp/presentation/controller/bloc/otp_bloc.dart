import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meals_recommendation/core/utils/enum.dart';
import 'package:meals_recommendation/features/auth/otp/domain/use_cases/send_otp_use_case.dart';
import 'package:meals_recommendation/features/auth/otp/domain/use_cases/verify_otp_use_case.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final VerifyOtpUseCase verifyOtpUseCase;
  final SendOtpUseCase sendOtpUseCase;
  OtpBloc(this.verifyOtpUseCase, this.sendOtpUseCase)
      : super(const OtpState()) {
    on<SendOtpEvent>(_sendOtp);
    on<VerifyOtpEvent>(_verifyOtp);
    on<ResetOtpStateEvent>(_resetState);
  }

  FutureOr<void> _sendOtp(SendOtpEvent event, Emitter<OtpState> emit) async {
    emit(state.copyWith(sendOtpStatus: RequestState.loading));

    final result = await sendOtpUseCase.call(email: event.email);
    result.fold(
      (l) => emit(
        state.copyWith(
          sendOtpStatus: RequestState.error,
          sendOtpMessage: l.toString(),
        ),
      ),
      (r) {
        if (r == true) {
          emit(state.copyWith(sendOtpStatus: RequestState.success));
        } else {
          print('error not send bloc right $r');
          emit(state.copyWith(sendOtpStatus: RequestState.error));
        }
      },
    );
  }

  FutureOr<void> _verifyOtp(VerifyOtpEvent event, Emitter<OtpState> emit) async {
    emit(state.copyWith(verifyOtpStatus: RequestState.loading));
    
    final result = verifyOtpUseCase.call(otp: event.otp);
    result.fold(
      (l) => emit(
        state.copyWith(
          verifyOtpStatus: RequestState.error,
          verifyOtpMessage: l.toString(),
        ),
      ),
      (r) {
        if (r == true) {
          emit(state.copyWith(verifyOtpStatus: RequestState.success));
        } else {
          emit(state.copyWith(verifyOtpStatus: RequestState.error));
        }
      },
    );
  }
  
  FutureOr<void> _resetState(ResetOtpStateEvent event, Emitter<OtpState> emit) {
    emit(state.copyWith(
      verifyOtpStatus: RequestState.initial,
      verifyOtpMessage: '',
    ));
  }
}