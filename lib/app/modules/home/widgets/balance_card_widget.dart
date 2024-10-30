import 'dart:developer';

import 'package:finan_control/app/core/extensions/sizes.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/text_styles.dart';
import '../../../core/ui/theme_config.dart';

class BalanceCardWidget extends StatelessWidget {
  const BalanceCardWidget({
    super.key,
    required this.totalAmount,
    required this.incomeAmount,
    required this.outcomeAmount,
  });

  final double totalAmount;
  final double incomeAmount;
  final double outcomeAmount;

  @override
  Widget build(BuildContext context) {
    double textScaleFactor =
        MediaQuery.of(context).size.width <= 360 ? 0.8 : 1.0;

    return Positioned(
      left: 24.w,
      right: 24.w,
      top: 155.w,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 32.h,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: ThemeConfig.black.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(2, 2)),
          ],
          color: ThemeConfig.darkGreen,
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Saldo Total',
                      textScaleFactor: textScaleFactor,
                      style: TextStyles.mediumText16w600
                          .apply(color: ThemeConfig.white),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 250.0.w),
                      child: Text(
                        '\$ ${totalAmount.toStringAsFixed(2)}',
                        textScaleFactor: textScaleFactor,
                        style: TextStyles.mediumText30
                            .apply(color: ThemeConfig.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
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
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 36.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TransactionValueWidget(amount: incomeAmount),
                TransactionValueWidget(amount: outcomeAmount),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionValueWidget extends StatelessWidget {
  const TransactionValueWidget({
    super.key,
    required this.amount,
  });

  final double amount;

  @override
  Widget build(BuildContext context) {
    double textScaleFactor =
        MediaQuery.of(context).size.width <= 360 ? 0.8 : 1.0;

    double iconsSize = MediaQuery.of(context).size.width < 360 ? 16.0 : 24.0;

    return Row(
      mainAxisSize: MainAxisSize.min,
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
            amount.isNegative ? Icons.arrow_downward : Icons.arrow_upward,
            color: ThemeConfig.white,
            size: iconsSize,
          ),
        ),
        SizedBox(width: 4.0),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              amount.isNegative ? 'Despesa' : 'Renda',
              textScaleFactor: textScaleFactor,
              style:
                  TextStyles.mediumText16w500.apply(color: ThemeConfig.white),
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 100.0.w),
              child: Text(
                '\$${amount.toStringAsFixed(2)}',
                textScaleFactor: textScaleFactor,
                style: TextStyles.mediumText18.apply(color: ThemeConfig.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        )
      ],
    );
  }
}
