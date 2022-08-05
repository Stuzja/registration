import 'package:flutter/material.dart';
import 'package:registration/widgets/budget_layout.dart/base_budget_widget.dart';
import '../models/transaction_category.dart';
import '../widgets/buttons/floating_bar_button.dart';
import '../widgets/navigation_bar.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingActionButtonBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       bottomNavigationBar: const FloatingNavigationBar(currentIndex: 1,),
        body: BaseBudgetWidget(title: "Profit", list: listTransaction));
  }
}
