import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

/// Sign up use case
/// Handles the business logic for user sign up
class SignUp {
  final AuthRepository repository;

  SignUp(this.repository);

  /// Execute sign up use case
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
    
    // Validate password strength
    if (!password.contains(RegExp(r'[A-Z]')) || 
        !password.contains(RegExp(r'[0-9]')) || 
        !password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return const Left('Password must contain at least one uppercase letter, one number, and one special character');
    }
    
    try {
      final userOrError = await repository.signUp(email, password);
      return userOrError;
    } catch (e) {
      return Left('Sign up failed: ${e.toString()}');
    }
  }
}
