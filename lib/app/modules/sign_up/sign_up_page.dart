import 'package:flutter/material.dart';

import '../../core/ui/text_styles.dart';
import '../../core/ui/theme_config.dart';
import '../../core/widgets/multi_text_button.dart';
import '../../core/widgets/primary_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            'MyFinanApp',
            textAlign: TextAlign.center,
            style: TextStyles.mediumText.copyWith(
              color: ThemeConfig.greenlightTwo,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Seu App de Controle Financeiro!',
            textAlign: TextAlign.center,
            style: TextStyles.mediumText18.copyWith(
              color: ThemeConfig.greenlightTwo,
            ),
          ),
          Image.asset(
            'assets/images/sign_up.png',
          ),
          TextFormField(),
          TextField(),
          Padding(
            padding: const EdgeInsets.only(
              left: 32.0,
              right: 32.0,
              top: 16.0,
              bottom: 4.0,
            ),
            child: PrimaryButton(
              text: 'Entrar',
              onPressed: () {},
            ),
          ),
          MultiTextButton(
            onPressed: () {},
            children: [
              Text(
                'Já possui uma conta? ',
                style: TextStyles.smallText.copyWith(
                  color: ThemeConfig.grey,
                ),
              ),
              Text(
                'Entrar',
                style: TextStyles.smallText.copyWith(
                  color: ThemeConfig.greenlightTwo,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
