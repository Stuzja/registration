import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../resources/constants/colors.dart';

class FloatingNavigationBar extends StatefulWidget {
  final int currentIndex;
  const FloatingNavigationBar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<FloatingNavigationBar> createState() => FloatingNavigationBarState();
}

class FloatingNavigationBarState extends State<FloatingNavigationBar> {
  var iconList = const [
    Icons.home_outlined,
    Icons.calendar_month_outlined,
    Icons.wallet_sharp,
    Icons.verified_user_outlined,
  ];

  void _onTapNavigate(index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        return;
      case 1:
        Navigator.pushNamed(context, '/plan');
        return;
      case 2:
        Navigator.pushNamed(context, '/total');
        return;
      case 3:
        Navigator.pushNamed(context, '/user');
        return;
    }
  }

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
      activeIndex: widget.currentIndex,
      onTap: (index) => setState(
        () {
          _onTapNavigate(index);
        },
      ),
    );
  }
}
