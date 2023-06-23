class LoginBloc {
  final String _validEmail = 'usuario@example.com';
  final String _validPassword = 'password';

  bool login(String email, String password) {
    if (email == _validEmail && password == _validPassword) {
      return true;
    } else {
      print('Invalid email or password');
      return false;
    }
  }

  void dispose() {
    // Cleanup code if needed
  }
}
