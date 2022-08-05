import 'package:flutter/material.dart';

import '../../resources/theme/custom_theme.dart';
import '../buttons/back_button.dart';
import '../buttons/main_button.dart';
import 'fields/date_field.dart';
import 'fields/description_field.dart';
import 'fields/drop_down_field.dart';
import 'fields/money_field.dart';
import 'fields/switch_field.dart';

class BaseEditingTransactionWidget extends StatelessWidget {
  final String title;
  const BaseEditingTransactionWidget({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var descriptionController = TextEditingController();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11),
                    child: CustomBackButton(),
                  ),
                  Text(
                    title,
                    style: CustomTheme.lightTheme.textTheme.headline1,
                  ),
                ],
              ),
            ),
            const SwitchField(
              firstLabel: 'Profit',
              secondLabel: "Loss",
              switchTitle: 'Transaction type',
            ),
            const SwitchField(
              firstLabel: 'OK',
              secondLabel: "Wait",
              switchTitle: 'Status',
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: DateTextField(),
            ),
            const DropDownField(dropItem: ['dsadads', 'daddqwd']),
            const MoneyField(
              nameField: "Enter Amount",
            ),
            DescriptionField(
              controller: descriptionController,
              nameField: "Description",
              onChanged: ((s) {}),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: MainButtonDark(name: 'Add', onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
