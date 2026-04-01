import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

/// Sign in use case
/// Handles the business logic for user sign in
class SignIn {
  final AuthRepository repository;

  SignIn(this.repository);

  /// Execute sign in use case
  /// Returns either an error message (Left) or the user (Right)
  Future<Either<String, User>> call(String email, String password) async {
    if (email.trim().isEmpty) {
      return const Left('Email cannot be empty');
    }
    
    if (password.trim().isEmpty) {
      return const Left('Password cannot be empty');
    }
    
    if (password.trim().length < 6) {
      return const Left('Password must be at least 6 characters');
    }
    
    // Validate email format
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(email)) {
      return const Left('Invalid email format');
    }
    
    try {
      final userOrError = await repository.signIn(email, password);
      return userOrError;
    } catch (e) {
      return Left('Authentication failed: ${e.toString()}');
    }
  }
}
