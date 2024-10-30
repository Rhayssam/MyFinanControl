import 'package:flutter/material.dart';

import 'package:finan_control/app/core/widgets/app_header.dart';
import 'package:finan_control/app/core/widgets/custom_circular_progress_indicator.dart';
import 'package:finan_control/app/modules/home/home_controller.dart';
import 'package:finan_control/app/modules/home/home_state.dart';
import 'package:finan_control/app/modules/home/widgets/balance_card_widget.dart';
import 'package:finan_control/locator.dart';
import 'package:finan_control/app/core/extensions/sizes.dart';
import 'package:finan_control/app/core/ui/text_styles.dart';
import 'package:finan_control/app/core/ui/theme_config.dart';
import '../../core/widgets/transaction_listview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = locator.get<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.getAllTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppHeader(),
          BalanceCardWidget(
            totalAmount: 1234.56,
            incomeAmount: 1234.56,
            outcomeAmount: -1234.56,
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
                      if (controller.state is HomeStateLoading) {
                        return customCircularProgressIndicator(
                          color: ThemeConfig.green,
                        );
                      }
                      if (controller.state is HomeStateError) {
                        return Center(
                          child: Text('Ocorreu um erro.'),
                        );
                      }
                      if (controller.transactions.isEmpty) {
                        return Center(
                          child: Text('Você ainda não possui transações.'),
                        );
                      }
                      return TransactionListView(
                        transactionList: controller.transactions,
                        itemCount: 6,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
