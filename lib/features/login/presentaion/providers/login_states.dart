sealed class LoginStates{}

class InitLoginState extends LoginStates{}
class LoginLoading extends LoginStates{}
class LoginSuccess extends LoginStates{}
class LoginError extends LoginStates{
  final String message;
   LoginError(this.message);
}