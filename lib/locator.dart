import 'package:finan_control/app/modules/sign_in/sign_in_controller.dart';
import 'package:finan_control/app/modules/sign_up/sign_up_controller.dart';
import 'package:finan_control/app/services/auth_service.dart';
import 'package:finan_control/app/services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<AuthService>(() => FirebaseAuthService());

  locator.registerFactory<SignInController>(
      () => SignInController(locator.get<AuthService>()));
  locator.registerFactory<SignUpController>(
      () => SignUpController(locator.get<AuthService>()));
}
