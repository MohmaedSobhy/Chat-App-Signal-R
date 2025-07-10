part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {}

final class RegisterFailedState extends RegisterState {
  final String message;

  RegisterFailedState(this.message);
}
