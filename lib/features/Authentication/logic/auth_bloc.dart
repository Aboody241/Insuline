import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../domain/entities/user.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/usecases/sign_in.dart';
import '../domain/usecases/sign_up.dart';

/// Authentication events
@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  const SignInEvent(this.email, this.password);
  @override
  List<Object> get props => [email, password];
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  const SignUpEvent(this.email, this.password);
  @override
  List<Object> get props => [email, password];
}

class SignOutEvent extends AuthEvent {
  const SignOutEvent();
}

class GetCurrentUserEvent extends AuthEvent {
  const GetCurrentUserEvent();
}

/// Authentication BLoC
/// Manages authentication state with BLoC pattern
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  final SignIn signInIn;
  final SignUp signUpIn;

  AuthBloc({
    required this.repository,
    required this.signInIn,
    required this.signUpIn,
  }) : super(const AuthInitial()) {
    on<SignInEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await signInIn(event.email, event.password);
      result.fold(
        (error) => emit(AuthError(error)),
        (user) => emit(AuthAuthenticated(user)),
      );
    });
    
    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await signUpIn(event.email, event.password);
      result.fold(
        (error) => emit(AuthError(error)),
        (user) => emit(AuthAuthenticated(user)),
      );
    });
    
    on<SignOutEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await repository.signOut();
      result.fold(
        (error) => emit(AuthError(error)),
        (_) => emit(const AuthUnauthenticated()),
      );
    });
    
    on<GetCurrentUserEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await repository.getCurrentUser();
      result.fold(
        (error) => emit(AuthError(error)),
        (user) => emit(AuthAuthenticated(user)),
      );
    });
  }
}

/// Authentication states
@immutable
abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

/// Initial state
class AuthInitial extends AuthState {
  const AuthInitial();
}

/// Loading state
class AuthLoading extends AuthState {}

/// Authenticated state
class AuthAuthenticated extends AuthState {
  final User user;
  const AuthAuthenticated(this.user);
  @override
  List<Object> get props => [user];
}

/// Error state
class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);
  @override
  List<Object> get props => [message];
}

/// Unauthenticated state
class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}
