part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class PasswordVisibilityChangeState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String uid;

  LoginSuccessState(this.uid);
}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}
