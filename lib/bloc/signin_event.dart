part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

class SignInClicked extends SigninEvent {
  final String username;
  final String password;

  SignInClicked({required this.username, required this.password});
}

class SignInSucceded extends SigninEvent {}

class ErrorOccured extends SigninEvent {}
