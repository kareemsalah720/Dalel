class AuthState {}

final class AuthInitial extends AuthState {}

final class SignupLoadingState extends AuthState {}

final class SignupSuccessState extends AuthState {}

final class SignupFailuerState extends AuthState {
  final String errorMessage;

  SignupFailuerState({required this.errorMessage});
}

final class SigninLoadingState extends AuthState {}

final class SigninSuccessState extends AuthState {}

final class SigninFailuerState extends AuthState {
  final String errorMessage;

  SigninFailuerState({required this.errorMessage});
}

final class TermsAndConditionsUpdateState extends AuthState {}

final class ObsecureTextUpdateState extends AuthState {}

final class ResetPasswordLoadingState extends AuthState {}

final class ResetPasswordSuccessState extends AuthState {}

final class ResetPasswordFailuerState extends AuthState {
  final String errorMessage;

  ResetPasswordFailuerState({required this.errorMessage});
}
