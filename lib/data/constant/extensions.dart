import 'package:flutter/cupertino.dart';

extension StringExtension on String {
  String get capitalizeFirstLetter {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String get firstLetter => isEmpty ? '' : this[0].toUpperCase();

  bool get isValidEmail =>
      RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\'
      r's@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.'
      r'[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.'
      r')+[a-zA-Z]{2,}))$')
          .hasMatch(this);
}

// extension Formatter on num {
//   String get formatCurrency {
//     NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
//     return '${myFormat.simpleCurrencySymbol(GlobalStrings.capitalNGN)}'
//         '${myFormat.format(this)}';
//   }
//
//   String get figureSeparator {
//     NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
//     return myFormat.format(this);
//   }
// }

extension WidgetExtension on Widget {
  Widget pd(EdgeInsetsGeometry padding) =>
      Padding(padding: padding, child: this);
  Widget align(AlignmentGeometry alignment) =>
      Align(alignment: alignment, child: this);
  Widget get EXPANDED => Expanded(child: this);
  Widget get SCROLLVIEW => SingleChildScrollView(child: this);
}

extension DateTimeFormat on DateTime {
  bool isSameDay(DateTime? date) {
    return year == date?.year && month == date?.month && day == date?.day;
  }
}
