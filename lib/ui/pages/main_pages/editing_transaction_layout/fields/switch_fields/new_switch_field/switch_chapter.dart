import 'package:flutter/material.dart';
import 'package:registration/resources/theme/custom_theme.dart';
import 'package:registration/ui/pages/main_pages/editing_transaction_layout/fields/switch_fields/new_switch_field/switch_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SwitchField extends StatelessWidget {
  final String firstLabel;
  final String secondLabel;
  final String switchTitle;
  final void Function()? onTap;

  const SwitchField({
    Key? key,
    required this.firstLabel,
    required this.secondLabel,
    required this.switchTitle, required this.onTap,
  }) : super(key: key);


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
        Row(
          children: [
            SwitchButton(title: firstLabel, isPicked: false, onTap: onTap),
            SwitchButton(title: secondLabel, isPicked: true, onTap: onTap)
          ],
        ),
      ],
    );
  }
}
