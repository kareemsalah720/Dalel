class AuthState {}

final class AuthInitial extends AuthState {}

final class SignupLoadingState extends AuthState {}

final class SignupSuccessState extends AuthState {}

final class SignupFailuerState extends AuthState {final String errorMessage;

  SignupFailuerState({required this.errorMessage});}

  final class TermsAndConditionsUpdateState extends AuthState {}

