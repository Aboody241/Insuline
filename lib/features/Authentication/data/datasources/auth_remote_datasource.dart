import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import '../../domain/entities/user.dart';
import '../models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';

/// Remote data source for authentication
/// Handles Firebase Auth API calls
class AuthRemoteDataSource implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRemoteDataSource(this._firebaseAuth);

  @override
  Future<Either<String, User>> signIn(String email, String password) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      if (result.user != null) {
        final user = result.user!;
        return Right(UserModel(
          id: user.uid,
          email: user.email ?? '',
          name: user.displayName,
          avatarUrl: user.photoURL,
          createdAt: user.metadata.creationTime,
          updatedAt: user.metadata.lastSignInTime,
        ));
      } else {
        return const Left('Sign in failed: Invalid credentials');
      }
    } catch (e) {
      return Left('Sign in failed: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, User>> signUp(String email, String password) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      if (result.user != null) {
        final user = result.user!;
        return Right(UserModel(
          id: user.uid,
          email: user.email ?? '',
          name: user.displayName,
          avatarUrl: user.photoURL,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ));
      } else {
        return const Left('Sign up failed');
      }
    } catch (e) {
      return Left('Sign up failed: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, User>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return const Right(UserModel(id: '', email: '')); // Mocking an empty user as nothing actually returns
    } catch (e) {
      return Left('Sign out failed: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, User>> getCurrentUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        return Right(UserModel(
          id: user.uid,
          email: user.email ?? '',
          name: user.displayName,
          avatarUrl: user.photoURL,
          createdAt: user.metadata.creationTime,
          updatedAt: user.metadata.lastSignInTime,
        ));
      } else {
        return const Left('No user logged in');
      }
    } catch (e) {
      return Left('Get current user failed: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, User>> updateProfile(User user) async {
    try {
      await _firebaseAuth.currentUser?.updateProfile(displayName: user.name);
      return Right(user);
    } catch (e) {
      return Left('Update profile failed: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, void>> resetPassword(String email, String newPassword) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return const Right(null);
    } catch (e) {
      return Left('Reset password failed: ${e.toString()}');
    }
  }
}
