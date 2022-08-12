import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/month_year_model.dart';
import '../resources/theme/custom_theme.dart';

class PageViewMonths extends StatefulWidget {
  const PageViewMonths({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PageViewMonthsState();
}

class PageViewMonthsState extends State<PageViewMonths> {
  MonthYear monthYear = MonthYear.fromDateTime(DateTime.now());
  PageController pageController = PageController(initialPage: 999);
  int pageChanged = 999;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33.h,
//      width: 184.w,
      alignment: Alignment.center,
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        IconButton(
            onPressed: () {
              pageController.animateToPage(--pageChanged,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.bounceInOut);
            },
            icon: const Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Colors.white,
            )),
        SizedBox(
          width: 120.w,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                pageChanged = index;
              });
            },
            itemBuilder: (context, index) {
              return Text("Jule",
                  textAlign: TextAlign.center,
                  style: CustomTheme.lightTheme.textTheme.headline1
                      ?.copyWith(color: Colors.white));
            },
          ),
        ),
        IconButton(
            onPressed: () {
              pageController.animateToPage(++pageChanged,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.bounceInOut);
            },
            icon: const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.white,
            )),
      ]),
    );
  }
}
