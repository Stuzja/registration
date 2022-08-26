import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/resources/constants/colors.dart';
import 'package:registration/resources/theme/custom_theme.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SwitchField extends StatelessWidget {
  final int? initialValue;
  final String firstLabel;
  final String secondLabel;
  final String switchTitle;
  final void Function(int?) onToggle;
  const SwitchField(
      {Key? key,
      required this.firstLabel,
      required this.secondLabel,
      required this.switchTitle,
      required this.onToggle,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            switchTitle,
            style: CustomTheme.lightTheme.textTheme.labelMedium,
          ),
        ),
        ToggleSwitch(
          initialLabelIndex: initialValue ?? 1,
          onToggle: onToggle,
          minWidth: 164.w,
          minHeight: 64.h,
          cornerRadius: 10.0,
          activeBgColors: const [
            [Color.fromRGBO(138, 93, 165, 0.5)],
            [Color.fromRGBO(138, 93, 165, 0.5)]
          ],
          borderColor: const [
            ColorClass.purple,
          ],
          borderWidth: 1,
          activeFgColor: ColorClass.purple,
          inactiveFgColor: ColorClass.purple,
          inactiveBgColor: Colors.white,
          totalSwitches: 2,
          labels: [firstLabel, secondLabel],
          radiusStyle: true,
        ),
      ],
    );
  }
}
