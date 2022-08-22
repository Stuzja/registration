import 'package:flutter/material.dart';
import 'package:registration/pages/main_pages/user_page.dart';
import 'package:registration/widgets/buttons/floating_bar_button.dart';
import '../../widgets/budget_widget/base_budget_widget.dart';
import '../../widgets/navigation_bar/navigation_bar.dart';
import 'graphic_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int index = 0;

  void setIndex(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: const FloatingActionButtonBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: FloatingNavigationBar(setIndex: setIndex),
        body: pages[index]);
  }
}

List<Widget> pages = const [
  GraphicPage(),
  BaseBudgetWidget(ready: false),
  BaseBudgetWidget(title: "Your total budget", ready: true),
  UserPage()
];

