import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/repositories/transactions_repository.dart';
import 'package:registration/widgets/page_view_months.dart';
import '../resources/formatters/formatters.dart';
import '../resources/theme/custom_theme.dart';

class TopWidget extends StatelessWidget {
  final String? title;
  final bool ready;
  const TopWidget({Key? key, this.title, required this.ready})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          /*Text("<         Jule         >",
              style: CustomTheme.lightTheme.textTheme.headline1
                  ?.copyWith(color: Colors.white)),*/
          const PageViewMonths(),
          StreamBuilder(
            stream:
                ActionsWithTransactionsRepository().storageTrans.snapshots(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              var sum = ActionsWithTransactionsRepository()
                  .getResultMoney(snapshot: snapshot, ready: ready);
              return Column(children: [
                Text(Formatters().getTitleFromMoney(title, sum),
                    style: CustomTheme.lightTheme.textTheme.headline1),
                Text("₽$sum",
                    style: CustomTheme.lightTheme.textTheme.headline1
                        ?.copyWith(color: Colors.white, fontSize: 32)),
              ]);
            },
          ),
        ],
      ),
    );
  }
}
