import 'package:flutter/material.dart';
import '../constants/colors.dart';

enum TransactionCategory {
  salariesDev,
  salariesMg,
  internalHr,
  externalHr,
  credit,
  dividends,
  bankCharges,
  taxes,
  awards,
  others,
  profit,
}

extension FormExtensionCategory on TransactionCategory {
  String get getString {
    switch (this) {
      case TransactionCategory.salariesDev:
        return "Salaries dev.";
      case TransactionCategory.salariesMg:
        return "Salaries mg.";
      case TransactionCategory.internalHr:
        return "Internal HR";
      case TransactionCategory.externalHr:
        return "External HR";
      case TransactionCategory.credit:
        return "Credit";
      case TransactionCategory.dividends:
        return "Dividends";
      case TransactionCategory.bankCharges:
        return "Bank Charges";
      case TransactionCategory.taxes:
        return "Taxes";
      case TransactionCategory.awards:
        return "Awards";
      case TransactionCategory.others:
        return "Others";
      case TransactionCategory.profit:
        return "Profit";
    }
  }

  Color get getColorMain {
    switch (this) {
      case TransactionCategory.salariesDev:
        return ColorClass.salaryDevMain;
      case TransactionCategory.salariesMg:
        return ColorClass.salaryMgMain;
      case TransactionCategory.internalHr:
        return ColorClass.internalHrMain;
      case TransactionCategory.externalHr:
        return ColorClass.externalHrMain;
      case TransactionCategory.credit:
        return ColorClass.creditMain;
      case TransactionCategory.dividends:
        return ColorClass.dividendsMain;
      case TransactionCategory.bankCharges:
        return ColorClass.bankChargesMain;
      case TransactionCategory.taxes:
        return ColorClass.taxesMain;
      case TransactionCategory.awards:
        return ColorClass.awardsMain;
      case TransactionCategory.others:
        return ColorClass.otherMain;
      case TransactionCategory.profit:
        return ColorClass.profitMain;
    }
  }

  Color get getColorTitle {
    switch (this) {
      case TransactionCategory.salariesDev:
        return ColorClass.salaryDevTitle;
      case TransactionCategory.salariesMg:
        return ColorClass.salaryMgTitle;
      case TransactionCategory.internalHr:
        return ColorClass.internalHrTitle;
      case TransactionCategory.externalHr:
        return ColorClass.externalHrTitle;
      case TransactionCategory.credit:
        return ColorClass.creditTitle;
      case TransactionCategory.dividends:
        return ColorClass.dividendsTitle;
      case TransactionCategory.bankCharges:
        return ColorClass.bankChargesTitle;
      case TransactionCategory.taxes:
        return ColorClass.taxesTitle;
      case TransactionCategory.awards:
        return ColorClass.awardsTitle;
      case TransactionCategory.others:
        return ColorClass.otherTitle;
      case TransactionCategory.profit:
        return ColorClass.profitTitle;
    }
  }

  Color get getColorLight {
    switch (this) {
      case TransactionCategory.salariesDev:
        return ColorClass.salaryDevLight;
      case TransactionCategory.salariesMg:
        return ColorClass.salaryMgLight;
      case TransactionCategory.internalHr:
        return ColorClass.internalHrLight;
      case TransactionCategory.externalHr:
        return ColorClass.externalHrLight;
      case TransactionCategory.credit:
        return ColorClass.creditLight;
      case TransactionCategory.dividends:
        return ColorClass.dividendsLight;
      case TransactionCategory.bankCharges:
        return ColorClass.bankChargesLight;
      case TransactionCategory.taxes:
        return ColorClass.taxesLight;
      case TransactionCategory.awards:
        return ColorClass.awardsLight;
      case TransactionCategory.others:
        return ColorClass.otherLight;
      case TransactionCategory.profit:
        return ColorClass.profitLight;
    }
  }
}
