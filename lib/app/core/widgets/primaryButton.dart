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

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(38.0)),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(38.0)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: onPressed != null
                ? ThemeConfig.greenGradient
                : ThemeConfig.greyGradient,
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(38.0)),
          onTap: onPressed,
          child: Container(
            alignment: Alignment.center,
            height: 64.0,
            // width: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(38.0)),
            ),
            child: Text(
              text,
              style: TextStyles.mediumText18.copyWith(
                color: ThemeConfig.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
