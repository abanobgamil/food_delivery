import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/features/login/data/repos/login_repo_impl.dart';
import 'package:food_delivery/features/login/presentaion/providers/login_states.dart';

class LoginProvider extends StateNotifier<LoginStates> {
  LoginProvider() : super(InitLoginState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _loginRepoImpl = LoginRepoImpl();

  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    state = LoginLoading();
    try {
      _loginRepoImpl.login(emailController.text, passwordController.text);
      state = LoginSuccess();
    } on FirebaseAuthException catch (e) {
      state = LoginError(e.message ?? 'An error occurred');
    }
  }

}


final loginNotifierProvider = StateNotifierProvider<LoginProvider, LoginStates>((ref) {
  return LoginProvider();
});
