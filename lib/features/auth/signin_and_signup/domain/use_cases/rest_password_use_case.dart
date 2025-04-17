import 'package:dartz/dartz.dart';
import 'package:meals_recommendation/core/errors/firesbase_failure.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/domain/entities/user_entity.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/domain/repo/auth_repo.dart';

class ResetPasswordUseCase {
  final AuthRepo _restPasswordRepo;

  ResetPasswordUseCase(this._restPasswordRepo);

  Future<Either<FirebaseFailure, String>> call(UserEntity user) async {
    return await _restPasswordRepo.restUserPassword(user);
  }
}
