import 'package:finan_control/app/core/ui/theme_config.dart';
import 'package:finan_control/app/modules/onboard/onboard_page.dart';
import 'package:finan_control/app/modules/sign_up/sign_up_page.dart';
import 'package:finan_control/app/modules/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'core/constants/routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyFinanApp',
      theme: ThemeConfig.theme,
      initialRoute: NamedRoutes.splash,
      routes: {
        NamedRoutes.initial: (context) => OnboardPage(),
        NamedRoutes.splash: (context) => SplashPage(),
        NamedRoutes.signUp: (context) => SignUpPage(),
      },
    );
  }
}
