import 'dart:developer';

import 'package:finan_control/app/core/constants/routes.dart';
import 'package:finan_control/app/core/utils/uppercase_text_formatter.dart';
import 'package:finan_control/app/core/utils/validator.dart';
import 'package:finan_control/app/core/widgets/password_form_field.dart';
import 'package:finan_control/app/modules/sign_up/sign_up_controller.dart';
import 'package:finan_control/app/modules/sign_up/sign_up_state.dart';
import 'package:finan_control/locator.dart';
import 'package:flutter/material.dart';
import '../../core/ui/text_styles.dart';
import '../../core/ui/theme_config.dart';
import '../../core/widgets/custom_bottom_sheet.dart';
import '../../core/widgets/custom_circular_progress_indicator.dart';
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
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _controller = locator.get<SignUpController>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () {
        if (_controller.state is SignUpLoadingState) {
          showDialog(
            context: context,
            builder: (context) => customCircularProgressIndicator(),
          );
        }
        if (_controller.state is SignUpSuccessState) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                body: Center(
                  child: Text('Nova tela'),
                ),
              ),
            ),
          );
        }
        if (_controller.state is SignUpErrorState) {
          final error = (_controller.state as SignUpErrorState);
          Navigator.pop(context);
          customModalBottomSheet(
            context: context,
            content: error.message,
            buttonText: 'Tentar novamente',
          );
        }
      },
    );
  }

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
                  controller: _nameController,
                  labelText: 'your name',
                  hintText: 'YOUR NAME',
                  inputFormatters: [
                    UppercaseTextInputFormatter(),
                  ],
                  validator: Validator.validateName,
                ),
                CustomTextFormField(
                  controller: _emailController,
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
                  _controller.signUp(
                    name: _nameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                } else {
                  log('erro ao logar');
                }
              },
            ),
          ),
          MultiTextButton(
            onPressed: () =>
                Navigator.popAndPushNamed(context, NamedRoutes.signIn),
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
