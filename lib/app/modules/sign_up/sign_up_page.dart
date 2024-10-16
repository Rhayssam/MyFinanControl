// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:finan_control/app/core/utils/uppercase_text_formatter.dart';
import 'package:finan_control/app/core/widgets/password_form_field.dart';
import 'package:flutter/material.dart';
import '../../core/ui/text_styles.dart';
import '../../core/ui/theme_config.dart';
import '../../core/widgets/custom_text_form_field.dart';
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
              color: ThemeConfig.greenTwo,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Seu App de Controle Financeiro!',
            textAlign: TextAlign.center,
            style: TextStyles.mediumText18.copyWith(
              color: ThemeConfig.greenTwo,
            ),
          ),
          Image.asset(
            'assets/images/sign_up.png',
            height: 180,
            width: 415,
          ),
          Form(
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: 'your name',
                  hintText: 'YOUR NAME',
                  inputFormatters: [UppercaseTextInputFormatter()],
                ),
                CustomTextFormField(
                  labelText: 'your email',
                  hintText: 'YOUR EMAIL',
                  inputFormatters: [UppercaseTextInputFormatter()],
                ),
                PasswordFormField(
                  labelText: 'password',
                  hintText: '******',
                ),
                PasswordFormField(
                  labelText: 'confirm your password',
                  hintText: '******',
                ),
              ],
            ),
          ),
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
                  color: ThemeConfig.greenTwo,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
