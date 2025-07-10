part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {}

final class LoginFailedState extends LoginState {
  final String message;

  LoginFailedState(this.message);
}
