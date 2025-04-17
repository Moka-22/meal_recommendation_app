import 'package:dartz/dartz.dart';
import 'package:meals_recommendation/core/errors/firesbase_failure.dart';
import 'package:meals_recommendation/features/auth/otp/domain/repo/otp_repo.dart';

class VerifyOtpUseCase {
  final OtpRepo otpRepo;
  VerifyOtpUseCase({required this.otpRepo});

  Either<FirebaseServerFailure, bool> call({required String otp}) {
    try {
      final result = otpRepo.verifyOtp(otp: otp);
      return result;
    } catch (e) {
      return Left(FirebaseServerFailure(e.toString()));
    }
  }
}
