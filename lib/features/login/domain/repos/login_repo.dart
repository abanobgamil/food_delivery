abstract class LoginRepo {

  bool validateEmail(String email);

  bool validatePassword(String password);

  Future<void> login(String email, String password);

}
