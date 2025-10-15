import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Email & Password SignIn
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Failed to sign in";
    }
  }

  // Email & Password SignUp
  Future<void> createAccountWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Failed to create account";
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Forget Password
  // Future<void> sendPasswordResetEmail(String email) async {
  //   try {
  //     await _firebaseAuth.sendPasswordResetEmail(email: email);
  //   } on FirebaseAuthException catch (e) {
  //     throw e.message ?? "Failed to send reset email";
  //   }
  // }

  // Google Sign-In
  // Future<void> signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   if (googleUser == null) return; // canceled
  //   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //   await _firebaseAuth.signInWithCredential(credential);
  // }
}
