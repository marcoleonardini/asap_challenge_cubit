import 'package:asap_challenge_cubit/src/core/services/abstract/auth_abstract.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase implements AuthAbstract {
  @override
  Future<bool> logIn({String email, String password}) async {
    try {
      var auth = FirebaseAuth.instance;

      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
  }

  @override
  Future<bool> signUp({String email, String password}) async {
    try {
      var auth = FirebaseAuth.instance;

      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
  }
}
