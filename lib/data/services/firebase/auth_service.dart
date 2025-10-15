import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // نجاح
    } on FirebaseAuthException catch (e) {
      // أخطاء Firebase (بترجع رسالة واضحة)
      return e.message ?? "Login failed. Please try again.";
    } catch (e) {
      // أي خطأ تاني يتحول لنص
      return "Unexpected error: ${e.toString()}";
    }
  }

  Future<String?> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Register failed. Please try again.";
    } catch (e) {
      return "Unexpected error: ${e.toString()}";
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
