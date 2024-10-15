// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:finan_control/app/core/ui/text_styles.dart';
import 'package:finan_control/app/core/ui/theme_config.dart';

import '../../core/widgets/primaryButton.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfig.iceWhite,
      body: Align(
        child: Column(
          children: [
            SizedBox(
              height: 48.0,
            ),
            Expanded(
              flex: 2,
              child: Image.asset(
                'assets/images/man.png',
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'MyFinanApp',
              style: TextStyles.mediumText
                  .copyWith(color: ThemeConfig.greenlightTwo),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Seu App de Controle Financeiro!',
              style: TextStyles.mediumText18
                  .copyWith(color: ThemeConfig.greenlightTwo),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 16.0,
              ),
              child: PrimaryButton(
                text: 'Começar',
                onPressed: () {},
              ),
            ),
            Text(
              'Already have account? Log in',
              style: TextStyles.smallText.copyWith(
                color: ThemeConfig.grey,
              ),
            ),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
