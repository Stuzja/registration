abstract class AbstractAuthRepository {
  Future<bool> resetPassword({required String email});
  Future<String> checkInEmail({required String username});
  Future<bool> signIn({required String email, required String password});
  Future<bool> signUp({
    required String email,
    required String password,
    required String userName,
  });
  Future<bool> signOut();
  Future<void> signOutGoogle();
  Future<bool> signInGoogle();
}
