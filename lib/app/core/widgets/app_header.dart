import 'package:finan_control/app/core/extensions/sizes.dart';
import 'package:finan_control/app/core/widgets/greetings_widget.dart';
import 'package:finan_control/app/core/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

import '../ui/text_styles.dart';
import '../ui/theme_config.dart';

class AppHeader extends StatefulWidget {
  final String? title;
  final bool hasOptions;

  const AppHeader({
    super.key,
    this.title,
    this.hasOptions = false,
  });

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  Widget get _innerHeader => widget.title != null
      ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios,
                size: 16.0,
                color: ThemeConfig.white,
              ),
            ),
            Text(
              widget.title!,
              style: TextStyles.mediumText18.apply(
                color: ThemeConfig.white,
              ),
            ),
            widget.hasOptions
                ? Icon(
                    Icons.more_horiz,
                    color: ThemeConfig.white,
                  )
                : SizedBox(
                    width: 16.0,
                  ),
          ],
        )
      : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GreetingsWidget(),
            NotificationWidget(),
          ],
        );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(2, 2),
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: ThemeConfig.greenGradient,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(500, 30),
                bottomRight: Radius.elliptical(500, 30),
              ),
            ),
            height: 287.h,
          ),
        ),
        Positioned(
          left: 24.0,
          right: 24.0,
          top: 74.h,
          child: _innerHeader,
        ),
      ],
    );
  }
}
