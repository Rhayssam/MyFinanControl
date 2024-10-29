import 'package:finan_control/app/core/extensions/sizes.dart';
import 'package:flutter/material.dart';

import '../ui/theme_config.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
        horizontal: 8.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        color: ThemeConfig.white.withOpacity(0.06),
      ),
      child: Stack(
        alignment: AlignmentDirectional(0.5, -0.5),
        children: [
          Icon(
            Icons.notifications_none_outlined,
            color: ThemeConfig.white,
          ),
          Container(
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(
              color: ThemeConfig.notification,
              borderRadius: BorderRadius.circular(
                4.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
