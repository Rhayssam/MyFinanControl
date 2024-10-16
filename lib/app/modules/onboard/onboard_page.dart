import 'package:flutter/material.dart';
import 'package:finan_control/app/core/ui/text_styles.dart';
import 'package:finan_control/app/core/ui/theme_config.dart';
import '../../core/widgets/multi_text_button.dart';
import '../../core/widgets/primary_button.dart';

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
              child: Image.asset(
                'assets/images/man.png',
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'MyFinanApp',
              style:
                  TextStyles.mediumText.copyWith(color: ThemeConfig.greenTwo),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Seu App de Controle Financeiro!',
              style:
                  TextStyles.mediumText18.copyWith(color: ThemeConfig.greenTwo),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 32.0,
                right: 32.0,
                top: 16.0,
                bottom: 4.0,
              ),
              child: PrimaryButton(
                text: 'Começar',
                onPressed: () {},
              ),
            ),
            MultiTextButton(
              onPressed: () {},
              children: [
                Text(
                  'Ainda não possui uma conta? ',
                  style: TextStyles.smallText.copyWith(
                    color: ThemeConfig.grey,
                  ),
                ),
                Text(
                  'Criar conta',
                  style: TextStyles.smallText.copyWith(
                    color: ThemeConfig.greenTwo,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
