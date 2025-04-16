import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meals_recommendation/core/errors/firesbase_failure.dart';
import 'package:meals_recommendation/features/auth/data/models/user_model.dart';
import 'package:meals_recommendation/features/auth/data/sources/auth_remote_data_source.dart';
import 'package:meals_recommendation/features/auth/domain/entities/user_entity.dart';
import 'package:meals_recommendation/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;
  AuthRepoImpl(this._remoteDataSource);
  @override
  Future<Either<FirebaseFailure, UserModel>> getUserData() async {
    try {
      final user = await _remoteDataSource.getUserData();
      if (user != null) {
        return Right(user);
      } else {
        return Left(FirebaseServerFailure('User not found'));
      }
    } catch (e) {
      return left(FirebaseServerFailure.fromGenericFirebaseError(e));
    }
  }

  @override
  Future<Either<FirebaseFailure, String>> restUserPassword(
    UserEntity user,
  ) async {
    try {
      final UserModel userModel = UserModel(
        name: user.name,
        email: user.email,
        password: user.password,
      );
      await _remoteDataSource.resetUserPassword(userModel);
      return Right('PAssword reset email sent successfully');
    } on FirebaseAuthException catch (e) {
      return left(FirebaseServerFailure.fromFirebaseException(e));
    } catch (e) {
      return left(FirebaseServerFailure.fromGenericFirebaseError(e));
    }
  }

  @override
  Future<Either<FirebaseFailure, String>> signInUser(UserEntity user) async {
    try {
      final UserModel userModel = UserModel(
        name: user.name,
        email: user.email,
        password: user.password,
      );
      var token = await _remoteDataSource.signInUser(userModel);
      return Right(token);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseServerFailure.fromFirebaseException(e));
    } catch (e) {
      return left(FirebaseServerFailure.fromGenericFirebaseError(e));
    }
  }

  @override
  Future<Either<FirebaseFailure, String>> signUpUser(UserEntity user) async {
    try {
      final UserModel userModel = UserModel(
        name: user.name,
        email: user.email,
        password: user.password,
      );
      await _remoteDataSource.signUpUser(userModel);
      var token = await _remoteDataSource.signUpUser(userModel);
      return Right(token);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseServerFailure.fromFirebaseException(e));
    } catch (e) {
      return left(FirebaseServerFailure.fromGenericFirebaseError(e));
    }
  }
}
