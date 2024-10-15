import 'package:flutter/material.dart';

import '../ui/text_styles.dart';
import '../ui/theme_config.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const PrimaryButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final BorderRadius _borderRadius =
      const BorderRadius.all(Radius.circular(24.0));

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 48.0,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: onPressed != null
              ? ThemeConfig.greenGradient
              : ThemeConfig.greyGradient,
        ),
      ),
      child: InkWell(
        borderRadius: _borderRadius,
        onTap: onPressed,
        child: Align(
          child: Text(
            text,
            style: TextStyles.mediumText18.copyWith(
              color: ThemeConfig.white,
            ),
          ),
        ),
      ),
    );
  }
}
