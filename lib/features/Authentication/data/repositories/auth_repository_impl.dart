import 'package:dartz/dartz.dart';
import '../../domain/entities/user.dart';
import '../datasources/auth_remote_datasource.dart';
import '../../domain/repositories/auth_repository.dart';

/// Authentication repository implementation
/// Implements the AuthRepository contract using remote data source
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<String, User>> signIn(String email, String password) async {
    return await remoteDataSource.signIn(email, password);
  }

  @override
  Future<Either<String, User>> signUp(String email, String password) async {
    return await remoteDataSource.signUp(email, password);
  }

  @override
  Future<Either<String, void>> signOut() async {
    return await remoteDataSource.signOut();
  }

  @override
  Future<Either<String, User>> getCurrentUser() async {
    return await remoteDataSource.getCurrentUser();
  }

  @override
  Future<Either<String, User>> updateProfile(User user) async {
    return await remoteDataSource.updateProfile(user);
  }

  @override
  Future<Either<String, void>> resetPassword(String email, String newPassword) async {
    return await remoteDataSource.resetPassword(email, newPassword);
  }
}
