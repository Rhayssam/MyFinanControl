// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:finan_control/app/core/ui/theme_config.dart';
import 'package:flutter/material.dart';

import 'package:finan_control/app/core/widgets/custom_text_form_field.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final String? helperText;

  const PasswordFormField({
    Key? key,
    this.controller,
    this.padding,
    this.hintText,
    this.labelText,
    this.validator,
    this.helperText,
  }) : super(key: key);

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      helperText: widget.helperText,
      validator: widget.validator,
      obscureText: isHidden,
      controller: widget.controller,
      padding: widget.padding,
      hintText: widget.hintText,
      labelText: widget.labelText,
      suffixIcon: InkWell(
        borderRadius: BorderRadius.circular(23),
        onTap: () {
          log('message');
          setState(() {
            isHidden = !isHidden;
          });
        },
        child: Icon(
          isHidden ? Icons.visibility : Icons.visibility_off,
          color: ThemeConfig.greenTwo,
        ),
      ),
    );
  }
}
