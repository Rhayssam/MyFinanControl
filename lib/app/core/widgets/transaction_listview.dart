import 'package:flutter/material.dart';

import '../models/transaction_model.dart';
import '../ui/text_styles.dart';
import '../ui/theme_config.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({
    super.key,
    required this.transactionList,
    this.itemCount,
  });

  final List<TransactionModel> transactionList;
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: itemCount ?? transactionList.length,
      itemBuilder: (context, index) {
        final item = transactionList[index];

        final color =
            item.value.isNegative ? ThemeConfig.outcome : ThemeConfig.income;
        final value = '\$ ${item.value.toStringAsFixed(2)}';
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
          leading: Container(
            decoration: BoxDecoration(
              color: ThemeConfig.antiFlashWhite,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
            DateTime.fromMillisecondsSinceEpoch(item.date).toString(),
            style: TextStyles.smallText13,
          ),
          trailing: Text(
            value,
            style: TextStyles.mediumText18.apply(color: color),
          ),
        );
      },
    );
  }
}
