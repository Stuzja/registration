import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/widgets/line_chart/line_chart_widget.dart';
import 'package:registration/widgets/top_widget/top_widget.dart';
import '../../blocs/transactions/bloc/transactions_bloc.dart';
import '../../repositories/transactions_repository.dart';

class GraphicPage extends StatelessWidget {
  const GraphicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TransactionsBloc(repository: ActionsWithTransactionsRepository())
            ..add(FetchEvent()),
      child: ListView(
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
      ),
    );
  }
}
