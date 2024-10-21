import 'package:finan_control/app/app_module.dart';
import 'package:finan_control/firebase_options.dart';
import 'package:finan_control/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupDependencies();
  runApp(AppModule());
}
