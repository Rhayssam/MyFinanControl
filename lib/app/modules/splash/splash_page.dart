import 'dart:async';

import 'package:finan_control/app/core/constants/routes.dart';
import 'package:finan_control/app/core/ui/text_styles.dart';
import 'package:finan_control/app/core/ui/theme_config.dart';
import 'package:finan_control/app/core/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Timer init() {
    return Timer(
      Duration(seconds: 2),
      navigateToOnboarding,
    );
  }

  void navigateToOnboarding() {
    Navigator.pushReplacementNamed(context, NamedRoutes.initial);
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
