import 'package:flutter/material.dart';
import 'package:registration/widgets/appbar.dart';
import '../widgets/buttons/back_button.dart';
import '../widgets/buttons/main_button.dart';
import '../widgets/editing_transaction_layout/fields/date_field.dart';
import '../widgets/editing_transaction_layout/fields/description_field.dart';
import '../widgets/editing_transaction_layout/fields/drop_down_field.dart';
import '../widgets/editing_transaction_layout/fields/money_field.dart';
import '../widgets/editing_transaction_layout/fields/switch_field.dart';


class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController description = TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11),
                    child: CustomBackButton(),
                  ),
                  Text(
                    'Add a transaction',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Nunito',
                    ),
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
              controller: description,
              nameField: "Description",
              onChanged: ((s) {}),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: MainButtonDark(name: 'Add', onPressed: () {}),
            )
          ],
        ),
      )),
    );
  }
}
