class AuthRepository {
  Future<void> register() async {
    print('attempting register');
    await Future.delayed(Duration(seconds: 3));
    throw Exception('Register Failed');
  }
}
