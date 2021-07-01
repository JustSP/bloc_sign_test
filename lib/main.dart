import 'package:bloc_sign_test/bloc/signin_bloc.dart';
import 'package:bloc_sign_test/signin/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const SignInApp());
}

class SignInApp extends StatefulWidget {
  const SignInApp({Key? key}) : super(key: key);

  @override
  _SignInAppState createState() => _SignInAppState();
}

class _SignInAppState extends State<SignInApp> {
  final SignInBloc _bloc = SignInBloc();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Bloc Example | Sign In App"),
          ),
          body: BlocBuilder<SignInBloc, SigninState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is SigningIn) {
                return signingInWidget();
              } else if (state is SigninedIn) {
                return signInSuccessWidget(state.signInModel.token);
              } else if (state is SignInError) {
                return signInInitialWidget(signInModel: state.signInModel);
              } else {
                return signInInitialWidget(signInModel: SignInModel());
              }
            },
          ),
        ),
      ),
    );
  }

  Widget signInInitialWidget({required SignInModel signInModel}) {
    final TextEditingController _usernameController =
        TextEditingController(text: signInModel.username);
    final TextEditingController _passwordController = TextEditingController();
    const SizedBox emptySpace = SizedBox(
      height: 20,
    );

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(signInModel.error),
          emptySpace,
          TextField(
            autofocus: true,
            maxLength: 255,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            controller: _usernameController,
            decoration: const InputDecoration(hintText: "Username"),
          ),
          emptySpace,
          TextField(
            autofocus: true,
            maxLength: 255,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            obscureText: true,
            controller: _passwordController,
            decoration: const InputDecoration(hintText: "Password"),
          ),
          emptySpace,
          ElevatedButton(
              onPressed: () {
                _bloc.add(SignInClicked(
                    username: _usernameController.text,
                    password: _passwordController.text));
              },
              child: const Text("Sign In"))
        ]),
      ),
    );
  }

  Widget signingInWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()]),
      ),
    );
  }

  Widget signInSuccessWidget(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(message)]),
      ),
    );
  }
}
