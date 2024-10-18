import 'package:finan_control/app/core/models/user_model.dart';

abstract class AuthService {
  Future<UserModel> signUp({
    String? name,
    required String email,
    required String password,
  });

  Future<UserModel> signIn({
    required String email,
    required String password,
  });
}
