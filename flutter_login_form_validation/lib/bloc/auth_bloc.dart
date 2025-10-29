import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final email = event.email;
        final password = event.password;

        if (email.isEmpty || !email.contains('@')) {
          return emit(AuthFailed('Please enter a valid email'));
        }
        if (password.length < 6) {
          emit(AuthFailed('Password must be at least 6 characters'));
          return;
        }

        await Future.delayed(const Duration(seconds: 3), () {
          emit(AuthSuccess('$email-$password'));
        });
      } catch (e) {
        emit(AuthFailed(e.toString()));
      }
    });

    on<AuthLogoutRequested>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 2), () {});
      emit(AuthInitial());
    });
  }
}
