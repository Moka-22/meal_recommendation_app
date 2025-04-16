import 'package:dartz/dartz.dart';
import 'package:meals_recommendation/core/errors/firesbase_failure.dart';
import 'package:meals_recommendation/features/auth/domain/entities/user_entity.dart';
import 'package:meals_recommendation/features/auth/domain/repo/auth_repo.dart';

class RestPasswordUseCase {
  final AuthRepo _restPasswordRepo;

  RestPasswordUseCase(this._restPasswordRepo);

  Future<Either<FirebaseFailure, String>> call(UserEntity user) async {
    return await _restPasswordRepo.restUserPassword(user);
  }
  
}