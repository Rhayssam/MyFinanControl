import 'package:finan_control/app/core/models/user_model.dart';
import 'package:finan_control/app/services/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuthService extends Mock implements AuthService {}

void main() {
  late MockFirebaseAuthService mockFirebaseAuthService;
  late UserModel user;
  setUp(() {
    mockFirebaseAuthService = MockFirebaseAuthService();
    user = UserModel(
      name: 'User',
      email: 'user@mail.com',
      id: '1a2b3c4d5e',
    );
  });

  group(
    'Tests sign up',
    () {
      test(
        'Test sign up success',
        () async {
          when(
            () => mockFirebaseAuthService.signUp(
              name: 'User',
              email: 'user@mail.com',
              password: 'user@123',
            ),
          ).thenAnswer(
            (_) async => user,
          );
          final result = await mockFirebaseAuthService.signUp(
            name: 'User',
            email: 'user@mail.com',
            password: 'user@123',
          );
          expect(
            result,
            user,
          );
        },
      );

      test(
        'Test sign up failure',
        () async {
          when(
            () => mockFirebaseAuthService.signUp(
              name: 'User',
              email: 'user@mail.com',
              password: 'user@123',
            ),
          ).thenThrow(
            Exception(),
          );
          expect(
            () => mockFirebaseAuthService.signUp(
              name: 'User',
              email: 'user@mail.com',
              password: 'user@123',
            ),
            // throwsA(isInstanceOf<Exception>()),
            throwsException,
          );
        },
      );
    },
  );
}
