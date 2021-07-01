part of 'signin_bloc.dart';

//@immutable
class SigninState extends Equatable {
  final SignInModel signInModel;

  const SigninState({required this.signInModel});

  @override
  List<Object> get props => [signInModel];
}

class SigninInitial extends SigninState {
  SignInModel newModel = SignInModel();
  SigninInitial({required this.newModel}) : super(signInModel: newModel);
}

class SigningIn extends SigninState {
  SignInModel newModel = SignInModel();
  SigningIn({required this.newModel}) : super(signInModel: newModel);
}

class SigninedIn extends SigninState {
  SignInModel newModel = SignInModel();
  SigninedIn({required this.newModel}) : super(signInModel: newModel);
}

class SignInError extends SigninState {
  SignInModel newModel = SignInModel();
  SignInError({required this.newModel}) : super(signInModel: newModel);
}
