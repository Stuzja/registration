import 'package:flutter/material.dart';
import '../widgets/budget_layout/base_budget_widget.dart';
import '../widgets/buttons/floating_bar_button.dart';
import '../widgets/navigation_bar.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        floatingActionButton: FloatingActionButtonBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: FloatingNavigationBar(currentIndex: 1),
        body: BaseBudgetWidget(title: "Profit", ready: false));
  }
}
