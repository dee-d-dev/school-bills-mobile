import 'package:intl/intl.dart';

extension DoubleExt on double {
  String get price => NumberFormat.simpleCurrency(
        name: 'NGN',
        decimalDigits: 2,
      ).format(this);

  String get trim => toStringAsFixed(2);
}

extension StringExt on String {
  String get routeName {
    if (startsWith('/')) {
      return split('/').last;
    }
    return this;
  }

  double get price => double.parse(replaceAll(RegExp(r'[^\d.]'), ''));
}

extension ListExt on List {
  int get lastIndex => length - 1;
}
