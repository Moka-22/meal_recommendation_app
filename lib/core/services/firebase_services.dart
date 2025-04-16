import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  FirebaseService(this._firebaseAuth, this._firestore);

  Future<UserCredential> signUp(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> saveUserData(String uid, Map<String, dynamic> userData) async {
    await _firestore.collection('users').doc(uid).set(userData);
  }

  Future<String?> getUserToken(User user) async {
    return await user.getIdToken();
  }

  Future<UserCredential> signin(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<DocumentSnapshot?> getUserDocument(String uid) async {
    return await _firestore.collection('users').doc(uid).get();
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}