import 'package:finan_control/app/core/models/user_model.dart';
import 'package:finan_control/app/services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    try {
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(
        id: email.hashCode,
        email: email,
      );
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Erro ao logar. Tente novamente.';
      }
      throw 'Não foi possível realizar o login. Tente mais tarde.';
    }
  }

  @override
  Future<UserModel> signUp({
    String? name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    try {
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(
        id: email.hashCode,
        name: name,
        email: email,
      );
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Senha insegura. Tente novamente';
      }
      throw 'Não foi possível criar sua conta nesse momento. Tente mais tarde';
    }
  }
}
