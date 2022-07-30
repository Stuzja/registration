import '../models/user_model.dart';

abstract class AbstractRepository {
  Future<UserModel> signIn({required String email, required String password});
}