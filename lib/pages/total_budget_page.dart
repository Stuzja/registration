import 'package:flutter/material.dart';
import 'package:registration/widgets/navigation_bar.dart';
import '../widgets/budget_layout.dart/base_budget_widget.dart';
import '../widgets/buttons/floating_bar_button.dart';

class TotalBudgetPage extends StatelessWidget {
  const TotalBudgetPage({Key? key}) : super(key: key);
  
  get listTransactionReady => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingActionButtonBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       bottomNavigationBar: const FloatingNavigationBar(currentIndex: 2,),
        body: BaseBudgetWidget(
            title: "Your total budget", list: listTransactionReady));
  }
}
