import 'package:finan_control/app/core/models/user_model.dart';
import 'package:finan_control/app/modules/sign_up/sign_up_controller.dart';
import 'package:finan_control/app/modules/sign_up/sign_up_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../mock/mock_classes.dart';

void main() {
  late SignUpController signUpController;
  late MockSecureStorage mockSecureStorage;
  late MockFirebaseAuthService mockFirebaseAuthService;
  late UserModel user;
  setUp(() {
    mockFirebaseAuthService = MockFirebaseAuthService();
    mockSecureStorage = MockSecureStorage();

    signUpController = SignUpController(
      mockFirebaseAuthService,
      mockSecureStorage,
    );
    user = UserModel(
      name: 'User',
      email: 'user@mail.com',
      id: '1a2b3c4d5e',
    );
  });

  test('Tests Sign up Controller Success State', () async {
    expect(signUpController.state, isInstanceOf<SignUpInitialState>());

    when(() => mockSecureStorage.write(
          key: 'CURRENT_USER',
          value: user.toJson(),
        )).thenAnswer((_) async {});

    when(
      () => mockFirebaseAuthService.signUp(
        name: 'User',
        email: 'user@mail.com',
        password: 'user@123',
      ),
    ).thenAnswer(
      (_) async => user,
    );

    await signUpController.signUp(
      name: 'User',
      email: 'user@mail.com',
      password: 'user@123',
    );
    expect(signUpController.state, isInstanceOf<SignUpSuccessState>());
  });

  test('Tests Sign up Controller Error State', () async {
    expect(signUpController.state, isInstanceOf<SignUpInitialState>());

    when(() => mockSecureStorage.write(
          key: 'CURRENT_USER',
          value: user.toJson(),
        )).thenAnswer((_) async {});

    when(
      () => mockFirebaseAuthService.signUp(
        name: 'User',
        email: 'user@mail.com',
        password: 'user@123',
      ),
    ).thenThrow(
      Exception(),
    );

    await signUpController.signUp(
      name: 'User',
      email: 'user@mail.com',
      password: 'user@123',
    );
    expect(signUpController.state, isInstanceOf<SignUpErrorState>());
  });
}
