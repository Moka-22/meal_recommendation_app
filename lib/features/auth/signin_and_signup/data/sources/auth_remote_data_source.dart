import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meals_recommendation/core/di/services_locator.dart';
import 'package:meals_recommendation/core/services/firebase_services.dart';
import 'package:meals_recommendation/features/auth/signin_and_signup/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRemoteDataSource {
  Future<String> signUpUser(UserModel user);
  Future<String> signInUser(UserModel user);
  Future<void> resetUserPassword(UserModel user);
  Future<UserModel?> getUserData();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final FirebaseService _firebaseServices;
  AuthRemoteDataSourceImpl(this._firebaseServices);
  @override
  Future<UserModel?> getUserData() async {
    final user = _firebaseServices.getCurrentUser();
    if (user != null) {
      DocumentSnapshot? userDoc = await _firebaseServices.getUserDocument(
        user.uid,
      );
      if (userDoc != null && userDoc.exists) {
        return UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
      }
    }
    return null;
  }

  @override
  Future<void> resetUserPassword(UserModel user) async {
    await _firebaseServices.sendPasswordResetEmail(user.email);
  }

  @override
  Future<String> signInUser(UserModel user) async {
    final userCredential = await _firebaseServices.signin(
      user.email,
      user.password,
    );
    final idToken = await _firebaseServices.getUserToken(userCredential.user!);

    sl<SharedPreferences>().setString("uid", userCredential.user!.uid);
    return idToken ?? '';
  }

  @override
  Future<String> signUpUser(UserModel user) async {
    UserCredential userCredential = await _firebaseServices.signUp(
      user.email,
      user.password,
    );
    await _firebaseServices.saveUserData(userCredential.user!.uid, {
      "name": user.name,
      "email": user.email,
      "password": user.password,
    });
    final idToken = await _firebaseServices.getUserToken(userCredential.user!);
    return idToken ?? '';
  }
}
