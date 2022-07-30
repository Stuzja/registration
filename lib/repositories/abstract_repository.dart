import '../models/user_model.dart';

abstract class AbstractRepository {
  Future<UserModel> signIn({required String email, required String password});
  Future<UserModel> signUp({required String email, required String password});
  Future<UserModel> resetPassword({required String email});
}
