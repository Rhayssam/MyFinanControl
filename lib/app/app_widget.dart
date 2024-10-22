import 'package:finan_control/app/core/ui/theme_config.dart';
import 'package:finan_control/app/modules/home/home_page.dart';
import 'package:finan_control/app/modules/onboard/onboard_page.dart';
import 'package:finan_control/app/modules/sign_up/sign_up_page.dart';
import 'package:finan_control/app/modules/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'core/constants/routes.dart';
import 'modules/sign_in/sign_in_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyFinanApp',
      theme: ThemeConfig.theme,
      initialRoute: NamedRoute.splash,
      routes: {
        NamedRoute.initial: (context) => OnboardPage(),
        NamedRoute.splash: (context) => SplashPage(),
        NamedRoute.signUp: (context) => SignUpPage(),
        NamedRoute.signIn: (context) => SignInPage(),
        NamedRoute.home: (context) => HomePage(),
      },
    );
  }
}
