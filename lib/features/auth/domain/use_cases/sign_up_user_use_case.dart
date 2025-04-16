import 'package:dartz/dartz.dart';
import 'package:meals_recommendation/core/errors/firesbase_failure.dart';
import 'package:meals_recommendation/features/auth/domain/entities/user_entity.dart';
import 'package:meals_recommendation/features/auth/domain/repo/auth_repo.dart';

class SignUpUserUseCase {
  final AuthRepo _signupRepo;

  SignUpUserUseCase(this._signupRepo);

  Future<Either<FirebaseFailure, String>> call(UserEntity user) async {
    return await _signupRepo.signUpUser(user);
  }
}