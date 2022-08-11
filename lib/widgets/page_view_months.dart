import 'package:flutter/material.dart';

import '../resources/theme/custom_theme.dart';

class PageViewMonths extends StatelessWidget {
  const PageViewMonths({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.custom(childrenDelegate: SliverChildBuilderDelegate(
      (context, index) {
        Text("<         Jule         >",
            style: CustomTheme.lightTheme.textTheme.headline1
                ?.copyWith(color: Colors.white));
      },
    ));
  }
}
