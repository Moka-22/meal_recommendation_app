import 'package:dartz/dartz.dart';
import 'package:meals_recommendation/core/errors/firesbase_failure.dart';
import 'package:meals_recommendation/features/auth/otp/data/data_source/otp_remote_data_source.dart';
import 'package:meals_recommendation/features/auth/otp/domain/repo/otp_repo.dart';

class OtpRepoImpl extends OtpRepo {
  final OtpRemoteDataSource otpRemoteDataSource;
  OtpRepoImpl({required this.otpRemoteDataSource});
  
  @override
  Future<Either<FirebaseServerFailure, bool>> sendOtp({required String email}) async{
   final result = await otpRemoteDataSource.sendOtp(email: email);
    return Right(result);
  }
  
  @override
  Either<FirebaseServerFailure, bool> verifyOtp({required String otp}) {
   final result = otpRemoteDataSource.verifyOtp(otp: otp);
    return Right(result);
  }
  
}
