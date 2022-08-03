import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/resources/constants/colors.dart';
import '../resources/theme/custom_theme.dart';
import '../widgets/navigation_bar.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const FloatingNavigationBar(),
      body: Column(
        children: [
          Container(
              height: 124.h,
              width: 363.w,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(60.0),
                    bottomLeft: Radius.circular(60.0)),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(138, 93, 165, 1),
                    Color.fromRGBO(25, 152, 207, 1),
                  ],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                
                ),
              ),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text("<         Jule         >",
                    style: CustomTheme.lightTheme.textTheme.headline1
                        ?.copyWith(color: Colors.white)),
                Text("Plan", style: CustomTheme.lightTheme.textTheme.headline1),
                Text("₽900.000",
                    style: CustomTheme.lightTheme.textTheme.headline1
                        ?.copyWith(color: Colors.white, fontSize: 32)),
              ])),
          SizedBox(
            height: 145.h,
            child: ListView(scrollDirection: Axis.horizontal),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Column(children: [
              const Divider(color: ColorClass.greyDark),
              SizedBox(
                height: 393.h,
                child: ListView(),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
