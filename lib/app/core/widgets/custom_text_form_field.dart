import 'package:flutter/material.dart';

import '../ui/text_styles.dart';
import '../ui/theme_config.dart';

class CustomTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLenght;
  final TextInputAction? textInputAction;

  const CustomTextFormField({
    Key? key,
    this.padding,
    this.hintText,
    this.labelText,
    this.textCapitalization,
    this.controller,
    this.keyboardType,
    this.maxLenght,
    this.textInputAction,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final defaultBorder = OutlineInputBorder(
      borderSide: BorderSide(color: ThemeConfig.greenlightTwo));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12.0,
          ),
      child: TextFormField(
        textInputAction: widget.textInputAction,
        maxLength: widget.maxLenght,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
          hintText: widget.hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText?.toUpperCase(),
          labelStyle:
              TextStyles.inputLabelText.copyWith(color: ThemeConfig.grey),
          focusedBorder: defaultBorder,
          errorBorder: defaultBorder.copyWith(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: defaultBorder.copyWith(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          enabledBorder: defaultBorder,
          disabledBorder: defaultBorder,
        ),
      ),
    );
  }
}
