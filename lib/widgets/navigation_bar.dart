import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:registration/pages/plan_budget_page.dart';
import '../resources/constants/colors.dart';

class FloatingNavigationBar extends StatefulWidget {
  const FloatingNavigationBar({Key? key}) : super(key: key);

  @override
  State<FloatingNavigationBar> createState() => _FloatingNavigationBarState();
}

class _FloatingNavigationBarState extends State<FloatingNavigationBar> {
  var iconList = const [
    Icons.home_outlined,
    Icons.calendar_month_outlined,
    Icons.wallet_sharp,
    Icons.verified_user_outlined,
  ];

  @override
  void initState() {
    super.initState();
    // AnimationController _hideBottomBarAnimationController = AnimationController(
    //   duration: Duration(milliseconds: 200),
    //   vsync: this,
    // );
  }

  void actionOnTap(index) {
    if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PlanPage()));
    }
  }

  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      tabBuilder: (int index, bool isActive) {
        final color =
            isActive ? Colors.white : const Color.fromRGBO(255, 255, 255, 0.2);
        return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: color,
              )
            ]);
      },
      backgroundColor: ColorClass.purple,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      itemCount: iconList.length,
      splashColor: const Color.fromRGBO(255, 255, 255, 0.2),
      activeIndex: _bottomNavIndex,
      onTap: (index) => setState(() {
        _bottomNavIndex = index;
        print(_bottomNavIndex);
        actionOnTap(_bottomNavIndex);
      }),
    );
  }
}
