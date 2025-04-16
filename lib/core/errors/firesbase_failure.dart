import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meals_recommendation/core/utils/app_strings.dart';

abstract class FirebaseFailure extends Equatable {
  final String errorMessage;

  const FirebaseFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class FirebaseServerFailure extends FirebaseFailure {
  const FirebaseServerFailure(super.errorMessage);

  factory FirebaseServerFailure.fromFirebaseException(
      FirebaseAuthException firebaseException) {
    switch (firebaseException.code) {
      case 'email-already-in-use':
        return const FirebaseServerFailure(AppString.emailAlreadyUseMessage);
      case 'invalid-email':
        return const FirebaseServerFailure(AppString.invalidEmailMessage);
      case 'operation-not-allowed':
        return const FirebaseServerFailure(
            AppString.operationNotAllowedMessage);
      case 'weak-password':
        return const FirebaseServerFailure(AppString.weakPasswordMessage);
      case 'user-disabled':
        return const FirebaseServerFailure(AppString.userDisabledMessage);
      case 'user-not-found':
        return const FirebaseServerFailure(AppString.notUserFoundMessage);
      case 'wrong-password':
        return const FirebaseServerFailure(AppString.inCorrectPasswordMessage);
      case 'invalid-credential':
        return const FirebaseServerFailure(AppString.invalidCredentialMessage);
      case 'too-many-requests':
        return const FirebaseServerFailure(AppString.manyRequestMessage);
      case 'network-request-failed':
        return const FirebaseServerFailure(AppString.networkRequestMessage);
      default:
        return const FirebaseServerFailure(AppString.defaultMessage);
    }
  }

  /// Factory constructor to handle generic Firebase errors.
  factory FirebaseServerFailure.fromGenericFirebaseError(dynamic error) {
    if (error is FirebaseAuthException) {
      return FirebaseServerFailure.fromFirebaseException(error);
    } else {
      return const FirebaseServerFailure(AppString.unExpectedErrorMessage);
    }
  }
}