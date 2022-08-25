import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/blocs/transactions/bloc/transactions_bloc.dart';
import 'package:registration/repositories/transactions_repository.dart';
import 'package:registration/resources/constants/colors.dart';

import 'bottom_title_widget.dart';
import 'left_title_widget.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.70,
      child: Container(
        padding:
            EdgeInsets.only(right: 18.w, left: 12.w, top: 24.h, bottom: 12.h),
        child: BlocBuilder<TransactionsBloc, TransactionsState>(
            builder: (context, state) {
          if (state is FetchState) {
            return LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 1,
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 66,
                      interval: 1,
                      getTitlesWidget: bottomTitleWidgets,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: leftTitleWidgets,
                      reservedSize: 42,
                    ),
                  ),
                ),
                lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                        tooltipBgColor: ColorClass.purple)),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 12,
                minY: -1,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    spots: TransactionRepository().getSpotsForGraphic(
                        listTrans: state.transactionsByYear),
                    isCurved: true,
                    gradient: const LinearGradient(
                      colors: [
                        ColorClass.almostWhite,
                        ColorClass.purple,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    barWidth: 4,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
