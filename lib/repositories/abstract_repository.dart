abstract class AbstractRepository {
  Future<bool> resetPassword({required String email});
  Future<String> checkIn({required String username});
  Future<bool> signIn(
      {required String email, required String password});
  Future<bool> signUp({
    required String email,
    required String password,
    required String userName,
  });
}
