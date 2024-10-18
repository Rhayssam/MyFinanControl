import 'package:finan_control/app/core/ui/theme_config.dart';
import 'package:finan_control/app/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import '../ui/text_styles.dart';

Future<void> customModalBottomSheet(
    {required BuildContext context,
    required String content,
    required String buttonText}) {
  return showModalBottomSheet<void>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(38.0),
        topRight: Radius.circular(38.0),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(38.0), topRight: Radius.circular(38.0)),
        ),
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                content,
                // 'Ops! Algo deu errado.',
                style: TextStyles.mediumText20.copyWith(
                  color: ThemeConfig.greenOne,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
                child: PrimaryButton(
                  text: buttonText,
                  // text: 'Tentar Novamente',
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
