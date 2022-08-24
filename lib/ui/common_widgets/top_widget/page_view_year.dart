import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/blocs/transactions/bloc/transactions_bloc.dart';
import 'package:registration/resources/theme/custom_theme.dart';

class PageViewYear extends StatefulWidget {
  const PageViewYear({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PageViewYearState();
}

class PageViewYearState extends State<PageViewYear> {
  int year = DateTime.now().year;
  PageController pageController = PageController(initialPage: 999);
  int pageChanged = 999;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33.h,
      alignment: Alignment.center,
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        IconButton(
            onPressed: () {
              pageController.animateToPage(--pageChanged,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.bounceInOut);
              year -= 1;
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
                if (index < pageChanged) {
                  year -= 1;
                }
                if (index > pageChanged) {
                  year += 1;
                }
                pageChanged = index;
              });
              BlocProvider.of<TransactionsBloc>(context)
                  .add(DateChanged(newYear: year));
            },
            itemBuilder: (context, index) {
              return Text(year.toString(),
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
              year += 1;
            },
            icon: const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.white,
            )),
      ]),
    );
  }
}
