import 'package:finan_control/app/services/secure_storage.dart';
import 'package:flutter/foundation.dart';

import 'splash_state.dart';

class SplashController extends ChangeNotifier {
  final SecureStorage _service;
  SplashController(this._service);

  SplashState _state = SplashStateInitial();

  SplashState get state => _state;

  void _changeState(SplashState newState) {
    _state = newState;
    notifyListeners();
  }

  void isUserLogged() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await _service.readOne(key: 'CURRENT_USER');

    if (result != null) {
      _changeState(SplashStateSuccess());
    } else {
      _changeState(SplashStateError());
    }
  }
}
