import 'package:dartz/dartz.dart';
import 'package:meals_recommendation/core/errors/firesbase_failure.dart';
import 'package:meals_recommendation/features/auth/data/models/user_model.dart';
import 'package:meals_recommendation/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<FirebaseFailure, String>> signUpUser(UserEntity user);
  Future<Either<FirebaseFailure, String>> signInUser(UserEntity user);
  Future<Either<FirebaseFailure, String>> restUserPassword(UserEntity user);
  Future<Either<FirebaseFailure, UserModel>> getUserData();

}
