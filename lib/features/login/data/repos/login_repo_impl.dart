import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/features/login/domain/repos/login_repo.dart';

class LoginRepoImpl extends LoginRepo{
  @override
  Future<void> login(String email, String password)async {
    final auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  bool validateEmail(String email) {
    // TODO: implement validateEmail
    throw UnimplementedError();
  }

  @override
  bool validatePassword(String password) {
    // TODO: implement validatePassword
    throw UnimplementedError();
  }

}