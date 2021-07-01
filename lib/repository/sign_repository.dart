import 'package:bloc_sign_test/services/remote_storage_service.dart';
import 'package:bloc_sign_test/signin/model.dart';

class SignInRepository {
  final RemoteStorageService remoteStorageService;

  SignInRepository({required this.remoteStorageService});

  Future<SignInModel> doRemoteSignIn(SignInModel signInModel) async {
    SignInModel value = SignInModel();
    try {
      final response = await remoteStorageService.sendData(
          '/Users/SignIn', signInModel.toString());

      if (response.isNotEmpty)
        value = SignInModel(
            username: signInModel.username,
            password: signInModel.password,
            token: response);
    } catch (ex) {
      if (ex.toString().isNotEmpty)
        value = SignInModel(
            username: signInModel.username,
            password: signInModel.password,
            error: ex.toString());
    }

    return value;
  }
}
