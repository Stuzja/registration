import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/widgets/buttons/floating_bar_button.dart';
import 'package:registration/widgets/line_chart/line_chart_widget.dart';
import 'package:registration/widgets/top_widget/top_widget.dart';
import '../widgets/navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingActionButtonBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const FloatingNavigationBar(
        currentIndex: 0,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const TopWidget(title: "Your total expenses", ready: true),
              SizedBox(
                height: 570.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [LineChartWidget()],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
