import 'package:flutter/material.dart';

import '../ui/theme_config.dart';

class customCircularProgressIndicator extends StatelessWidget {
  const customCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ThemeConfig.iceWhite,
      ),
    );
  }
}
