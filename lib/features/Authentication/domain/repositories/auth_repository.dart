import 'package:dartz/dartz.dart';
import '../entities/user.dart';

/// Authentication repository abstract class
/// Defines the contract for authentication data operations
abstract class AuthRepository {
  /// Sign in user
  Future<Either<String, User>> signIn(String email, String password);

  /// Sign up user
  Future<Either<String, User>> signUp(String email, String password);

  /// Sign out user
  Future<Either<String, void>> signOut();

  /// Get current user
  Future<Either<String, User>> getCurrentUser();

  /// Update user profile
  Future<Either<String, User>> updateProfile(User user);

  /// Reset password
  Future<Either<String, void>> resetPassword(String email, String newPassword);
}
