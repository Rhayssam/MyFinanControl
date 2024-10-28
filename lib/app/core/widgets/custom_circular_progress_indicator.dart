import 'package:flutter/material.dart';

import '../ui/theme_config.dart';

class customCircularProgressIndicator extends StatelessWidget {
  final Color? color;
  const customCircularProgressIndicator({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? ThemeConfig.iceWhite,
      ),
    );
  }
}
