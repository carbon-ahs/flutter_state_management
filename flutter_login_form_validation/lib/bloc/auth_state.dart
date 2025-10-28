part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {}

final class AuthFailed extends AuthState {
  final String errorMessage;
  AuthFailed(this.errorMessage);
}
