import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_sign_test/repository/sign_repository.dart';
import 'package:bloc_sign_test/services/remote_storage_service.dart';
import 'package:bloc_sign_test/signin/model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SigninEvent, SigninState> {
  final SignInRepository _repository =
      SignInRepository(remoteStorageService: RemoteStorageService());

  SignInBloc() : super(SigninInitial(newModel: SignInModel()));

  @override
  Stream<SigninState> mapEventToState(
    SigninEvent event,
  ) async* {
    if (event is SignInClicked) {
      // Sign In
      yield SigningIn(newModel: state.signInModel);
      SignInModel response = await _repository.doRemoteSignIn(
          SignInModel(username: event.username, password: event.password));

      if (response.token.isNotEmpty) {
        yield SigninedIn(newModel: response);
      } else {
        yield SignInError(newModel: response);
      }
    }
  }
}
