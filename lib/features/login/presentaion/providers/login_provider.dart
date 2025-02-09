import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/core/routing/app_route_names.dart';
import 'package:food_delivery/features/login/data/repos/login_repo_impl.dart';
import 'package:food_delivery/features/login/presentaion/providers/login_states.dart';

class LoginProvider extends StateNotifier<LoginStates> {
  LoginProvider(this.ref) : super(InitLoginState());

  final Ref ref;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _loginRepoImpl = LoginRepoImpl();

  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    state = LoginLoading();
    try {
     await _loginRepoImpl.login(emailController.text, passwordController.text);
      state = LoginSuccess();
    } on FirebaseAuthException catch (e) {
      state = LoginError(e.message ?? 'An error occurred');
    }
  }

  void changePasswordVisibility() {
    ref.read(passwordVisibleProvider.notifier).state = !ref.read(passwordVisibleProvider.notifier).state;
  }
}



final passwordVisibleProvider = StateProvider<bool>((ref) => true);


final loginNotifierProvider = StateNotifierProvider<LoginProvider, LoginStates>((ref) {
  return LoginProvider(ref);
});
