import 'package:flutter/material.dart';

import '../ui/text_styles.dart';
import '../ui/theme_config.dart';

class GreetingsWidget extends StatelessWidget {
  const GreetingsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double textScaleFactor =
        MediaQuery.of(context).size.width < 360 ? 0.7 : 1.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bom Dia, ',
          textScaleFactor: textScaleFactor,
          style: TextStyles.smallText.apply(color: ThemeConfig.white),
        ),
        Text(
          textScaleFactor: textScaleFactor,
          'Rhayssam Hamze Vitti',
          style: TextStyles.mediumText20.apply(color: ThemeConfig.white),
        ),
      ],
    );
  }
}
