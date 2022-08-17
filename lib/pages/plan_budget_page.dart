import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/budget_layout/base_budget_widget.dart';
import '../widgets/buttons/floating_bar_button.dart';
import '../widgets/navigation_bar.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomAppBar(),
        floatingActionButton: const FloatingActionButtonBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const FloatingNavigationBar(currentIndex: 1),
        body: const BaseBudgetWidget(ready: false));
  }
}
