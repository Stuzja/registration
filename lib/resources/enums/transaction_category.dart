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

   String get getName{
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

  String get getString {
    switch (this) {
      case TransactionCategory.salariesDev:
        return "salaryDev";
      case TransactionCategory.salariesMg:
        return "salaryMg";
      case TransactionCategory.internalHr:
        return "internalHr";
      case TransactionCategory.externalHr:
        return "externalHr";
      case TransactionCategory.credit:
        return "credit";
      case TransactionCategory.dividends:
        return "dividends";
      case TransactionCategory.bankCharges:
        return "bankCharges";
      case TransactionCategory.taxes:
        return "taxes";
      case TransactionCategory.awards:
        return "awards";
      case TransactionCategory.others:
        return "other";
      case TransactionCategory.profit:
        return "profit";
    }
  }

  Color get getColorMain {
    switch (this) {
      case TransactionCategory.salariesDev:
        return salaryDevMain;
      case TransactionCategory.salariesMg:
        return salaryMgMain;
      case TransactionCategory.internalHr:
        return internalHrMain;
      case TransactionCategory.externalHr:
        return externalHrMain;
      case TransactionCategory.credit:
        return creditMain;
      case TransactionCategory.dividends:
        return dividendsMain;
      case TransactionCategory.bankCharges:
        return bankChargesMain;
      case TransactionCategory.taxes:
        return taxesMain;
      case TransactionCategory.awards:
        return awardsMain;
      case TransactionCategory.others:
        return otherMain;
      case TransactionCategory.profit:
        return profitMain;
    }
  }

  Color get getColorTitle {
    switch (this) {
      case TransactionCategory.salariesDev:
        return salaryDevTitle;
      case TransactionCategory.salariesMg:
        return salaryMgTitle;
      case TransactionCategory.internalHr:
        return internalHrTitle;
      case TransactionCategory.externalHr:
        return externalHrTitle;
      case TransactionCategory.credit:
        return creditTitle;
      case TransactionCategory.dividends:
        return dividendsTitle;
      case TransactionCategory.bankCharges:
        return bankChargesTitle;
      case TransactionCategory.taxes:
        return taxesTitle;
      case TransactionCategory.awards:
        return awardsTitle;
      case TransactionCategory.others:
        return otherTitle;
      case TransactionCategory.profit:
        return profitTitle;
    }
  }

  Color get getColorLight {
    switch (this) {
      case TransactionCategory.salariesDev:
        return salaryDevLight;
      case TransactionCategory.salariesMg:
        return salaryMgLight;
      case TransactionCategory.internalHr:
        return internalHrLight;
      case TransactionCategory.externalHr:
        return externalHrLight;
      case TransactionCategory.credit:
        return creditLight;
      case TransactionCategory.dividends:
        return dividendsLight;
      case TransactionCategory.bankCharges:
        return bankChargesLight;
      case TransactionCategory.taxes:
        return taxesLight;
      case TransactionCategory.awards:
        return awardsLight;
      case TransactionCategory.others:
        return otherLight;
      case TransactionCategory.profit:
        return profitLight;
    }
  }
}
