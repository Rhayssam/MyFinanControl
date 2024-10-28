import 'dart:developer';

import 'package:finan_control/app/core/widgets/custom_circular_progress_indicator.dart';
import 'package:finan_control/app/modules/home/home_controller.dart';
import 'package:finan_control/app/modules/home/home_state.dart';
import 'package:finan_control/locator.dart';
import 'package:flutter/material.dart';

import 'package:finan_control/app/core/extensions/sizes.dart';
import 'package:finan_control/app/core/ui/text_styles.dart';
import 'package:finan_control/app/core/ui/theme_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double get textScaleFactor =>
      MediaQuery.of(context).size.width < 360 ? 0.7 : 1.0;

  double get iconsSize => MediaQuery.of(context).size.width < 360 ? 16.0 : 24.0;

  final controller = locator.get<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.getAllTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Afternoon, ',
                          textScaleFactor: textScaleFactor,
                          style: TextStyles.smallText
                              .apply(color: ThemeConfig.white),
                        ),
                        Text(
                          'Enjelin Morgeana',
                          textScaleFactor: textScaleFactor,
                          style: TextStyles.mediumText20
                              .apply(color: ThemeConfig.white),
                        ),
                      ],
                    ),
                    Container(
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
                    ),
                  ],
                )),
            Positioned(
              left: 24.w,
              right: 24.w,
              top: 155.w,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 32.h,
                ),
                decoration: BoxDecoration(
                  color: ThemeConfig.darkGreen,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Balance',
                              textScaleFactor: textScaleFactor,
                              style: TextStyles.mediumText16w600
                                  .apply(color: ThemeConfig.white),
                            ),
                            Text(
                              '\$ 1,556.00',
                              textScaleFactor: textScaleFactor,
                              style: TextStyles.mediumText
                                  .apply(color: ThemeConfig.white),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () => log('options'),
                          child: PopupMenuButton(
                              padding: EdgeInsets.zero,
                              child: Icon(
                                Icons.more_horiz,
                                color: ThemeConfig.white,
                              ),
                              itemBuilder: (context) => [
                                    PopupMenuItem(
                                      height: 24.0,
                                      child: Text('Item 1'),
                                    ),
                                  ]),
                        ),
                      ],
                    ),
                    SizedBox(height: 36.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                color: ThemeConfig.white.withOpacity(0.06),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                              ),
                              child: Icon(
                                Icons.arrow_downward,
                                color: ThemeConfig.white,
                                size: iconsSize,
                              ),
                            ),
                            SizedBox(width: 4.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Income',
                                  textScaleFactor: textScaleFactor,
                                  style: TextStyles.mediumText16w500
                                      .apply(color: ThemeConfig.white),
                                ),
                                Text(
                                  '\$ 1,840.00',
                                  textScaleFactor: textScaleFactor,
                                  style: TextStyles.mediumText20
                                      .apply(color: ThemeConfig.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                color: ThemeConfig.white.withOpacity(0.06),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                              ),
                              child: Icon(
                                Icons.arrow_upward,
                                color: ThemeConfig.white,
                                size: iconsSize,
                              ),
                            ),
                            SizedBox(width: 4.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Expenses',
                                  textScaleFactor: textScaleFactor,
                                  style: TextStyles.mediumText16w500
                                      .apply(color: ThemeConfig.white),
                                ),
                                Text(
                                  '\$ 1,840.00',
                                  textScaleFactor: textScaleFactor,
                                  style: TextStyles.mediumText20
                                      .apply(color: ThemeConfig.white),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 397.h,
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transaction History',
                          style: TextStyles.mediumText18,
                        ),
                        Text(
                          'See all',
                          style: TextStyles.inputLabelText,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (context, _) {
                        if (controller.state is HomeStateLoading)
                          return customCircularProgressIndicator(
                            color: ThemeConfig.green,
                          );
                        if (controller.state is HomeStateError)
                          return Center(
                            child: Text('Ocorreu um erro.'),
                          );
                        if (controller.transactions.isEmpty)
                          return Center(
                            child: Text('Você ainda não possui transações.'),
                          );
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: controller.transactions.length,
                          itemBuilder: (context, index) {
                            final item = controller.transactions[index];

                            final color = item.value.isNegative
                                ? ThemeConfig.outcome
                                : ThemeConfig.income;
                            final value = '\$ ${item.value.toStringAsFixed(2)}';
                            return ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8.0),
                              leading: Container(
                                decoration: BoxDecoration(
                                  color: ThemeConfig.antiFlashWhite,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.monetization_on_outlined,
                                ),
                              ),
                              title: Text(
                                item.title,
                                style: TextStyles.mediumText16w500,
                              ),
                              subtitle: Text(
                                DateTime.fromMillisecondsSinceEpoch(item.date)
                                    .toString(),
                                style: TextStyles.smallText13,
                              ),
                              trailing: Text(
                                value,
                                style:
                                    TextStyles.mediumText18.apply(color: color),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
