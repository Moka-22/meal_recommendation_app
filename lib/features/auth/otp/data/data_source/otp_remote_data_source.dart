import 'package:email_otp/email_otp.dart';

abstract class OtpRemoteDataSource {
  Future<bool> sendOtp({required String email});
  bool verifyOtp({required String otp});
}

class OtpReoteDataSourceImpl extends OtpRemoteDataSource {
  @override
  Future<bool> sendOtp({required String email}) async {
    EmailOTP.config(
      appName: 'Meal Recommendation Using AI',
      otpType: OTPType.numeric,
      expiry: 30000,
      emailTheme: EmailTheme.v5,
      appEmail: 'celulatechnology@gemail.com',
      otpLength: 4,
    );
    return await EmailOTP.sendOTP(email: email);
  }

  @override
  bool verifyOtp({required String otp}) {
    return EmailOTP.verifyOTP(otp: otp);
  }
}
