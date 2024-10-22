import 'package:finan_control/app/core/models/user_model.dart';
import 'package:finan_control/app/services/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuthService extends Mock implements AuthService {}

void main() {
  late MockFirebaseAuthService mockFirebaseAuthService;
  setUp(() {
    mockFirebaseAuthService = MockFirebaseAuthService();
  });

  test(
    'Test sign up success',
    () {
      when(
        () => mockFirebaseAuthService.signUp(
          name: 'User',
          email: 'user@mail.com',
          password: 'user@123',
        ),
      ).thenAnswer(
        (_) async => UserModel(
          name: 'User',
          email: 'user@mail.com',
          password: '1a2b3c4d5e',
        ),
      );
    },
  );
}
