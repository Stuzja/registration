import 'package:flutter/material.dart';
import 'package:registration/widgets/navigation_bar.dart';
import '../../widgets/appbar.dart';
import '../../widgets/budget_widget/base_budget_widget.dart';
import '../../widgets/buttons/floating_bar_button.dart';

class TotalBudgetPage extends StatelessWidget {
  const TotalBudgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        floatingActionButton: const FloatingActionButtonBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const FloatingNavigationBar(currentIndex: 2),
        body: const BaseBudgetWidget(title: "Your total budget", ready: true));
  }
}
