import 'package:flutter/material.dart';
import 'package:registration/widgets/budget_layout.dart/base_budget_widget.dart';
import '../models/transaction_category.dart';
import '../widgets/navigation_bar.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BaseBudgetWidget(title: "Profit", list: listTransaction));
  }
}
