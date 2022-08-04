import 'package:flutter/material.dart';
import 'package:registration/models/transaction_category.dart';
import 'package:registration/widgets/navigation_bar.dart';
import '../widgets/budget_layout.dart/base_budget_widget.dart';

class TotalBudgetPage extends StatelessWidget {
  const TotalBudgetPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const FloatingNavigationBar(),
        body: BaseBudgetWidget(
            title: "Your total budget", list: listTransactionReady));
  }
}
