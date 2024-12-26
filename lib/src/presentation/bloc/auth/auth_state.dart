import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final bool isPasswordVisible;
  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;
  final bool isSubmitting;
  final bool isValid;
  final bool navigateToHome;
  final bool failedNavigateToHome;

  const AuthState({
    this.isPasswordVisible = true,
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordError,
    this.isSubmitting = false,
    this.isValid = false,
    this.navigateToHome = false,
    this.failedNavigateToHome = false,
  });

  AuthState copyWith({
    bool? isPasswordVisible,
    String? email,
    String? password,
    String? error,
    String? emailError,
    String? passwordError,
    bool? isSubmitting,
    bool? isValid,
    bool? navigateToHome,
    bool? failedNavigateToHome,
  }) {
    return AuthState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError,
      passwordError: passwordError,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isValid: isValid ?? this.isValid,
      navigateToHome: navigateToHome ?? this.navigateToHome,
      failedNavigateToHome: failedNavigateToHome ?? this.failedNavigateToHome,
    );
  }

  @override
  List<Object?> get props => [
        isPasswordVisible,
        email,
        password,
        emailError,
        passwordError,
        isSubmitting,
        isValid,
        navigateToHome,
        failedNavigateToHome,
      ];
}
