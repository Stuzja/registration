import 'package:flutter/material.dart';
import 'package:registration/ui/pages/main_pages/user_page.dart';

import '../../common_widgets/navigation_bar/floating_bar_button.dart';
import '../../common_widgets/navigation_bar/navigation_bar.dart';

import 'budget_page/budget_page.dart';
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
  BaseBudgetPage(ready: false),
  BaseBudgetPage(title: "Your total budget", ready: true),
  UserPage()
];
