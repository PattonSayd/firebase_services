import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  UserRepository(this._auth);

  final FirebaseAuth _auth;

  bool get isAuthorized => _auth.currentUser != null;

  User? get user => _auth.currentUser;

  Future<void> signInAnonymously() async {
    await _auth.signInAnonymously();
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
