import 'dart:developer';

import 'package:finan_control/app/core/constants/routes.dart';
import 'package:finan_control/app/core/utils/validator.dart';
import 'package:finan_control/app/core/widgets/password_form_field.dart';
import 'package:finan_control/app/modules/sign_in/sign_in_controller.dart';
import 'package:finan_control/app/modules/sign_in/sign_in_state.dart';
import 'package:finan_control/app/modules/sign_up/sign_up_controller.dart';
import 'package:finan_control/app/services/mock_auth_service.dart';
import 'package:finan_control/locator.dart';
import 'package:flutter/material.dart';
import '../../core/ui/text_styles.dart';
import '../../core/ui/theme_config.dart';
import '../../core/widgets/custom_bottom_sheet.dart';
import '../../core/widgets/custom_circular_progress_indicator.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../../core/widgets/multi_text_button.dart';
import '../../core/widgets/primary_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _controller = locator.get<SignInController>();

  @override
  void dispose() {
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
        if (_controller.state is SignInStateLoading) {
          showDialog(
            context: context,
            builder: (context) => customCircularProgressIndicator(),
          );
        }
        if (_controller.state is SignInStateSuccess) {
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
        if (_controller.state is SignInStateError) {
          final error = (_controller.state as SignInStateError);
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
            'Bem vindo de volta!',
            textAlign: TextAlign.center,
            style: TextStyles.mediumText.copyWith(
              color: ThemeConfig.greenTwo,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/sign_in.png',
            height: 180,
            width: 415,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _emailController,
                  labelText: 'your email',
                  hintText: 'YOUR EMAIL',
                  validator: Validator.validateEmail,
                ),
                PasswordFormField(
                  controller: _passwordController,
                  labelText: 'your password',
                  hintText: '******',
                  validator: Validator.validatePassword,
                  helperText:
                      'Deve ter pelo menos 8 caracteres, 1 letra maiúscula e 1 número.',
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
                  _controller.signIn(
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
                Navigator.popAndPushNamed(context, NamedRoutes.signUp),
            children: [
              Text(
                'Não possui uma conta? ',
                style: TextStyles.smallText.copyWith(
                  color: ThemeConfig.grey,
                ),
              ),
              Text(
                'Crie agora!',
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
