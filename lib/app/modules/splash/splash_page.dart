import 'package:finan_control/app/core/ui/text_styles.dart';
import 'package:finan_control/app/core/ui/theme_config.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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

        child: Text(
          'MyFinanApp',
          style: TextStyles.bigText.copyWith(color: ThemeConfig.white),
        ),
        // child: Image.asset('assets/images/man.png'),
      ),
    );
  }
}
