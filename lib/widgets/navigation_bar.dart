import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../resources/constants/colors.dart';

class FloatingNavigationBar extends StatelessWidget {
  const FloatingNavigationBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      bottomBarItems: [
        BottomBarItemsModel(
          icon: const Icon(Icons.home_outlined, color: Colors.black),
          iconSelected: const Icon(Icons.home_outlined, color: Colors.black),
          dotColor: Colors.black.withOpacity(0.2),
          onTap: () => Navigator.pushNamed(context, '/home'),
        ),
        BottomBarItemsModel(
          icon: const Icon(Icons.calendar_month_outlined, color: Colors.black),
          iconSelected:
              const Icon(Icons.calendar_month_outlined, color: Colors.black),
          dotColor: Colors.black.withOpacity(0.2),
          onTap: () => Navigator.pushNamed(context, '/plan'),
        ),
        BottomBarItemsModel(
          icon: const Icon(Icons.wallet_sharp, color: Colors.black),
          iconSelected: const Icon(Icons.wallet_sharp, color: Colors.black),
          dotColor: Colors.black.withOpacity(0.2),
          onTap: () => Navigator.pushNamed(context, '/total'),
        ),
        BottomBarItemsModel(
          icon: const Icon(Icons.verified_user_outlined, color: Colors.black),
          iconSelected:
              const Icon(Icons.verified_user_outlined, color: Colors.black),
          dotColor: Colors.black.withOpacity(0.2),
          onTap: () => Navigator.pushNamed(context, '/user'),
        ),
      ],
      bottomBarCenterModel: BottomBarCenterModel(
        centerBackgroundColor: ColorClass.purple,
        centerIcon: const FloatingCenterButton(
          child: Icon(
            Icons.add,
            color: AppColors.black,
          ),
        ),
        centerIconChild: [
          FloatingCenterButtonChild(
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
