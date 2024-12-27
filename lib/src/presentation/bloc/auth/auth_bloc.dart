import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/user_model.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    // Handle password visibility toggle
    on<PasswordVisibilityToggled>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });

    on<EmailChanged>((event, emit) {
      final emailError = _validateEmail(event.email);
      emit(state.copyWith(
        email: event.email,
        emailError: emailError,
        isValid: emailError == null && state.passwordError == null,
      ));
    });

    on<PasswordChanged>((event, emit) {
      final passwordError = _validatePassword(event.password);
      emit(state.copyWith(
        password: event.password,
        passwordError: passwordError,
        isValid: state.emailError == null && passwordError == null,
      ));
    });

    on<LoginSubmitted>((event, emit) async {
      // Ensure the email and password are valid before proceeding
      if (!state.isValid) {
        return; // Do nothing if the input is invalid
      }

      emit(state.copyWith(isSubmitting: true)); // Emit loading state

      try {
        // Simulate delay (e.g., API call)
        await Future.delayed(Duration(seconds: 1));

        // Find the user by email
        final user = UserModel.findByEmail(state.email);

        if (user == null) {
          // User not registered
          emit(state.copyWith(
            emailError: "User not registered",
            isSubmitting: false,
          ));
        } else if (user.password != state.password) {
          // Password incorrect
          emit(state.copyWith(
            passwordError: "Password is incorrect",
            isSubmitting: false,
          ));
        } else {
          // Success: User authenticated
          emit(state.copyWith(isSubmitting: false, navigateToHome: true));
        }
      } catch (error) {
        // Handle unexpected errors

        emit(state.copyWith(
          error: "An error occurred. Please try again.",
          passwordError: null,
          isSubmitting: false,
          failedNavigateToHome: true,
        ));
      }
    });

    on<ResetNavigationFlag>((event, emit) {
      emit(state.copyWith(navigateToHome: false));
    });
  }
  String? _validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email must be provided';
    }
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(email)) {
      return 'Invalid email';
    }
    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password must be provided';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
