import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common_widgets/line_chart/line_chart_widget.dart';
import '../../common_widgets/top_widget/top_widget.dart';

class GraphicPage extends StatelessWidget {
  const GraphicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            const TopWidget(
                title: "Your total expenses", ready: true, monthly: false),
            Container(
              alignment: Alignment.topCenter,
              height: 500.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [LineChartWidget()],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
