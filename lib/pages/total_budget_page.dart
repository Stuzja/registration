import 'package:flutter/material.dart';
import 'package:registration/widgets/navigation_bar.dart';
import '../widgets/budget_layout/base_budget_widget.dart';
import '../widgets/buttons/floating_bar_button.dart';

class TotalBudgetPage extends StatelessWidget {
  const TotalBudgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        floatingActionButton: FloatingActionButtonBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: FloatingNavigationBar(currentIndex: 2),
        body: BaseBudgetWidget(title: "Your total budget", ready: true));
  }
}
