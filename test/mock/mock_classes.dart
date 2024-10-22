import 'package:finan_control/app/modules/sign_up/sign_up_controller.dart';
import 'package:finan_control/app/services/auth_service.dart';
import 'package:finan_control/app/services/secure_storage.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuthService extends Mock implements AuthService {}

class MockSecureStorage extends Mock implements SecureStorage {}

class MockSignUpController extends Mock implements SignUpController {}
