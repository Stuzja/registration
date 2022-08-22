import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/widgets/navigation_bar/icons.dart';
import '../../resources/constants/colors.dart';

class FloatingNavigationBar extends StatefulWidget {
  final int currentIndex;
  const FloatingNavigationBar({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  State<FloatingNavigationBar> createState() => FloatingNavigationBarState();
}

class FloatingNavigationBarState extends State<FloatingNavigationBar> {
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
        final colorActive = isActive ? Colors.white24 : Colors.transparent;
        return IconWidget(
          colorActive: colorActive,
          image: listIcons[index],
        );
      },
      backgroundColor: ColorClass.purple,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      itemCount: 4,
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
