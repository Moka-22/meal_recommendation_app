import 'package:dartz/dartz.dart';
import 'package:meals_recommendation/core/errors/firesbase_failure.dart';

abstract class OtpRepo {
  Future<Either<FirebaseServerFailure, bool>> sendOtp({required String email});
  Either<FirebaseServerFailure, bool> verifyOtp({required String otp});
}
