import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) {
      final email = event.email;
      final password = event.password;

      if (email.isEmpty || !email.contains('@')) {
        emit(AuthFailed('Please enter a valid email'));
      }
      if (password.length < 6) {
        emit(AuthFailed('Password must be at least 6 characters'));
        return;
      } else {
        emit(AuthSuccess());
      }
    });
  }
}
