import 'dart:developer';

import 'package:finan_control/app/core/constants/routes.dart';
import 'package:finan_control/app/core/ui/text_styles.dart';
import 'package:finan_control/app/core/ui/theme_config.dart';
import 'package:finan_control/app/core/widgets/custom_circular_progress_indicator.dart';
import 'package:finan_control/app/modules/splash/splash_controller.dart';
import 'package:finan_control/app/modules/splash/splash_state.dart';
import 'package:finan_control/locator.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _splashController = locator.get<SplashController>();
  @override
  void initState() {
    super.initState();
    _splashController.isUserLogged();
    _splashController.addListener(() {
      if (_splashController.state is SplashStateSuccess) {
        Navigator.pushReplacementNamed(context, NamedRoute.home);
        log('Navegar para a home');
      } else {
        Navigator.pushReplacementNamed(context, NamedRoute.initial);
        log('Navegar para a onboarding');
      }
    });
  }

  @override
  void dispose() {
    _splashController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: ThemeConfig.greenGradient),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'MyFinanApp',
              style: TextStyles.bigText.copyWith(color: ThemeConfig.white),
            ),
            customCircularProgressIndicator(),
          ],
        ),
        // child: Image.asset('assets/images/man.png'),
      ),
    );
  }
}
