import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:registration/widgets/navigation_bar/icons.dart';
import '../../resources/constants/colors.dart';

class FloatingNavigationBar extends StatefulWidget {
  final void Function(int) setIndex;
  const FloatingNavigationBar({Key? key, required this.setIndex})
      : super(key: key);

  @override
  State<FloatingNavigationBar> createState() => FloatingNavigationBarState();
}

class FloatingNavigationBarState extends State<FloatingNavigationBar> {
  int index = 0;
  
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
        activeIndex: index,
        onTap: (newIndex) {
          widget.setIndex(newIndex);
          setState(() {
            index = newIndex;
          });
        });
  }
}
