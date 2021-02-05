abstract class AuthAbstract {
  Future<bool> logIn({String email, String password});
  Future<bool> signUp(String email, String password);
}
