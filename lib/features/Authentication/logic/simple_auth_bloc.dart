import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../domain/entities/user.dart';
import '../domain/repositories/auth_repository.dart';

/// Simple Auth events
@immutable
abstract class SimpleAuthEvent extends Equatable {
  const SimpleAuthEvent();
  @override
  List<Object> get props => [];
}

class SimpleSignIn extends SimpleAuthEvent {
  final String email;
  final String password;
  const SimpleSignIn({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}

class SimpleSignOut extends SimpleAuthEvent {
  const SimpleSignOut();
}

/// Simple Auth states
@immutable
abstract class SimpleAuthState extends Equatable {
  const SimpleAuthState();
  @override
  List<Object> get props => [];
}

class SimpleAuthInitial extends SimpleAuthState {
  const SimpleAuthInitial();
}

class SimpleAuthLoading extends SimpleAuthState {
  const SimpleAuthLoading();
}

class SimpleAuthAuthenticated extends SimpleAuthState {
  final User user;
  const SimpleAuthAuthenticated(this.user);
  @override
  List<Object> get props => [user];
}

class SimpleAuthError extends SimpleAuthState {
  final String error;
  const SimpleAuthError(this.error);
  @override
  List<Object> get props => [error];
}

class SimpleAuthUnauthenticated extends SimpleAuthState {
  const SimpleAuthUnauthenticated();
}

/// Simple Auth BLoC demonstration
/// Shows clean architecture structure without complex dependencies
class SimpleAuthBloc extends Bloc<SimpleAuthEvent, SimpleAuthState> {
  final AuthRepository repository;

  SimpleAuthBloc(this.repository) : super(const SimpleAuthInitial()) {
    on<SimpleSignIn>((event, emit) async {
      emit(const SimpleAuthLoading());
      final result = await repository.signIn(event.email, event.password);
      result.fold(
        (error) => emit(SimpleAuthError(error)),
        (user) => emit(SimpleAuthAuthenticated(user)),
      );
    });

    on<SimpleSignOut>((event, emit) async {
      emit(const SimpleAuthLoading());
      final result = await repository.signOut();
      result.fold(
        (error) => emit(SimpleAuthError(error)),
        (_) => emit(const SimpleAuthUnauthenticated()),
      );
    });
  }
}
