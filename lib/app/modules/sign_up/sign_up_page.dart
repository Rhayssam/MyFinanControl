import 'dart:developer';

import 'package:finan_control/app/core/utils/uppercase_text_formatter.dart';
import 'package:finan_control/app/core/utils/validator.dart';
import 'package:finan_control/app/core/widgets/password_form_field.dart';
import 'package:flutter/material.dart';
import '../../core/ui/text_styles.dart';
import '../../core/ui/theme_config.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../../core/widgets/multi_text_button.dart';
import '../../core/widgets/primary_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

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
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: 'your name',
                  hintText: 'YOUR NAME',
                  inputFormatters: [
                    UppercaseTextInputFormatter(),
                  ],
                  validator: Validator.validateName,
                ),
                CustomTextFormField(
                  labelText: 'your email',
                  hintText: 'YOUR EMAIL',
                  validator: Validator.validateEmail,
                ),
                PasswordFormField(
                  controller: _passwordController,
                  labelText: 'password',
                  hintText: '******',
                  validator: Validator.validatePassword,
                  helperText:
                      'Deve ter pelo menos 8 caracteres, 1 letra maiúscula e 1 número.',
                ),
                PasswordFormField(
                  labelText: 'confirm your password',
                  hintText: '******',
                  validator: (value) => Validator.validateConfirmPassword(
                      value, _passwordController.text),
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
              onPressed: () {
                final valid = _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  log('continuar lógica de login');
                } else {
                  log('erro ao logar');
                }
              },
            ),
          ),
          MultiTextButton(
            onPressed: () => log('tap'),
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
