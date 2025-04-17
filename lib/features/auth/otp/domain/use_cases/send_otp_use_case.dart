import 'package:dartz/dartz.dart';
import 'package:meals_recommendation/core/errors/firesbase_failure.dart';
import 'package:meals_recommendation/features/auth/otp/domain/repo/otp_repo.dart';

class SendOtpUseCase {
  final OtpRepo otpRepo;
  SendOtpUseCase({required this.otpRepo});
  Future<Either<FirebaseServerFailure, bool>> call(
      {required String email}) async {
    try {
      final result = await otpRepo.sendOtp(email: email);
      return result;
    } catch (e) {
      return Left(FirebaseServerFailure(e.toString()));
    }
  }
}
